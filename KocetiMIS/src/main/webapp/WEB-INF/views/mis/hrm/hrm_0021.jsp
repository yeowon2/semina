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
    <link rel="stylesheet" href="<c:url value="/resources/css/mis/hrm/hrm_0020.css"/>"/>

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
                <h1>부서변경이력</h1>
            </div>
            <div class="bread_crumb_wrap">
                <div>
                    <span>인사관리</span>
                    <span>/</span>
                    <span>기준관리</span>
                    <span>/</span>
                    <span class="current_menu">부서변경이력</span>
                </div>
            </div>
        </div>

        <div class="body">
            <div class="search_container">
                <select name="structDt">
                    <c:forEach items="${reorganizationDate}" var="date">
                        <fmt:parseDate var="parseDate" value="${date.structDt}" pattern="yyyyMMdd"/>
                        <option value="${date.structDt}"><fmt:formatDate value="${parseDate}"
                                                                         pattern="yyyy-MM-dd"/></option>
                    </c:forEach>
                </select>
                <button class="primary_btn btn" id="searchBtn">조회</button>
            </div>

            <div class="grid_container">
                <div id="recordGrid"></div>
            </div>
        </div>
    </div>
</div>

<script src="<c:url value="/resources/js/template.js"/>"></script>
<script src="<c:url value="/resources/lib/tui-grid/tui-pagination.js"/>"></script>
<script src="<c:url value="/resources/lib/tui-grid/tui-grid.js"/>"></script>
<script src="<c:url value="/resources/lib/qs.js"/>"></script>
<script>
    let Grid = tui.Grid;
    Grid.setLanguage('ko'); // 한국어 설정

    let recordGrid;
    let loadRecordGrid = () => {
        const columns = [
            {
                header: '변경구분코드',
                name: 'chgClsCd'
            },
            {
                header: '변경구분',
                name: 'chgClsNm'
            },
            {
                header: '이전부서코드',
                name: 'prevDeptCd'
            },
            {
                header: '이전 부서명',
                name: 'prevDeptNm'
            },
            {
                header: '현재부서코드',
                name: 'curDeptCd'
            },
            {
                header: '현재 부서명',
                name: 'curDeptNm'
            },
            {
                header: '조직개편데이터여부',
                name: 'orgchtDataYN',
                formatter: 'listItemText',
                editor: {
                    type: 'select',
                    options: {
                        listItems: [
                            {text: '조직개편', value: 'Y'},
                            {text: '담당자추가', value: 'N'}
                        ]
                    }
                }
            },
            {
                header: '비고',
                name: 'rmk'
            },
        ];
        const dataSource = {
            api: {
                readData: {url: '/mis/hrm/hrm-0021/get-record', method: 'GET'}
            },
            initialRequest: false
        };

        recordGrid = new Grid({
            el: document.getElementById('recordGrid'),
            columns: columns,
            data: dataSource,
            bodyHeight: 'fitToParent',
            onGridUpdated: () => {
                recordGrid.disableColumn('orgchtDataYN');
            }
        });
    }

    let readDataByStructDt = () => {
        let structDt = document.querySelector('select[name=structDt]').value;
        recordGrid.readData(undefined, {structDt: structDt}, true);
    }


    window.addEventListener('load', () => {
        loadRecordGrid();
        document.getElementById('searchBtn').addEventListener('click', readDataByStructDt);
    });


    window.addEventListener('load', () => {
        /** 좌측 네비게이션을 통한 레이아웃 변경시 tui-grid가 레이아웃 변경을 감지못하는 버그 해결을 위한 코드 */
        let observer = new ResizeObserver(function (entries) {
            entries.forEach(() => {
                recordGrid.refreshLayout();
            });
        });
        observer.observe(document.querySelector('.body'));
    });

</script>
</body>
</html>
