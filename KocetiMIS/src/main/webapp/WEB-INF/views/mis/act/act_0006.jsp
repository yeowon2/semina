<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>관리항목코드관리</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-grid.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-pagination.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/mis/act/act_0006.css"/>"/>
</head>
<body>
<div class="grid_layout">
    <%@ include file="../../template.jsp" %>
    <div class="main">
        <div class="head">
            <div class="menu_ttile_wrap">
                <h1>회계관리</h1>
            </div>
            <div class="bread_crumb_wrap">
                <div>
                    <span>회계관리</span>
                    <span>/</span>
                    <span>기준관리</span>
                    <span>/</span>
                    <span class="current_menu">관리항목코드관리</span>
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
                    <label>관리항목명</label>
                    <input class="input_text" name="mgtItmNm">
                </div>
                <div>
                    <label>관리항목코드</label>
                    <input class="input_text" name="mgtItmCd">
                </div>
            </div>
            <div class="bottom">
                <div class="bottom_top">
                    <label>관리항목내역</label>
                    <div class="button_wrap">
                        <button type="button" class="btn white_btn button" id="addBtn">추가</button>
                        <button type="button" class="btn gray_btn button" id="delete">삭제</button>
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

    let actMgmtGrid;
    let loadActMgmtGrid = () => {
        const columnData = [
            {
                header: "항목코드",
                name: 'mgtItmCd',
                align: 'center',
                width: 80
            },
            {
                header: "항목명",
                name: 'mgtItmNm',
                editor: 'text'
            },
            {
                header: "데이터구분",
                name: 'dataTp',
                formatter: 'listItemText',
                editor: {
                    type: 'select',
                    options: {
                        listItems: [
                            {text: '팝업형', value: 'P'},
                            {text: '입력형', value: 'I'},

                        ]
                    }
                },
                align: 'center',
                width: 100
            },
            {
                header: "참조테이블",
                name: 'referTb',
                editor: 'text'
            },
            {
                header: "참조필드",
                name: 'referFld',
                editor: 'text'
            },
            {
                header: "참조필드명",
                name: 'referFldNm',
                editor: 'text'
            },
            {
                header: "필드사이즈",
                name: 'fldSize',
                editor: 'text',
                align: 'right',

            }
        ];
        const dataSource = {
            api: {
                readData: {
                    url: '/mis/act/act-0006/act-mgmt-list',
                    method: 'GET',
                    initParams: {
                        "mgtItmNm": '',
                        "mgtItmCd": ''
                    }
                }
            },
            serialize(params) {
                return Qs.stringify(params);
            },
            initialRequest: true
        };
        actMgmtGrid = new Grid({
            el: document.getElementById('grid'),
            rowHeaders: ['rowNum', 'checkbox'],
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
        loadActMgmtGrid();
        setRefreshObserver(actMgmtGrid);
    }

    search = () => {
        let search_item = {
            'mgtItmNm': document.querySelector('input[name=mgtItmNm]').value,
            'mgtItmCd': document.querySelector('input[name=mgtItmCd]').value,

        }
        actMgmtGrid.readData(undefined, search_item, true);
    };
</script>