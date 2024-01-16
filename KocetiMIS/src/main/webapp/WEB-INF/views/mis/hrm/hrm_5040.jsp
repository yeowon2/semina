<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>교육신청현황</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/mis/hrm/hrm_5040.css"/>"/>
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
                <h1>교육신청현황</h1>
            </div>
            <div class="bread_crumb_wrap">
                <span>인사관리</span>
                <span>/</span>
                <span>교육관리</span>
                <span>/</span>
                <span>교육등록</span>
                <span>/</span>
                <span class="current_menu">교육신청</span>
            </div>
        </div>
        <div class="body">
            <c:set var="date" value="<%=new java.util.Date()%>"/>
            <c:set var="today"><fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/></c:set>
            <c:set var="nowYY"><fmt:formatDate value="${date}" pattern="yyyy"/></c:set>
            <c:set var="nowMM"><fmt:formatDate value="${date}" pattern="MM"/></c:set>

            <form id="hrm5040SearchForm">
                <div class="top">
                    <h2>검색조건</h2>
                    <div class="btn_container">
                        <button class="btn gray_btn" type="button" id="helpBtn">도움말</button>
                        <button class="btn excel_btn" type="button" id="excelBtn">엑셀</button>
                        <button class="btn white_btn" type="button" id="btn_reg">신청</button>
                        <button class="btn primary_btn" type="button" id="searchBtn">조회</button>
                    </div>
                </div>

                <div class="input_box_wrap">
                    <div class="input_box">
                        <label>신청일자</label>
                        <div>
                            <input class="input_text" type="date" name="rqstSdt" value="${nowYY}-01-01"/>
                            <span>~</span>
                            <input class="input_text" type="date" name="rqstEdt" value="${today}"/>
                        </div>
                    </div>
                    <div class="input_box">
                        <label>교육시작년월</label>
                        <div>
                            <input class="input_text" type="month" name="eduRqstSdt" value="${nowYY}-01"/>
                            <span>~</span>
                            <input class="input_text" type="month" name="eduRqstEdt" value="${nowYY}-${nowMM}"/>
                        </div>
                    </div>
                    <div class="input_box">
                        <label>결재상태</label>
                        <select class="input_text" id="apvStatCd" name="apvStatCd">
                            <option value="" selected>선택</option>
                            <c:forEach var="codeList" items="${codeList}">
                                <option value="${codeList.code}">${codeList.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="input_box">
                        <label>교육등록구분</label>
                        <select class="input_text" name="cmpYn">
                            <option value="" selected>전체</option>
                            <option value="Y">일괄교육</option>
                            <option value="N">개인교육</option>
                        </select>
                    </div>
                    <div class="input_box">
                        <label>신청자/교육자</label>
                        <div>
                            <input class="input_text emp_nm" type="text" name="rqstEmpNm"/>
                            <input class="input_text emp_no" type="text" name="rqstEmpNo" readonly/>
                            <button type="button" class="btn primary_btn" id="callEmpPop">검색</button>
                        </div>
                    </div>
                    <div class="input_box">
                        <label>신청부서</label>
                        <div>
                            <input class="input_text dept_nm" type="text" name="rqstDeptNm"/>
                            <input class="input_text dept_no" type="text" name="rqstDeptCd" readonly/>
                            <button type="button" class="btn primary_btn" id="callDeptPop">검색</button>
                        </div>
                    </div>
                </div>
            </form>

            <div class="grid_container">
                <div id="hrm5040Grid"></div>
            </div>

            <%@ include file="../../common/emp_sch.jsp" %>
            <%@ include file="../../common/dept_sch.jsp" %>
            <%@ include file="hrm_5041.jsp" %>
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
        let hrm5040;
        let Grid = tui.Grid;

        class Hrm5040 {
            grid;
            searchFormEl;
            approvalCodeList;

            constructor() {
                this.searchFormEl = document.getElementById('hrm5040SearchForm');
                this.initEvent();
                this.initGrid();
                this.initGridEvent();
            }

            initEvent() {
                document.getElementById('excelBtn').addEventListener('click', this.excelDown);
                document.getElementById('searchBtn').addEventListener('click', this.hrm5040Search);
                document.getElementById('btn_reg').addEventListener('click', () => {
                    this.openPopup();
                });
            }

            initGrid() {
                const columns = [
                    {
                        header: '교육등록구분',
                        name: 'cmpNm',
                        align: 'center',
                        width: 80
                    },
                    {
                        header: '신청번호',
                        name: 'eduRqstNo',
                        align: 'center',
                        width: 150,
                    },
                    {
                        header: '신청구분',
                        name: 'rqstCls',
                        align: 'center',
                        width: 60,
                    },
                    {
                        header: '신청일',
                        name: 'rqstDt',
                        renderer: {
                            type: DateFormatRenderer
                        },
                        align: 'center',
                        width: 80,
                    },
                    {
                        header: '결재상태코드',
                        name: 'apvStatCd',
                        hidden: true,
                    },
                    {
                        header: '결재상태',
                        name: 'apvStatNm',
                        align: 'center',
                        width: 70,
                    },
                    {
                        header: '문서',
                        name: 'gwDocNo',
                        renderer: {
                            type: GwDocIconRenderer
                        },
                        align: 'center',
                        width: 40,
                    },
                    {
                        header: '신청자명',
                        name: 'rqstEmpNm',
                        align: 'center',
                        width: 70,
                    },
                    {
                        header: '신청자사번',
                        name: 'rqstEmpNo',
                        align: 'center',
                        width: 70,
                    },
                    {
                        header: '신청부서',
                        name: 'rqstDeptNm',
                        align: 'left',
                        width: 150,
                    },
                    {
                        header: '교육자명',
                        name: 'empNm',
                        align: 'left',
                        width: 120,
                    },
                    {
                        header: '교육시작일',
                        name: 'eduFrmDt',
                        renderer: {
                            type: DateFormatRenderer
                        },
                        align: 'center',
                        width: 80,
                    },
                    {
                        header: '교육종료일',
                        name: 'eduToDt',
                        renderer: {
                            type: DateFormatRenderer
                        },
                        align: 'center',
                        width: 80,
                    },
                    {
                        header: '교육명',
                        name: 'eduCrsNm',
                        align: 'left',
                        width: 200,
                    },
                    {
                        header: '총 교육시간',
                        name: 'eduTime',
                        align: 'center',
                        width: 70,
                    },
                    {
                        header: '교육비',
                        name: 'eduAmt',
                        renderer: {
                            /*type : moneyFormatRenderer*/
                        },
                        align: 'right',
                        width: 70,
                    },
                    {
                        header: '교육기관명',
                        name: 'eduOrgNm',
                        align: 'center',
                        width: 180,
                    },
                    {
                        header: '환급여부',
                        name: 'rtnYn',
                        align: 'center',
                        width: 60,
                    },
                    {
                        header: '환급금액',
                        name: 'rtnAmt',
                        renderer: {
                            /*type : moneyFormatRenderer*/
                        },
                        align: 'right',
                        width: 70,
                    },
                ];

                const dataSource = {
                    api: {
                        readData: {url: '/mis/hrm/hrm-5040/findByList', method: 'GET'}
                    },
                    initialRequest: false
                };

                this.grid = new Grid({
                    el: document.getElementById('hrm5040Grid'),
                    columns: columns,
                    data: dataSource,
                    bodyHeight: 'fitToParent',
                    rowHeaders: ['rowNum'],
                    scrollY: true,
                    scrollX: true,
                });
            }

            initGridEvent() {
                this.grid.on('dblclick', (e) => {
                    let rqstNo = this.grid.getValue(e.rowKey, 'eduRqstNo');
                    this.openPopup(rqstNo);
                });
            }

            // 조회
            hrm5040Search = () => {
                let formData = new FormData(this.searchFormEl);
                let params = {};

                formData.forEach((value, key) => params[key] = value);
                this.grid.readData(undefined, params, true);
            };

            openPopup = (rqstNo) => {
                hrm5041Modal.hrm5041ModalOpen(rqstNo);
            }

            excelDown = () => {
                const options = {
                    includeHeader: true,
                    fileName: '교육신청현황',
                    useFormattedValue: true,
                }
                this.grid.export('xlsx', options);
            }
        }

        window.addEventListener('load', () => {
            hrm5040 = new Hrm5040();
            hrm5040.hrm5040Search();

            empSchModal = new EmpSchModal();
            deptSchModal = new DeptSchModal();
            hrm5041Modal = new Hrm5041Modal();
        });

        document.getElementById('callEmpPop').addEventListener('click', () => {
            let form = document.getElementById('hrm5040SearchForm');
            empSchModal.selectEvent = () => {
                form.rqstEmpNm.value = empSchModal.selectedEmpInfo.empNm;
                form.rqstEmpNo.value = empSchModal.selectedEmpInfo.empNo;
            };
            empSchModal.modalOpen();
        });

        document.getElementById('callDeptPop').addEventListener('click', () => {
            let form = document.getElementById('hrm5040SearchForm');
            deptSchModal.selectEvent = () => {
                form.rqstDeptCd.value = deptSchModal.selectedDeptInfo.deptCd;
                form.rqstDeptNm.value = deptSchModal.selectedDeptInfo.deptNm;
            };
            deptSchModal.modalOpen();
        });

    </script>
</div>
</body>
</html>
