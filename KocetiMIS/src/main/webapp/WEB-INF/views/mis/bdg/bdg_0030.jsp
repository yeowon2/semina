<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비목코드관리</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/mis/bdg/bdg_0030.css"/>"/>

    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-grid.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-pagination.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-date-picker.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-time-picker.css"/>"/>
</head>
<body>
<div class="grid_layout">
    <%@ include file="../../template.jsp" %>
    <div class="main">
        <div class="head">
            <div class="menu_title_wrap">
                <h1>비목코드관리</h1>
            </div>
            <div class="bread_crumb_wrap">
                <span>예산관리</span>
                <span>/</span>
                <span>코드관리</span>
                <span>/</span>
                <span class="current_menu">비목코드관리</span>
            </div>
        </div>
        <div class = "body">
            <div class="btn_container">
                <button class = "btn gray_btn">도움말</button>
                <button class = "btn excel_btn" id="excelBtn">엑셀</button>
                <button class = "btn white_btn" id="newBtn">신규</button>
                <button class = "btn white_btn" id="saveBtn">저장</button>
                <button class = "btn danger_btn" id="deleteBtn">삭제</button>
                <button class = "btn primary_btn" id ="searchBtn">조회</button>
            </div>

            <div class = "search_container">
                <form id="searchForm" name="searchForm" onsubmit="return false">
                    <div>
                        <label for="sBusiPlcCd">사업장</label>
                        <select id="sBusiPlcCd" name="sBusiPlcCd" class="input_text">
                            <c:forEach var="busiList" items="${busiList}">
                                <option value="${busiList.corpCd}">${busiList.corpNm}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="use_yn">
                        <label for="sUseYn">사용여부</label>
                        <input id="sUseYn" name="sUseYn" type="radio" value="" class="input_text" checked /><span>전체</span>
                        <input name="sUseYn" type="radio" value="Y" class="input_text"/><span>사용</span>
                        <input name="sUseYn" type="radio" value="N" class="input_text"/><span>미사용</span>
                    </div>
                    <div>
                        <label for="sExpnItmNm">비목명</label>
                        <input id="sExpnItmNm" name="sExpnItmNm" type="text" class="input_text"/>
                    </div>
                </form>
            </div>

            <div class="data_wrap">
                <div class="grid_wrap">
                    <div class="grid_text">
                        <h3>비목코드내역</h3>
                        <div class="resultRowCnt"></div>
                    </div>
                    <div id="grid"></div>
                </div>
                <div class="dtl_wrap">
                    <h3>상세내역</h3>
                    <form id="detailForm" name="detailForm">
                        <div>
                            <label for="expnItmCd">비목코드</label>
                            <input id="expnItmCd" name="expnItmCd" type="text" class="input_text input_readonly" disabled/>
                        </div>
                        <div>
                            <label for="expnItmNm">비목명</label>
                            <input id="expnItmNm" name="expnItmNm" type="text" class="input_text"/>
                        </div>
                        <div>
                            <label for="expnItmEngNm">비목영문</label>
                            <input id="expnItmEngNm" name="expnItmEngNm" type="text" class="input_text"/>
                        </div>
                        <div class="use_yn">
                            <label for="useYn">사용여부</label>
                            <input name="useYn" id="useYn" type="radio" value="Y" class="input_text"/><span>사용</span>
                            <input name="useYn" type="radio" value="N" class="input_text"/><span>미사용</span>
                        </div>
                        <div>
                            <label for="expnItmCls">비목구분</label>
                            <select id="expnItmCls" name="expnItmCls" class="input_text">
                                <option value="">선택하세요</option>
                                <c:forEach var="commonCodeList" items="${commonCodeList}">
                                    <option value="${commonCodeList.code}">${commonCodeList.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div>
                            <label for="busiPlcCd">사업장</label>
                            <select id="busiPlcCd" name="busiPlcCd" class="input_text">
                                <c:forEach var="busiList" items="${busiList}">
                                    <option value="${busiList.corpCd}">${busiList.corpNm}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div>
                            <label for="rmk">비고</label>
                            <textarea id="rmk" name="rmk" class="input_text"></textarea>
                        </div>
                    </form>
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
    let bdg0030;
    let Grid = tui.Grid;

    class Bdg0030 {
        detailForm;
        searchForm;
        resultGrid;

        constructor() {
            this.searchForm = document.getElementById('searchForm');
            this.detailForm = document.getElementById('detailForm');
            this.initGrid();

            document.getElementById('newBtn').addEventListener('click', () => {
                newData()
            });
            document.getElementById('searchBtn').addEventListener('click', () => {
                searchData()
            });
            document.getElementById('excelBtn').addEventListener('click', () => {
                excelDown()
            });

            this.searchForm.sExpnItmNm.addEventListener('keypress', (e) => {
                if(e.keyCode === 13) {
                    searchData();
                }
            })
        }


        initGrid = () => {
            const setGridColumn = [
                {header: '비목코드', name: 'expnItmCd', align: 'center'},
                {header: '비목명', name: 'expnItmNm', align: 'left'},
                {header: '비목영문', name: 'expnItmEngNm', hidden: true},
                {header: '비목구분', name: 'bdgExpnCls', hidden: true},
                {header: '사업장', name: 'busiPlcCd', hidden: true},
                {header: '사용여부', name: 'useYn', hidden: true},
                {header: '비고', name: 'rmk', hidden: true},
            ]

            const dataSource = {
                api: {
                    readData: {
                        url: '/mis/bdg/bdg-0030/findByExpnItemList',
                        method: 'GET',
                        initParams: {
                            busiPlcCd: this.searchForm.sBusiPlcCd.value,
                            useYn: this.searchForm.sUseYn.value,
                            expnItmNm: this.searchForm.sExpnItmNm.value,
                            expnDiv: 'A2',          // 운영비
                        }
                    },
                }
            }

            this.resultGrid = new Grid({
                el: document.getElementById('grid'),
                columns: setGridColumn,
                data: dataSource,
                bodyHeight: 500,
                onGridUpdated: () => {
                    let rowCnt = this.resultGrid.getRowCount();
                    let resultRowCnt = document.querySelector('.resultRowCnt');

                    resultRowCnt.innerHTML =
                        '<p>검색결과 ' + rowCnt + '건</p>'
                },
            });

            this.resultGrid.on('click', (e) => {
                this.dtlShow(e);
            });
        }

        dtlShow = (e) => {
            let expnItmCd = this.resultGrid.getValue(e.rowKey, "expnItmCd");
            let expnItmNm = this.resultGrid.getValue(e.rowKey, "expnItmNm");
            let expnItmEngNm = this.resultGrid.getValue(e.rowKey, "expnItmEngNm");
            let useYn = this.resultGrid.getValue(e.rowKey, "useYn");
            let busiPlcCd = this.resultGrid.getValue(e.rowKey, "busiPlcCd");
            let rmk = this.resultGrid.getValue(e.rowKey, "rmk");
            let expnItmCls = this.resultGrid.getValue(e.rowKey, "expnItmCls");

            document.getElementById('expnItmCd').value = expnItmCd;                         // 비목코드
            document.getElementById('expnItmNm').value = expnItmNm;                         // 비목명
            document.getElementById('expnItmEngNm').value = expnItmEngNm;                   // 비목영문명
            detailForm.elements.useYn.value = useYn;                                        // 사용여부
            document.getElementById('busiPlcCd').value = busiPlcCd;                         // 사업장코드
            document.getElementById('rmk').value = rmk;                                     // 비고
            if(expnItmCls !== null &&  expnItmCls !== undefined && expnItmCls !== '') {     // 비목구분
                document.getElementById('expnItmCls').value = expnItmCls;
            } else {
                document.getElementById('expnItmCls').value = '';
            }
        }
    }

    window.addEventListener('load', () => {
        bdg0030 = new Bdg0030();
    });


    let newData = () => {
        document.getElementById('expnItmCd').value = '';        // 비목코드
        document.getElementById('expnItmNm').value =  '';       // 비목명
        document.getElementById('expnItmEngNm').value =  '';    // 비목영문명
        detailForm.elements.useYn.value = 'Y';                  // 사용여부
        document.getElementById('expnItmCls').value = '';       // 비목구분
        document.getElementById('busiPlcCd').value =  '01';     // 사업장 코드(건설기계부품연구원 설정)
        document.getElementById('rmk').value =  '';             // 비고
    }

    let searchData = () => {
        let params = {
            busiPlcCd : bdg0030.searchForm.sBusiPlcCd.value,
            useYn : bdg0030.searchForm.sUseYn.value,
            expnItmNm : bdg0030.searchForm.sExpnItmNm.value,
            expnDiv : 'A2',          // 운영비
        }
        bdg0030.resultGrid.readData(undefined, params, true);
    }

    let excelDown = () => {
        const options = {
            includeHeader: true,
            fileName : '비목코드관리',
            useFormattedValue: true,
        }
        bdg0030.resultGrid.export('xlsx', options);
    }

</script>

</html>
