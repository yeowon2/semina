<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예산분류</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/mis/bdg/bdg_0010.css"/>"/>

    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-grid.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-pagination.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-date-picker.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-time-picker.css"/>"/>
</head>
<body>
    <c:set var="now" value="<%=new java.util.Date()%>"/>
    <c:set var="nowYear"><fmt:formatDate value="${now}" pattern="yyyy"/></c:set>

    <div class="grid_layout">
        <%@ include file="../../template.jsp" %>
            <div class="main">
                <div class="head">
                    <div class="menu_title_wrap">
                        <h1>예산분류관리</h1>
                    </div>
                    <div class="bread_crumb_wrap">
                        <span>예산관리</span>
                        <span>/</span>
                        <span>코드관리</span>
                        <span>/</span>
                        <span class="current_menu">예산분류관리</span>
                    </div>
                </div>
                <div class = "body">
                    <div class="btn_container">
                        <button class = "btn gray_btn">도움말</button>
                        <button class = "btn excel_btn" id="excelBtn">엑셀</button>
                        <button class = "btn white_btn">저장</button>
                        <button class = "btn primary_btn" id ="searchBtn">조회</button>
                    </div>

                    <div class = "search_container">
                        <form id="searchForm">
                            <div>
                                <label for="budgYy">예산년도</label>
                                <input type="number" name="budgYy" class="input_text" id ="budgYy" maxlength="4" oninput="numberMaxLengthCheck(this, 'year')" value="${nowYear}" />
                            </div>
                            <div>
                                <label for="busiYn">사업여부</label>
                                <select name="busiYn" id="busiYn" class="input_text">
                                    <option value="">전체</option>
                                    <option value="Y">사업</option>
                                    <option value="N">운영비</option>
                                    <option value="Z">적립금</option>
                                </select>
                            </div>
                            <div>
                                <label for="corpCd">사업장</label>
                                <select name="corpCd" id="corpCd" class="input_text">
                                    <c:forEach var="busiList" items="${busiList}">
                                        <option value="${busiList.corpCd}">${busiList.corpNm}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </form>
                    </div>
                    <div class="grid_wrap">
                        <div id ="bdgGrid" class="grid">
                            <div class="grid_title_wrap">
                                <h3>예산분류내역</h3>
                            </div>
                            <div class = "row_button_wrap">
                                <button class="btn primary_btn" id="addRow">행추가</button>
                                <button class="btn danger_btn" id="deleteRow">행삭제</button>
                            </div>
                        </div>
                        <div id="bdgDtlGrid" class="grid">
                            <div class="grid_title_wrap">
                                <h3>예산분류 상세내역</h3>
                            </div>
                        </div>
                    </div>
                </div>
    </div>
</body>
    <script src="<c:url value="/resources/js/template.js"/>"></script>
    <script src="<c:url value="/resources/lib/tui-grid/sheetJS.js"/>"></script>
    <%-- 엑셀 내보내기 그리드보다 앞에 있어야함--%>
    <script src="<c:url value="/resources/lib/tui-grid/tui-pagination.js"/>"></script>
    <script src="<c:url value="/resources/lib/tui-grid/tui-grid.js"/>"></script>
    <script src="<c:url value="/resources/lib/qs.js"/>"></script>
    <script src="<c:url value="/resources/lib/axios.js"/>"></script>

    <%-- Toast-Grid Custom Renderer --%>
    <script src="<c:url value="/resources/js/custom-renderer.js"/>"></script>
    <%-- 공통 js--%>
    <script src="<c:url value="/resources/js/common.js"/>"></script>
    <script>
        let bdg0010;
        let Grid = tui.Grid;

        class Bdg0010 {
            searchForm;
            bdgGrid;
            bdgDtlGrid;

            constructor() {
                this.searchForm = document.getElementById('searchForm');
                this.initBdgGrid();
                this.initBdgDtlGrid();

                document.getElementById('excelBtn').addEventListener('click', () => {
                   excelDown();
                });
                document.getElementById('searchBtn').addEventListener('click', () => {
                    this.bdgGridSearch();
                })

                document.getElementById('addRow').addEventListener('click', () => {
                    this.addRow();
                })
                document.getElementById('deleteRow').addEventListener('click', () => {
                    this.deleteRow();
                })
            }

            initBdgGrid = () => {
                // 그리드생성
                const setBdgGridColumn = [
                    {header:'예산년도', name: 'budgYy', align:'center',
                        editor: {type:'text'}
                    },
                    {header: '코드', name: 'bdgStdCd', hidden:true},
                    {header: '코드명', name: 'bdgStdNm',
                        editor: {type:'text'}
                    },
                    {header: '사업여부', name: 'busiYn', align: 'center', formatter:'listItemText',
                        editor: {
                            type:'select',
                            options: {
                                listItems: [
                                    {text : '선택', value:''},
                                    {text : '사업', value:'Y'},
                                    {text : '운영비', value:'N'},
                                    {text : '적립금', value:'Z'},
                                ]
                            }
                        }
                    },
                ];

                const dataSource = {
                    api: {
                        readData: {
                            url: '/mis/bdg/bdg-0010/findByBdgList',
                            method: 'GET',
                            initParams : {
                                corpCd: this.searchForm.corpCd.value,
                                busiYn: this.searchForm.busiYn.value,
                                budgYy: this.searchForm.budgYy.value
                            }
                        },
                        serializer(params) {
                            return Qs.stringify(params);
                        },
                        initialRequest: false,
                    }
                };

                this.bdgGrid = new Grid({
                    el: document.getElementById('bdgGrid'),
                    columns: setBdgGridColumn,
                    data: dataSource,
                    bodyHeight: 550,
                    editingEvent: 'dblclick',
                });

                this.bdgGrid.on('click', (e) => {
                    let dtlParams = {
                        corpCd: this.searchForm.corpCd.value,
                        budgYy: this.bdgGrid.getValue(e.rowKey, 'budgYy'),
                        bdgStdCd: this.bdgGrid.getValue(e.rowKey, 'bdgStdCd'),
                        busiYn: this.bdgGrid.getValue(e.rowKey, 'busiYn'),
                    }
                    this.bdgDtlGridSearch(dtlParams);
                });
            };

            bdgGridSearch = () => {
                let params = {
                    corpCd: this.searchForm.corpCd.value,
                    busiYn: this.searchForm.busiYn.value,
                    budgYy: this.searchForm.budgYy.value
                }
                this.bdgGrid.readData(undefined, params, true);
            }

            addRow = () => {
                let rowData = [{
                    budgYy: this.searchForm.budgYy.value,
                    bdgStdCd: '',
                    bdgStdNm:'',
                    busiYn:'',
                }];

                this.bdgGrid.appendRows(rowData, {
                    at: this.bdgGrid.getRowCount(),
                    focus:true,
                });
                this.bdgGrid.enable();
            }

            deleteRow = () => {
                let rowKey = this.bdgGrid.getFocusedCell().rowKey;
                this.bdgGrid.removeRow(rowKey);
            }

            initBdgDtlGrid = () => {
                const setBdgDtlGridColumn = [
                    {header:'구분', name:'div'},
                ];

                const dataSource = {
                    api:{
                        readData:{
                            url:'/mis/bdg/bdg-0010/findByBdgDtlList',
                            method:'GET',
                            /*initParams : {
                                budgYy : budgYy,
                                busiYn : busiYn,
                                bdgStdCd : bdgStdCd,
                                corpCd: corpCd
                            }*/
                        }
                    }
                }

                this.bdgDtlGrid = new Grid({
                    el: document.getElementById('bdgDtlGrid'),
                    columns: setBdgDtlGridColumn,
                    data: dataSource,
                    bodyHeight: 550,
                    treeColumnOptions: {
                          name:'div',
                          useIcon: true,
                          useCascadingCheckbox: false
                      },
                      onGridUpdated: () => {
                          this.bdgDtlGrid.expandAll();
                      },
                })
            }

            bdgDtlGridSearch = (params) => {
                let dtlParams = {
                    budgYy : params.budgYy,
                    busiYn : params.busiYn,
                    bdgStdCd : params.bdgStdCd,
                    corpCd: params.corpCd
                }
                this.bdgDtlGrid.readData(undefined, dtlParams, true);
            }
        }

        window.addEventListener('load', () => {
            bdg0010 = new Bdg0010();
            bdg0010.bdgGridSearch();
        });

        excelDown = () => {
            const options = {
                includeHeader: true,
                fileName: '예산분류관리',
                useFormattedValue: true,
            }
            bdg0010.bdgDtlGrid.export('xlsx', options);
        }

    </script>

</html>
