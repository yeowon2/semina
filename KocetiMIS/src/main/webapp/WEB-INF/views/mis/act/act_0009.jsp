<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>소득코드관리</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-grid.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-pagination.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/mis/act/act_0009.css"/>"/>
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
                    <label>거주구분</label>
                    <select class="input_text" name="habtCls">
                        <option name="habtCls" value=""></option>
                        <option name="habtCls" value="371-001">거주자</option>
                        <option name="habtCls" value="371-002">비거주자</option>
                    </select>
                </div>
            </div>
            <div id="grid"></div>
        </div>
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

    let actIncmCdGrid;
    let loadActIncmCdGrid = () => {
        const columnData = [
            {
                header: "소득코드",
                name: 'incmCd',
                align: 'center',
                width: 80
            },
            {
                header: "소득구분",
                name: 'incmCls',
                align: 'center',
                width: 80,
                formatter: 'listItemText',
                editor: {
                    type: 'select',
                    options: {
                        listItems: [
                            {text: '기타소득', value: '313-003'},
                            {text: '사업소득', value: '313-004'},
                            {text: '사업소득', value: '313-005'},
                        ]
                    }
                }
            },
            {
                header: "거주구분",
                name: 'habtCls',
                align: 'center',
                width: 80,
                formatter: 'listItemText',
                editor: {
                    type: 'select',
                    options: {
                        listItems: [
                            {text: '거주자', value: '371-001'},
                            {text: '비거주자', value: '371-002'},

                        ]
                    }
                }
            },
            {
                header: "국가표준코드",
                name: 'stanIncmCd',
                align: 'center',
                width: 100
            },
            {
                header: "소득명",
                name: 'incmNm',
                editor: 'text',
                minWidth: 300

            },
            {
                header: "필요경비세율(%)",
                name: 'necesTaxRate',
                align: 'center',
                editor: 'text',
                width: 120
            },
            {
                header: "소득세율(%)",
                name: 'taxRate',
                align: 'center',
                editor: 'text',
                width: 120
            },
            {
                header: "과세최저금액(%)",
                name: 'minTax',
                align: 'center',
                editor: 'text',
                width: 120
            },
        ]
        const dataSource = {
            api: {
                readData: {
                    url: '/mis/act/act-0009/act-incm-list',
                    method: 'GET',
                    initParams: {
                        "habtCls": '',
                    }
                }
            },
            serialize(params) {
                return Qs.stringify(params);
            },
            initialRequest: true
        };
        actIncmCdGrid = new Grid({
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
        loadActIncmCdGrid();
        setRefreshObserver(actIncmCdGrid);
    }

    search = () => {
        let search_item = {
            "habtCls": document.querySelector('select[name=habtCls]').value,

        }
        actIntyCdGrid.readData(undefined, search_item, true);
    };
</script>