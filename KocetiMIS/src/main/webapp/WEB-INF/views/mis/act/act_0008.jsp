<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>업종코드관리</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-grid.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-pagination.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/mis/act/act_0008.css"/>"/>
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
                    <button type="button" class="btn white_btn">저장</button>
                </div>
            </div>
            <div class="param_container">
                <div>
                    <label>업종명</label>
                    <input class="input_text" name="intyNm">
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
    document.getElementById('excelBtn').addEventListener('click', () => excelDown());
    document.getElementById('submitBtn').addEventListener('click', () => search());

    let Grid = tui.Grid;
    Grid.setLanguage('ko');

    let actIntyCdGrid;
    let loadActIntyCdGrid = () => {
        const columnData = [
            {
                header: "상태",
                name: 'stateHeader',
                align: 'center',
                width: 50
            },
            {
                header: "업종코드",
                name: 'intyCd',
                align: 'center',
                width: 150
            },
            {
                header: "업종명",
                name: 'intyNm',
                editor: 'text'
            },
            {
                header: "필요경비세율",
                name: 'necesTaxRate',
                align: 'center',
                editor: 'text',
                width: 150
            },
            {
                header: "소득세율",
                name: 'taxRate',
                align: 'center',
                editor: 'text',
                width: 150
            },
        ]
        const dataSource = {
            api: {
                readData: {
                    url: '/mis/act/act-0008/act-inty-list',
                    method: 'GET',
                    initParams: {
                        "intyNm": '',

                    }
                }
            },
            serialize(params) {
                return Qs.stringify(params);
            },
            initialRequest: true
        };
        actIntyCdGrid = new Grid({
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
        // 테이블에서 셀 편집을 종료한 경우
        actIntyCdGrid.on('editingFinish', (ev) => {
            actIntyCdGrid.setValue(ev.rowKey, 'stateHeader', 'U');
        });
    }
    window.addEventListener('load', () => {
        init();
    });

    function init() {
        loadActIntyCdGrid();
        setRefreshObserver(actIntyCdGrid);
    }

    search = () => {
        let search_item = {
            "intyNm": document.querySelector('input[name=intyNm]').value,

        }
        actIntyCdGrid.readData(undefined, search_item, true);
    };

</script>