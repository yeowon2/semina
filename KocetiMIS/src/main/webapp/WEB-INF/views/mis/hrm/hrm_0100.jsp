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
    <link rel="stylesheet" href="<c:url value="/resources/css/mis/hrm/hrm_0100.css"/>"/>

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
                <h1>인사발령신청</h1>
            </div>
            <div class="bread_crumb_wrap">
                <div>
                    <span class="material-symbols-outlined weight-300 icon">home</span>
                    <span>경영관리시스템</span>
                    <span class="material-symbols-outlined weight-300 icon">chevron_right</span>
                    <span>임용관리</span>
                    <span class="material-symbols-outlined weight-300 icon">chevron_right</span>
                    <span class="current_menu">인사발령신청</span>
                </div>
            </div>
        </div>

        <div class="body">
            <form id="hrm0100SearchForm" method="get">
                <div class="top">
                    <h2>검색조건</h2>
                    <div class="btn_container">
                        <button type="button" class="btn white_btn reset_btn">초기화</button>
                        <button type="button" class="btn primary_btn submit_btn">조회</button>
                        <button type="button" class="btn primary_btn rq_btn">신청</button>
                    </div>
                </div>
                <div class="input_box_wrap">
                    <div class="input_box">
                        <c:set var="date" value="<%=new java.util.Date()%>"/>
                        <c:set var="today"><fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/></c:set>
                        <c:set var="nowYY"><fmt:formatDate value="${date}" pattern="yyyy"/></c:set>

                        <label>발령일자</label>
                        <div class="datepicker_wrap">
                            <input type="date" name="frDt" class="input_text" value="${nowYY}-01-01"/>
                            ~
                            <input type="date" name="toDt" class="input_text" value="${today}"/>
                        </div>
                    </div>
                    <div class="input_box">
                        <label>발령내용</label>
                        <input type="text" name="appntCont" class="input_text"/>
                    </div>
                    <div class="input_box">
                        <label>성명</label>
                        <div>
                            <input type="text" name="empNm" class="input_text emp_nm"/>
                            <input type="text" name="empNo" class="input_text emp_no" readonly/>
                            <button class="btn primary_btn" id="searchEmpBtn" type="button">검색</button>
                        </div>
                    </div>
                </div>
            </form>

            <%@ include file="hrm_0105.jsp" %>
            <%@ include file="../../common/emp_sch.jsp" %>


            <div class="grid_container">
                <div id="appntGrid"></div>
            </div>

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
    const Grid = tui.Grid;
    Grid.setLanguage('ko');

    class AppntReqListGrid {
        grid;

        constructor() {
            this.initGrid();
            this.initEvent();
        }

        initEvent() {
            this.grid.on('dblclick', (ev) => {
                if (ev.columnName === 'gwDocNo') {
                    let gwDocNo = this.grid.getValue(ev.rowKey, 'gwDocNo');
                    loadGwDoc(gwDocNo);
                } else {
                    let appntNo = this.grid.getValue(ev.rowKey, 'appntNo');
                    appntEmpModal.setAppntReqInfo(this.grid.getRow(ev.rowKey));
                    appntEmpModal.modalOpen(appntNo, {disable: true, blank: false});
                }
            });
        }

        initGrid() {
            const columns = [
                {
                    header: "신청번호",
                    name: 'appntNo',
                    align: 'center',
                    width: 180
                },
                {
                    header: '결재상태',
                    name: 'apvStatNm',
                    align: 'center',
                    width: 120
                },
                {
                    header: '문서',
                    name: 'gwDocNo',
                    align: 'center',
                    width: 90,
                    renderer: {
                        type: GwDocIconRenderer
                    }
                },
                {
                    header: '신청자성명',
                    name: 'rqstEmpNm',
                    align: 'center',
                    width: 90
                },
                {
                    header: '부서',
                    name: 'rqstDeptNm',
                    align: 'center',
                    width: 175
                },
                {
                    header: '신청일자',
                    name: 'rqstDt',
                    align: 'center',
                    width: 140,
                    renderer: {
                        type: DateFormatRenderer
                    }
                },
                {
                    header: '발령일',
                    name: 'appntDt',
                    align: 'center',
                    width: 140,
                    renderer: {
                        type: DateFormatRenderer
                    }
                },
                {
                    header: '제목',
                    name: 'appntSbj',
                    minWidth: 470
                },
                {
                    header: '비고',
                    name: 'rmk',
                    width: 0
                }
            ];
            const dataSource = {
                api: {
                    readData: {
                        url: '/mis/hrm/hrm-0100/appnt-list',
                        method: 'GET',
                        initParams: {
                            empNo: '',
                            empNm: '',
                            frDt: document.getElementById('hrm0100SearchForm').frDt.value,
                            toDt: document.getElementById('hrm0100SearchForm').toDt.value,
                            appntCont: ''
                        },
                        serializer(params) {
                            return Qs.stringify(params);
                        }
                    }
                },
                initialRequest: true
            };

            this.grid = new Grid({
                el: document.getElementById('appntGrid'),
                columns: columns,
                data: dataSource,
                bodyHeight: 'fitToParent',
                minRowHeight: 20,
                rowHeight: 30,
                rowHeaders: ['rowNum'],
                onGridMounted: () => {
                    this.grid.hideColumn('rmk');
                }
            });
        }
    }

    document.getElementById('searchEmpBtn').addEventListener('click', function () {
        empSchModal.selectEvent = () => {
            let searchForm = document.getElementById('hrm0100SearchForm');
            searchForm.empNm.value = empSchModal.selectedEmpInfo.empNm;
            searchForm.empNo.value = empSchModal.selectedEmpInfo.empNo;
        };
        empSchModal.modalOpen();
    });

    // 검색조건 조회 이벤트
    document.querySelector('#hrm0100SearchForm .submit_btn').addEventListener('click', function () {
        let form = document.getElementById('hrm0100SearchForm');
        let params = {
            empNo: form.empNo.value,
            empNm: form.empNm.value,
            frDt: form.frDt.value,
            toDt: form.toDt.value,
            appntCont: form.appntCont.value
        }
        appntReqListGrid.grid.readData(undefined, params, true);
    });

    //검색조건 초기화 이벤트
    document.querySelector('#hrm0100SearchForm .reset_btn').addEventListener('click', function () {
        document.getElementById('hrm0100SearchForm').reset();
    });

    //인사발령신청 이벤트
    document.querySelector('#hrm0100SearchForm .rq_btn').addEventListener('click', function () {
        appntEmpModal.modalOpen(null, {disable: false, blank: true});
    });

    let appntEmpModal;
    let appntReqListGrid;

    (function init() {
        appntEmpModal = new AppntEmpModal();
        appntReqListGrid = new AppntReqListGrid();
        empSchModal = new EmpSchModal();
    })();

</script>
</body>
</html>
