<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일반예산코드관리</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/mis/bdg/bdg_0022.css"/>"/>

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
                <h1>일반예산코드관리</h1>
            </div>
            <div class="bread_crumb_wrap">
                <span>예산관리</span>
                <span>/</span>
                <span>코드관리</span>
                <span>/</span>
                <span class="current_menu">일반예산코드관리</span>
            </div>
        </div>
        <div class = "body">
            <div class="button_container">
                <button class="btn gray_btn">도움말</button>
                <button class="btn white_btn">전년도내역복사</button>
                <button class="btn white_btn">저장</button>
                <button class="btn primary_btn" id ="searchBtn">조회</button>
            </div>

            <div class="search_container">
                <form id="searchForm" onsubmit="return false">
                    <div class="searchForm_align_left">
                        <div class="div_gap">
                            <label for="budgYy">예산년도</label>
                            <input id="budgYy" type="number" name="budgYy" class="input_text" maxlength="4" oninput="numberMaxLengthCheck(this, 'year')" value="${nowYear}" />
                        </div>
                        <div class="div_gap">
                            <label for="busiPlcCd">사업장</label>
                            <select id="busiPlcCd" name="busiPlcCd" class="input_text">
                                <c:forEach var="busiList" items="${busiList}">
                                    <option value="${busiList.corpCd}">${busiList.corpNm}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="searchForm_align_right">
                        <div class="div_gap">
                            <label for="plcItmNm">원비목명</label>
                            <input id="plcItmNm" name="plcItmNm" type="text" class="input_text"/>
                        </div>
                        <div class="div_gap">
                            <label>사용여부</label>
                            <input name="useYn" type="radio" value="" checked/><span>전체</span>
                            <input name="useYn" type="radio" value="Y"/><span>사용</span>
                            <input name="useYn" type="radio" value="N"/><span>미사용</span>
                        </div>
                    </div>
                </form>
            </div>

            <div class="grid_wrap">
                <div id="grid1" class="grid">
                    <div class="grid_subTitle">
                        <div>
                            <h4>검색결과</h4>
                            <div class="resultRowCnt"></div>
                        </div>
                        <div class="grid_button_container">
                            <button class="btn white_btn">원비목관리</button>
                        </div>
                    </div>
                </div>
                <div id="grid2" class="grid">
                    <div class="grid_subTitle">
                        <h4>일반예산 골격</h4>
                        <div>
                            <h4>선택된 일반예산 : </h4>
                            <div class="selectedBudgNm" id="selectedBudgNm"></div>
                        </div>
                        <div class="grid_button_container">
                            <button class="btn white_btn">초기화</button>
                            <button class="btn danger_btn">행삭제</button>
                        </div>
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
    let bdg0022;
    let Grid = tui.Grid;

    class Bdg0022 {
        searchForm;
        codeList;
        bdgStdCodeList;
        resultGrid1;
        resultGrid2;

        constructor() {
            this.searchForm = document.getElementById('searchForm');
            this.init();
        }

        initGrid1 = () => {
            const setGrid1Column = [
                {header:'원비목코드', name:'plcItmCd', align:'center'},
                {header:'원비목명', name:'plcItmNm', align:'left'},
            ]
            const dataSource ={
                api:{
                    readData:{url: '/mis/bdg/bdg-0022/findByBdgPlcItmCdList',method: 'GET',}
                },
                initialRequest: false,
            }

            this.resultGrid1 = new Grid({
                el:document.getElementById('grid1'),
                columns: setGrid1Column,
                data: dataSource,
                bodyHeight:500,
            });

            this.resultGrid1.on('onGridUpdated', (e) => {
                let rowCnt = this.resultGrid1.getRowCount();
                let resultRowCnt = document.querySelector('.resultRowCnt');

                resultRowCnt.innerHTML =
                    '<p>검색결과 ' + rowCnt + '건</p>'
            })
        }

        initGrid2 = () => {
            const setGrid2Column = [
                {header:'일반예산', name:'plcBudgNm', editor:'text'},
                {header:'원비목코드', name:'plcItmCd', width:100, align:'center'},
                {header:'예산분류', name:'bdgStdCd', width:150,
                    formatter: 'listItemText',
                    editor : {
                        type: 'select',
                        options: {
                            listItems : this.bdgStdCodeList
                        }
                    },
                },
                {header:'순서', name:'ordNo', width: 60, align:'center', editor: 'text'},
                {header:'수입/지출', name:'ieCls', width:80, align:'center',
                    formatter: 'listItemText',
                        editor: {
                            type:'select',
                            options: {
                                listItems: [
                                    {text:'수입', value:'I'},
                                    {text:'지출', value:'E'}
                                ]
                            }
                        }
                }
            ]

            const dataSource = {
                api : {
                    readData:{url:'/mis/bdg/bdg-0022/findByBdgPlcList',method: 'GET', }
                },
                initialRequest: false,
            }

            this.resultGrid2 = new Grid({
                el:document.getElementById('grid2'),
                columns:setGrid2Column,
                data:dataSource,
                treeColumnOptions : {
                    name:'plcBudgNm',
                    useIcon:true,
                    useCascadingCheckbox:false
                },
                bodyHeight:500,
            });

            this.resultGrid2.on('beforeRequest', (e) => {
                this.resultGrid2.clear();
            });

            this.resultGrid2.on('onGridUpdated', (e) => {
                this.reloadGrid();
                this.resultGrid2.expandAll();
            });

            this.resultGrid2.on('click', (e) => {
               let ordNo = this.resultGrid2.getValue(e.rowKey, 'ordNo');
               let plcBudgNm = this.resultGrid2.getValue(e.rowKey, 'plcBudgNm');
               let selectedBudgNm = document.getElementById('selectedBudgNm');

               if(ordNo === 1) {
                   selectedBudgNm.innerHTML = plcBudgNm;
               } else {
                   selectedBudgNm.innerHTML = '';
               }

            });
        }

         async init() {
            await this.findBybdgStdCodeList();
            await this.initEvent();
            this.initData();
        }

        initData() {
            this.initGrid1();
            this.initGrid2();
            this.grid1Search();
        }

        async initEvent() {
            document.getElementById('searchBtn').addEventListener('click', async () => {
                this.grid1Search();
                await this.findBybdgStdCodeList();
            });

            this.searchForm.plcItmNm.addEventListener('keypress', async (e) => {
                if(e.keyCode === 13) {
                    this.grid1Search();
                    await this.findBybdgStdCodeList();
                }
            })
        }

        async findBybdgStdCodeList() {
            let params = {
                budgYy : this.searchForm.budgYy.value,
                busiYn : 'N'
            };
            this.bdgStdCodeList = formatCommonCodes(await getBdgStdCodeList(params));
        }

        grid1Search = () => {
            let params = {
                budgYy:this.searchForm.budgYy.value,
                busiPlcCd:this.searchForm.busiPlcCd.value,
                plcItmNm:this.searchForm.plcItmNm.value,
                useYn:this.searchForm.useYn.value,
            }
            this.resultGrid1.readData(undefined, params, true);
            this.grid2Search(params);
        }

        grid2Search = (params) => {
            this.resultGrid2.readData(undefined, params, true);
        }

        /*
        * 예산분류코드(selectBox)가 년도에따라 동적으로 변경됨
        * setGrid2Column -> listItems가 동적변경이 안된다하여,
        * 예산분류 코드를 받아온 후 그리드를 다시 그림
        * */
        reloadGrid = () => {
            this.resultGrid2.setColumns([
                {header:'일반예산', name:'plcBudgNm', editor:'text'},
                {header:'원비목코드', name:'plcItmCd', width:100, align:'center'},
                {header:'예산분류', name:'bdgStdCd', width:150,
                    formatter: 'listItemText',
                    editor : {
                        type: 'select',
                        options: {
                            listItems : this.bdgStdCodeList
                        }
                    },
                },
                {header:'순서', name:'ordNo', width: 60, align: 'center', editor: 'text'},
                {header:'수입/지출', name:'ieCls', width:80, align: 'center',
                    formatter: 'listItemText',
                    editor: {
                        type:'select',
                        options: {
                            listItems: [
                                {text:'수입', value:'I'},
                                {text:'지출', value:'E'}
                            ]
                        }
                    }
                }
            ]);
        }
    }

    window.addEventListener('load', () => {
        bdg0022 = new Bdg0022();
    })
</script>


</html>
