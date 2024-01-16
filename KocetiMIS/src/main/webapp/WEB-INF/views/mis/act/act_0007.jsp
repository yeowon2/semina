<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>환율조회</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-grid.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-pagination.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/mis/act/act_0007.css"/>"/>
</head>
<body>
<div class="grid_layout">
    <%@ include file="../../template.jsp" %>
    <div class="main">
        <div class="head">
            <div class="menu_title_wrap">
                <h1>회계관리</h1>
            </div>
            <div class="bread_crumb_wrap">
                <div>
                    <span>회계관리</span>
                    <span>/</span>
                    <span>기준관리</span>
                    <span>/</span>
                    <span class="current_menu">업종코드관리</span>
                </div>
            </div>
        </div>
        <div class="body">
            <div class="top">
                <div class="btn_container">
                    <button type="button" class="btn gray_btn">도움말</button>
                    <button type="button" class="btn excel_btn" id="excelBtn">엑셀</button>
                    <button type="button" class="btn primary_btn" id="submitBtn">조회</button>
                </div>
            </div>
            <div class="param_container">
                <c:set var="date" value="<%=new java.util.Date()%>"/>
                <c:set var="today"><fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/></c:set>
                <div>
                    <label>통화구분</label>
                    <select class="input_text" name="currCd">
                        <option name="currCd" value="">--전체--</option>
                        <c:forEach items="${commCdList}" var="item">
                            <option name="currCd" value="${item.code}">${item.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div>
                    <label>기준일자</label>
                    <input class="input_text" type="date" value="${today}" name="basicDate">
                </div>
            </div>
            <div id="grid"></div>
        </div>
    </div>
</div>
</body>
</html>
<script src="<c:url value="/resources/js/template.js"/>"></script>

<script src="<c:url value="/resources/lib/tui-grid/sheetJS.js"/>"></script>
<script src="<c:url value="/resources/lib/tui-grid/tui-pagination.js"/>"></script>
<script src="<c:url value="/resources/lib/tui-grid/tui-grid.js"/>"></script>
<script src="<c:url value="/resources/lib/qs.js"/>"></script>

<script src="<c:url value="/resources/js/custom-renderer.js"/>"></script>
<script src="<c:url value="/resources/js/common.js"/>"></script>
<script>
    document.getElementById('submitBtn').addEventListener('click', () => search());

    let Grid = tui.Grid;
    Grid.setLanguage('ko');

    let exchangeRateGrid;

    const basicDate = document.querySelector('input[name=basicDate]').value
    const dateFormat = basicDate.replaceAll('-', '');


    let loadExchangeRateGrid = () => {
        const columnData = [
            {
                header: '통화구분',
                name: 'currNm',
                width: 150
            },
            {
                header: '기준환율',
                name: 'basicRate',
                align: 'right',
                width: 150
            },
            {
                header: '전신환매도율',
                name: 'ttBuyRate',
                align: 'right',
                width: 150
            },
            {
                header: '전신환매도율',
                name: 'ttSellRate',
                align: 'right',
                width: 150
            },
            {
                header: '현찰매도율',
                name: 'cashBuyRate',
                align: 'right',
                width: 150
            },
            {
                header: '현찰매입율',
                name: 'cashSellRate',
                align: 'right',
                width: 150
            },
            {
                header: 'T/C매도율',
                name: 'tcSellRate',
                align: 'right',
                minWidth: 150
            },
        ];

        const dataSource = {
            api: {
                readData: {
                    url: '/mis/act/act-0007/act-exchangeRate-list',
                    method: 'GET',
                    initParams: {
                        "currCd": '',
                        "basicDate": dateFormat,
                    }
                }
            },
            serialize(params) {
                return Qs.stringify(params);
            },
            initialRequest: true
        };
        exchangeRateGrid = new Grid({
            el: document.getElementById('grid'),
            rowHeaders: ['rowNum'],
            columns: columnData,
            data: dataSource,
            bodyHeight: 550,
            minRowHeight: 20,
            rowHeight: 30,
            scrollX: true,
            scrollY: true
        });

    }


    window.addEventListener('load', () => {
        init();
    });

    function init() {
        loadExchangeRateGrid();
        setRefreshObserver(exchangeRateGrid);
    }

    search = () => {

        let search_item = {
            "currCd": document.querySelector('select[name=currCd]').value,
            "basicDate": dateFormat
        }
        exchangeRateGrid.readData(undefined, search_item, true);
    };
</script>