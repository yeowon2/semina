<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>퇴직자현황조회</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/mis/hrm/hrm_7021.css"/>"/>

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
                <h1>퇴직자현황조회</h1>
            </div>
            <div class="bread_crumb_wrap">
                <div>
                    <span>인사관리</span>
                    <span>/</span>
                    <span>현황관리</span>
                    <span>/</span>
                    <span class="current_menu">퇴직자현황조회</span>
                </div>
            </div>
        </div>

        <c:set var="date" value="<%=new java.util.Date()%>"/>
        <c:set var="today"><fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/></c:set>
        <c:set var="nowYY"><fmt:formatDate value="${date}" pattern="yyyy"/></c:set>

        <div class="body">
            <div class="btn_container">
                <button id="searchBtn" class="btn primary_btn">조회</button>
                <button id="excelBtn" class="btn excel_btn">엑셀</button>
            </div>
            <div class="search_container">
                <form id="searchForm">
                    <div>
                        <label>기준일자</label>
                        <input type="date" name="startDate" class="input_text" value="${nowYY}-01-01"/>
                        ~
                        <input type="date" name="endDate" class="input_text" value="${today}"/>
                    </div>
                    <div>
                        <label>사원구분</label>
                        <input type="checkbox" name="empCls" value="102-010"/>정규직
                        <input type="checkbox" name="empCls" value="102-020"/>계약직
                        <input type="checkbox" name="empCls" value="102-030"/>기타
                    </div>
                </form>
            </div>

            <div class="grid_container">
                <div id="grid"></div>
            </div>

        </div>
    </div>

    <script src="<c:url value="/resources/js/template.js"/>"></script>
    <script src="<c:url value="/resources/lib/tui-grid/sheetJS.js"/>"></script>
    <%-- 엑셀 내보내기 그리드보다 앞에 있어야함--%>
    <script src="<c:url value="/resources/lib/tui-grid/tui-pagination.js"/>"></script>
    <script src="<c:url value="/resources/lib/tui-grid/tui-grid.js"/>"></script>
    <script src="<c:url value="/resources/lib/qs.js"/>"></script>


    <script src="<c:url value="/resources/js/custom-renderer.js"/>"></script>


    <script>
        document.getElementById('searchBtn').addEventListener('click', () => search());
        document.getElementById('excelBtn').addEventListener('click', () => excelDown());

        let Grid = tui.Grid;
        Grid.setLanguage('ko'); // 한국어 설정

        let resultGrid;
        let loadResultGrid = () => {
            const columns = [
                {
                    header: "사번",
                    name: "empNo",
                    align: "center"

                },
                {
                    header: "성명",
                    name: "empNm",
                    align: "center"
                },
                {
                    header: "주민등록번호",
                    name: "resNo",
                    align: "center",
                    formatter({row, column, value}) {
                        return value.substring(0, 6) + '-' + value.substring(6);
                    }
                },
                {
                    header: "부서명",
                    name: "deptNm"
                },
                {
                    header: "직급명",
                    name: "syntGrdNm"
                },
                {
                    header: "퇴직구분",
                    name: "rsignCls",
                    align: "center",
                },
                {
                    header: "퇴직일자",
                    name: "rsignDt",
                    align: "center",
                    formatter({row, column, value}) {
                        let date = new Date(value),
                            month = '' + (date.getMonth() + 1),
                            day = '' + date.getDate(),
                            year = date.getFullYear();

                        if (month.length < 2)
                            month = '0' + month;
                        if (day.length < 2)
                            day = '0' + day;

                        return [year, month, day].join('-');
                    }
                },
                {
                    header: "입소일자",
                    name: "entDt",
                    align: "center",
                    formatter({row, column, value}) {
                        let date = new Date(value),
                            month = '' + (date.getMonth() + 1),
                            day = '' + date.getDate(),
                            year = date.getFullYear();

                        if (month.length < 2)
                            month = '0' + month;
                        if (day.length < 2)
                            day = '0' + day;

                        return [year, month, day].join('-');
                    }
                },
                {
                    header: "퇴직사유",
                    name: "rsignRsn"
                },
                {
                    header: "비고",
                    name: "rmk"
                }
            ];

            const dataSource = {
                api: {
                    readData: {url: '/mis/hrm/hrm-7021/findByRetireeList', method: 'GET'}
                },
                serializer(params) {
                    return Qs.stringify(params, {
                        arrayFormat: 'repeat'
                    });
                },
                initialRequest: false
            };

            resultGrid = new Grid({
                el: document.getElementById('grid'),
                columns: columns,
                rowHeaders: ['rowNum'],
                minRowHeight: 20,
                rowHeight: 30,
                data: dataSource,
                scrollY: true,
            });
        }

        // loading
        window.addEventListener('load', () => {
            loadResultGrid();
            search();
        });

        // 검색버튼
        search = () => {
            const form = document.getElementById('searchForm');
            const valueCheck = form.querySelectorAll('input[name = "empCls"]:checked');
            let isChecked = [];

            valueCheck.forEach(empCls => {
                isChecked.push(empCls.value);
            })

            const params = {
                startDate: form.startDate.value,
                endDate: form.endDate.value,
                empCls: isChecked
            }
            resultGrid.readData(undefined, params, true);
        };

        // 엑셀 다운
        excelDown = () => {
            const options = {
                includeHeader: true,
                fileName: '퇴직자 현황조회',    // 엑셀파일 이름
                useFormattedValue: true,       // formatter한 데이터로 엑셀다운
            }
            resultGrid.export('xlsx', options);
        }
    </script>
</div>
</body>
</html>
