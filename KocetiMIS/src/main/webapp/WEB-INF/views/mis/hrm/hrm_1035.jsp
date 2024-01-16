<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>임용계약현황</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/mis/hrm/hrm_1035.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>

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
                <h1>임용계약현황</h1>
            </div>
            <div class="bread_crumb_wrap">
                <div>
                    <span class="material-symbols-outlined weight-300 icon">home</span>
                    <span>경영관리시스템</span>
                    <span class="material-symbols-outlined weight-300 icon">chevron_right</span>
                    <span>인사관리</span>
                    <span class="material-symbols-outlined weight-300 icon">chevron_right</span>
                    <span>임용관리</span>
                    <span class="material-symbols-outlined weight-300 icon">chevron_right</span>
                    <span class="current_menu">임용계약현황</span>
                </div>
            </div>
        </div>
        <div class="body">
            <form id="hrm1035SearchForm">
                <div class="top">
                    <h2>검색조건</h2>
                    <div class="btn_container">
                        <button type="button" class="btn gray_btn" id="helpBtn">도움말</button>
                        <button type="button" class="btn excel_btn" id="excelBtn">엑셀</button>
                        <button type="button" class="btn primary_btn" id="searchBtn">조회</button>
                    </div>
                </div>

                <div class="input_box_wrap">
                    <div class="input_box">
                        <label>발령종류</label>
                        <div class="checkbox_wrap">
                            <c:forEach var="apntList" items="${apntList}" >
                                <div>
                                    <input type="checkbox" name="appntCls" value= ${apntList.appntCd}/>
                                    <label>${apntList.appntNm}</label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="input_box">
                        <label>성명</label>
                        <div>
                            <input class="input_text emp_nm" type="text" name="empNm"/>
                            <input class="input_text emp_no" type="text" name="empNo" readonly/>
                            <button type="button" class="btn primary_btn" id="callEmpPop">검색</button>
                        </div>
                    </div>
                    <div class="input_box">
                        <label>계약종료일</label>
                        <div>
                            <input class="input_text" type="date" name="contStartDate"/>
                            ~
                            <input class="input_text" type="date" name="contEndDate"/>
                        </div>
                    </div>
                    <div class="input_box">
                        <label>계약종료연도</label>
                        <input class="input_text" type="text" name="contEndYY" maxlength="4"/>
                    </div>
                </div>
            </form>

            <%@ include file="../../common/emp_sch.jsp" %>
            <div class="grid_container">
                <div id="grid">
                    <span class="resultRowCnt"></span>
                </div>
            </div>
        </div>
    </div>

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
        let hrm1035;
        let Grid = tui.Grid;

        class Hrm1035 {
            el;
            grid;

            constructor(el) {
                this.el = el;

                // document.getElementById('helpBtn').addEventListener('click', this.help);
                document.getElementById('excelBtn').addEventListener('click', () => this.excelDown());
                document.getElementById('searchBtn').addEventListener('click', () => this.hrm1035Search());
            }

            loadResultGrid() {
                const columns = [
                    {
                        header: '부서코드',
                        name: 'curDeptCd',
                        hidden: true
                    },
                    {
                        header: '부서',
                        name: 'curDeptNm',
                        align: 'left',
                        width: 140
                    },
                    {
                        header: '사번',
                        name: 'empNo',
                        align: 'center',
                        width: 60
                    },
                    {
                        header: '성명',
                        name: 'empNm',
                        align: 'center',
                        width: 70
                    },
                    {
                        header: '입사일자',
                        name: 'entDt',
                        align: 'center',
                        width: 100,
                        renderer: {
                            type: DateFormatRenderer
                        }
                    },
                    {
                        header: '계약일자',
                        name: 'appntDt',
                        align: 'center',
                        width: 100,
                        renderer: {
                            type: DateFormatRenderer
                        }
                    },
                    {
                        header: '계약종료일자',
                        name: 'appntToDt',
                        align: 'center',
                        width: 100,
                        renderer: {
                            type: DateFormatRenderer
                        }
                    },
                    {
                        header: '발령종류',
                        name: 'appntNm',
                        align: 'center',
                        width: 110
                    },
                    {
                        header: '발령부서',
                        name: 'deptNm',
                        align: 'left',
                        width: 140
                    },
                    {
                        header: '고용형태',
                        name: 'empClsNm',
                        align: 'center',
                        width: 60
                    },
                    {
                        header: '직종',
                        name: 'jobNm',
                        align: 'center',
                        width: 60
                    },
                    {
                        header: '직급',
                        name: 'grdNm',
                        align: 'center',
                        width: 80
                    },

                    {
                        header: '직위',
                        name: 'jobPostNm',
                        align: 'center',
                        width: 70
                    },
                    {
                        header: '연구행정구분',
                        name: 'wrkClsNm',
                        align: 'center',
                        width: 50
                    },
                    {
                        header: '호봉',
                        name: 'salStep',
                        align: 'center',
                        width: 40
                    },
                    {
                        header: '비고',
                        name: 'rmk',
                    }
                ];
                const dataSource = {
                    api: {
                        readData: {url: '/mis/hrm/hrm-1035/findByList', method: 'GET'}
                    },
                    serializer(params) {
                        return Qs.stringify(params, {
                            arrayFormat: 'repeat'
                        });
                    },
                    initialRequest: false
                };

                this.resultGrid = new Grid({
                    el: document.getElementById('grid'),
                    columns: columns,
                    data: dataSource,
                    rowHeaders: ['rowNum'],
                    bodyHeight: 'fitToParent',
                    scrollY: true,
                    bodyHeight: 490,
                    onGridUpdated: () => {
                        let rowCnt = this.resultGrid.getRowCount();
                        let resultRowCnt = document.querySelector('.resultRowCnt');

                        resultRowCnt.innerHTML =
                            '검색결과' + '<span>' + ' ' + rowCnt + '건</span>'
                    }
                });
            }

            // 검색
            hrm1035Search = () => {
                let form = document.getElementById('hrm1035SearchForm');
                let checkValue = document.querySelectorAll('input[name="appntCls"]:checked');
                let isChecked = [];

                checkValue.forEach(data => {
                    isChecked.push(data.value);
                });

                const params = {
                    empNo: form.empNo.value,
                    contStartDate: form.contStartDate.value,
                    contEndDate: form.contEndDate.value,
                    contEndYY: form.contEndYY.value,
                    appntCls: isChecked
                }
                this.resultGrid.readData(undefined, params, true);
            };

            excelDown = () => {
                const options = {
                    includeHeader: true,
                    fileName: '임용계약현황',
                    useFormattedValue: true,
                }
                this.resultGrid.export('xlsx', options);
            }
        }

        /* 페이지 로딩시 */
        window.addEventListener('load', () => {
            hrm1035 = new Hrm1035();
            hrm1035.loadResultGrid();
            empSchModal = new EmpSchModal();
            hrm1035.hrm1035Search();
            this.setRefreshObserver(hrm1035.resultGrid);
        });

        /** 사원검색 버튼 클릭 이벤트 */
        document.getElementById('callEmpPop').addEventListener('click', () => {
            empSchModal.selectEvent = () => {
                console.log(empSchModal.selectedEmpInfo);
                let form = document.getElementById('hrm1035SearchForm');
                let selectedEmpInfo = empSchModal.selectedEmpInfo;
                form.empNm.value = selectedEmpInfo.empNm;
                form.empNo.value = selectedEmpInfo.empNo;
            };
            empSchModal.modalOpen();
        });
    </script>
</div>
</body>
</html>
