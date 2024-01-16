<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>인사기록수정현황</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/mis/hrm/hrm_2027.css"/>"/>

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
                <h1>인사기록수정현황</h1>
            </div>
            <div class="bread_crumb_wrap">
                <div>
                    <span>인사관리</span>
                    <span>/</span>
                    <span>인사기록</span>
                    <span>/</span>
                    <span class="current_menu">인사기록수정현황</span>
                </div>
            </div>
        </div>

        <c:set var="date" value="<%=new java.util.Date()%>"/>
        <c:set var="today"><fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/></c:set>
        <c:set var="nowYY"><fmt:formatDate value="${date}" pattern="yyyy"/></c:set>
        <c:set var="nowMM"><fmt:formatDate value="${date}" pattern="MM"/></c:set>

        <div class="body">
            <div class="btn_container">
                <button id="searchBtn" class="btn primary_btn">조회</button>
                <button id="excelBtn" class="btn excel_btn">엑셀</button>
                <button class="btn gray_btn">도움말</button>
            </div>
            <div class="search_container">
                <form id="searchForm">
                    <div>
                        <label>기준일자</label>
                        <input type="date" name="startDate" class="input_text" value="${nowYY}-${nowMM}-01"/>
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

    <script>

        document.getElementById('searchBtn').addEventListener('click', () => search());     // 검색버튼 클릭시
        document.getElementById('excelBtn').addEventListener('click', () => excelDown());   // 엑셀다운 버튼 클릭시

        let Grid = tui.Grid;
        Grid.setLanguage('ko');

        let resultGrid;
        let loadResultGrid = () => {
            const columns = [
                {
                    header: "일시",
                    name: "useDt",
                    align: "center",
                    width: 200,
                },
                {
                    header: "내용",
                    name: "jobObj",
                    align: "left",
                    width: 1400,
                }
            ];

            const dataSource = {
                api: {
                    readData: {url: '/mis/hrm/hrm-2027/findByList', method: 'GET'}
                },
                serializer(params) {
                    return Qs.stringify(params, {
                        arrayFormat: 'repeat'
                    });
                },
                initialRequest: false
            }

            resultGrid = new Grid({
                el: document.getElementById('grid'),
                columns: columns,
                rowHeaders: ['rowNum'],
                bodyHeight: 'fitToParent',
                minRowHeight: 20,
                rowHeight: 30,
                data: dataSource,
                scrollY: true,
            });
        };

        // 페이지 로드시
        window.addEventListener('load', () => {
            loadResultGrid();
            search();
        });

        search = () => {
            const form = document.getElementById('searchForm');
            let checkValue = document.querySelectorAll('input[name="empCls"]:checked');
            let isChecked = [];

            checkValue.forEach(checkEmpCls => {
                isChecked.push(checkEmpCls.value);
            });

            const params = {
                startDate: form.startDate.value,
                endDate: form.endDate.value,
                empCls: isChecked,
            }
            resultGrid.readData(undefined, params, true);
        }

        excelDown = () => {
            const options = {
                includeHeader: true,
                fileName: '인사기록수정현황',
                useFormattedValue: true,
            }
            resultGrid.export('xlsx', options);
        }
    </script>
</div>
</body>
</html>
