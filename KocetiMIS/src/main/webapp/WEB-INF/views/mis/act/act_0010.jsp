<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>국가별세금</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-grid.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-pagination.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/mis/act/act_0010.css"/>"/>
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
                    <span class="current_menu">국가별세금</span>
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
                <div>
                    <label>소득명</label>
                    <input class="input_text" type="text" name="incmNm">
                </div>
            </div>
            <div class="bottom">
                <div class="bottom_top">
                    <div class="button_wrap">
                        <button type="button" class="btn white_btn button" id="addBtn">추가</button>
                        <button type="button" class="btn gray_btn button" id="delete">삭제</button>
                    </div>
                </div>
                <div class="grid_wrap">
                    <div id="grid1"></div>
                    <div id="grid2"></div>
                </div>
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
    document.getElementById('submitBtn').addEventListener('click', () => search());
    document.getElementById('addBtn').addEventListener('click', () => addRow());

    let Grid = tui.Grid;
    Grid.setLanguage('ko');

    let taxesByCountryGrid;
    let loadTaxesByCountryGrid = () => {
        const columnData = [
            {
                header: '소득코드',
                name: 'incmCd',
                width: 80,
                align: 'center'
            },
            {
                header: '거주구분',
                name: 'habtCls',
                width: 120,
                align: 'center',
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
                header: '소득명',
                name: 'incmNm',
                minWidth: 220,

            },
            {
                header: '국가표준코드',
                name: 'stanIncmCd',
                width: 50,
                align: 'center'
            },
            {
                header: '국가표준순번',
                name: 'stanIncmSeq',
                width: 50,
                align: 'center'
            },

        ]
        const dataSource = {
            api: {
                readData: {
                    url: '/mis/act/act-0010/act-taxesByCountry-list',
                    method: 'GET',
                    initParams: {
                        "incmNm": ''
                    }
                }
            },
            serialize(params) {
                return Qs.stringify(params);
            },
            initialRequest: true
        };
        taxesByCountryGrid = new Grid({
            el: document.getElementById('grid1'),
            rowHeaders: ['rowNum'],
            columns: columnData,
            data: dataSource,
            bodyHeight: 550,
            header: {
                complexColumns: [
                    {
                        header: '표준코드',
                        name: 'stanIncmHeader',
                        childNames: ['stanIncmCd', 'stanIncmSeq'],
                        hideChildHeaders: true
                    }
                ]
            }
        });
        taxesByCountryGrid.on('click', (ev) => {
            const incmCd = taxesByCountryGrid.getValue(ev.rowKey, 'incmCd');
            console.log(incmCd);
            taxDetail(incmCd);
        });
    }

    let taxDetailGrid;
    let loadTaxDetailGrid = () => {
        const columnData = [
            {
                header: '국가코드',
                name: 'ntnCd',
                width: 120,
                align: 'center',
                editor: 'text'
            },
            {
                header: '국가',
                name: 'ntnNm',
                minWidth: 150,
                editor: 'text'
            },
            {
                header: '소득세율(%)',
                name: 'incmRate',
                width: 120,
                align: 'center',
                editor: 'text'
            },
            {
                header: '주민세율(%)',
                name: 'inhabtRate',
                width: 120,
                align: 'center',
                editor: 'text'
            },
        ]
        const dataSource = {
            api: {
                readData: {
                    url: '/mis/act/act-0010/act-taxDetail-list',
                    method: 'GET',
                    initParams: {
                        "incmCd": ''
                    }
                }
            },
            serialize(params) {
                return Qs.stringify(params);
            },
            initialRequest: false
        };
        taxDetailGrid = new Grid({
            el: document.getElementById('grid2'),
            rowHeaders: ['rowNum'],
            columns: columnData,
            data: dataSource,
            bodyHeight: 550,
        });
    }

    function taxDetail(incmCd) {
        taxDetailGrid.readData(undefined, {'incmCd': incmCd}, true);
    }

    window.addEventListener('load', () => {
        init();
    });

    function init() {
        loadTaxesByCountryGrid();
        setRefreshObserver(taxesByCountryGrid);

        loadTaxDetailGrid();
        setRefreshObserver(taxDetailGrid);
    }

    search = () => {
        let search_item = {
            "incmNm": document.querySelector('input[name=incmNm]').value
        };


        taxesByCountryGrid.readData(undefined, search_item, true);
        taxDetailGrid.readData(undefined, {'incmCd': ''}, true);
    };


    addRow = () => {
        let rowData = [{ntnCd: "", cntNm: "", cntKorNm: "", cntetKorNm: "", useYn: "", dispSeq: ""}];
        //새 행을 테이블 끝에 삽입
        taxDetailGrid.appendRow(rowData, {
            at: taxDetailGrid.getRowCount(), //새 행이 삽입될 인덱스
            focus: true, //true로 설정하면 추가 후 새 행으로 포커스를 이동

        });

        taxDetailGrid.enable();
    }
</script>
