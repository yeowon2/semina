<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MIS</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/mis/hrm/hrm_3010.css"/>"/>

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
                <h1>인사자료조회</h1>
            </div>
            <div class="bread_crumb_wrap">
                <div>
                    <span class="material-symbols-outlined weight-300 icon">home</span>
                    <span>경영관리시스템</span>
                    <span class="material-symbols-outlined weight-300 icon">chevron_right</span>
                    <span>현황관리</span>
                    <span class="material-symbols-outlined weight-300 icon">chevron_right</span>
                    <span class="current_menu">인사자료조회</span>
                </div>
            </div>
        </div>

        <div class="body">
            <form id="hrm3010SearchForm">
                <div class="top">
                    <h2>검색조건</h2>
                    <div class="btn_container">
                        <button type="button" class="btn primary_btn search_btn">조회</button>
                    </div>
                </div>

                <div class="input_box_wrap">
                    <div class="input_box">
                        <label>기준일자</label>
                        <c:set var="today" value="<%=new java.util.Date()%>"/>
                        <input type="date" name="bsDt" class="input_text" value="<fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/>">
                    </div>
                    <div class="input_box">
                        <label>성명</label>
                        <div>
                            <input type="text" name="empNm" class="input_text emp_nm">
                            <input type="text" name="empNo" class="input_text emp_no" readonly="">
                            <button class="btn primary_btn" id="searchEmpBtn" type="button">검색</button>
                        </div>
                    </div>
                    <div class="input_box">
                        <label>부서</label>
                        <div>
                            <input type="text" name="deptNm" class="input_text dept_nm">
                            <input type="text" name="deptCd" class="input_text dept_no" readonly>
                            <button class="btn primary_btn" id="searchDeptBtn" type="button">검색</button>
                        </div>
                    </div>
                </div>

            </form>

            <div class="tab_container">
                <button class="tab on">기본</button>
                <button class="tab">기본</button>
                <button class="tab">기본</button>
            </div>

            <div class="grid_container">
                <div id="defaultGrid"></div>
            </div>


            <%-- 사원검색 모달 --%>
            <%@ include file="../../common/emp_sch.jsp" %>
            <%-- 부서검색 모달 --%>
            <%@ include file="../../common/dept_sch.jsp" %>

        </div>
    </div>
</div>


<script src="<c:url value="/resources/js/template.js"/>"></script>

<%-- Toast-Grid --%>
<script src="<c:url value="/resources/lib/tui-grid/tui-pagination.js"/>"></script>
<script src="<c:url value="/resources/lib/tui-grid/tui-grid.js"/>"></script>
<script src="<c:url value="/resources/lib/qs.js"/>"></script>
<script src="<c:url value="/resources/lib/axios.js"/>"></script>

<%-- Toast-Grid Custom Renderer --%>
<script src="<c:url value="/resources/js/custom-renderer.js"/>"></script>

<%-- 공통 js--%>
<script src="<c:url value="/resources/js/common.js"/>"></script>

<script>
    let currentGrid;
    let defaultGrid;

    const Grid = tui.Grid;
    Grid.setLanguage('ko');

    class DefaultGrid {
        grid;

        constructor() {
            this.initGird();
        }

        initGird() {
            const columns = [
                {
                    header: "부서",
                    name: 'deptNm',
                    align: 'center',
                    width: 160,
                    rowSpan: true
                },
                {
                    header: '사번',
                    name: 'empNo',
                    align: 'center',
                    rowSpan: true
                },
                {
                    header: '성명',
                    name: 'empNm',
                    align: 'center'
                },
                {
                    header: '성별',
                    name: 'sexDist',
                    align: 'center'
                },
                {
                    header: '주민등록번호',
                    name: 'resNo',
                    align: 'center',
                    width: 140
                },
                {
                    header: '나이',
                    name: 'age',
                    align: 'center'
                },
                {
                    header: '재직구분',
                    name: 'holdOffiNm',
                    align: 'center'
                },
                {
                    header: '고용형태',
                    name: 'empClsNm',
                    align: 'center',
                },
                {
                    header: '직위',
                    name: 'jobPostNm',
                    align: 'center'
                },
                {
                    header: '직급',
                    name: 'grdNm',
                    align: 'center'
                },
                {
                    header: '호봉',
                    name: 'salStep',
                    align: 'center'
                },
                {
                    header: '입사구분',
                    name: 'entClsNm',
                    align: 'center',
                    width: 80
                },
                {
                    header: '채용구분',
                    name: 'emplClsNm',
                    align: 'center',
                    width: 80
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
                    header: '근속기준일',
                    name: 'gunsokDt',
                    align: 'center',
                    width: 100,
                    renderer: {
                        type: DateFormatRenderer
                    }
                },
                {
                    header: '퇴직구분',
                    name: 'rsignCls',
                    align: 'center',
                    width: 80
                },
                {
                    header: '퇴직일자',
                    name: 'rsignDt',
                    align: 'center',
                    width: 100,
                    renderer: {
                        type: DateFormatRenderer
                    }
                },
                {
                    header: '최종학력',
                    name: 'lastSchla',
                    align: 'center',
                    width: 'auto'
                },
                {
                    header: '최종학교명',
                    name: 'lastSchlNm',
                    align: 'center',
                    width: 'auto'
                },
                {
                    header: 'E-MAIL',
                    name: 'emailAddr',
                    align: 'center',
                    width: 'auto'
                },
            ];
            const dataSource = {
                api: {
                    readData: {
                        url: '/mis/hrm/hrm-3010/default-list',
                        initParams: {
                            empNm: '',
                            deptNm: '',
                            bsDt: '20231207',
                            resNoYn: 'N'
                        },
                        method: 'GET'
                    }
                },
                initialRequest: true
            };

            this.grid = new Grid({
                el: document.getElementById('defaultGrid'),
                columns: columns,
                data: dataSource,
                bodyHeight: 'fitToParent',
                minRowHeight: 20,
                rowHeight: 30,
                rowHeaders: ['rowNum']
            });
        }
    }

    function search(grid) {
        let searchForm = document.getElementById('hrm3010SearchForm');
        let bsDt = '';
        searchForm.bsDt.value.split('-').forEach(text => bsDt += text);
        let params = {
            bsDt: bsDt,
            empNm: searchForm.empNm.value,
            deptNm: searchForm.deptNm.value,
            resNoYn: 'N'
        };

        grid.readData(undefined, params, true);
    }

    (function init() {
        defaultGrid = new DefaultGrid();
        empSchModal = new EmpSchModal();
        deptSchModal = new DeptSchModal();

        //TODO 현재그리드 임시설정
        currentGrid = defaultGrid.grid;

        document.getElementById('searchEmpBtn').addEventListener('click', function () {
            empSchModal.selectEvent = () => {
                let searchForm = document.getElementById('hrm3010SearchForm');
                searchForm.empNm.value = empSchModal.selectedEmpInfo.empNm;
                searchForm.empNo.value = empSchModal.selectedEmpInfo.empNo;
            };
            empSchModal.modalOpen();
        });

        document.getElementById('searchDeptBtn').addEventListener('click', function () {
            deptSchModal.selectEvent = () => {
                let searchForm = document.getElementById('hrm3010SearchForm');
                searchForm.deptNm.value = deptSchModal.selectedDeptInfo.deptNm;
                searchForm.deptCd.value = deptSchModal.selectedDeptInfo.deptCd;
            }
            deptSchModal.modalOpen();
        });

        document.getElementById('hrm3010SearchForm').querySelector('.search_btn').addEventListener('click', function () {
            search(currentGrid);
        });
    })();

</script>
</body>
</html>
