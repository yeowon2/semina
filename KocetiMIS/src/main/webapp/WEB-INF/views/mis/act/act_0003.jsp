<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>재무제표양식관리</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-grid.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-pagination.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/mis/act/act_0003.css"/>"/>

</head>
<body>
<c:set var="now" value="<%=new java.util.Date()%>"/>
<c:set var="nowYear"><fmt:formatDate value="${now}" pattern="yyyy"/></c:set>
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
                    <span class="current_menu">재무제표양식관리</span>
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
                    <label>제무제표구분</label>
                    <select class="input_text" name="fincStatCd">
                        <option name="fincStatCd" value="390-001" selected>재무상태표</option>
                        <option name="fincStatCd" value="390-002">포관손익계산서(총괄)</option>
                    </select>
                </div>
                <div>
                    <label>년 도</label>
                    <!--2017~2021년  1레벨에 있는 자산이 자기 자신을 상위코드로 갖고 있어 오류가 생김   -->
                    <!--<input type="number" name="fincStatYy" class="input_text" maxlength="4" oninput="numberMaxLengthCheck(this, 'year')" value="${nowYear}" />-->
                    <input type="number" name="fincStatYy" class="input_text" maxlength="4"
                           oninput="numberMaxLengthCheck(this, 'year')" value="2016"/>
                </div>
            </div>
            <div class="bottom">
                <div class="left">
                    <div class="left_top">
                        <label>양식내역</label>
                        <div class="button_wrap">
                            <button type="button" class="btn white_btn button" id="addBtn">추가</button>
                            <button type="button" class="btn gray_btn button" id="delete">삭제</button>
                        </div>
                    </div>
                    <div id="grid1"></div>
                </div>
                <div class="right">
                    <div class="right_top">
                        <label>세부내역</label>
                        <div class="button_wrap">
                            <button type="button" class="btn white_btn button" id="detailAddBtn">추가</button>
                            <button type="button" class="btn gray_btn button" id="detailDeleteBtn">삭제</button>
                        </div>
                    </div>
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

    let Grid = tui.Grid;
    Grid.setLanguage('ko');

    let actFsGrid;
    let loadActFsGrid = () => {
        const columnData = [
            {
                header: "코드",
                name: 'seq',
                align: 'center',
                width: 80
            },
            {
                header: "표시명",
                name: 'disNm',
                editor: 'text',
                minWidth: 320
            },
            {
                header: "순번",
                name: 'ordering',
                align: 'center',
                editor: 'text',
                width: 80

            },
            {
                header: "상위코드",
                name: 'upCd',
                align: 'center',
                width: 80,
                editor: 'text',
            },
            {
                header: "충당/누계",
                name: 'cnSeq',
                align: 'center',
                width: 80,
                editor: 'text',
            },
            {
                header: "레벨",
                name: 'lev',
                align: 'center',
                width: 80,
                editor: 'text',
            },
            {
                header: "년도",
                name: 'fincStatYy',
                align: 'center',
                width: 80,
                hidden: true
            },
            {
                header: "재무재표구분",
                name: 'fincStatCd',
                align: 'center',
                width: 80,

                hidden: true
            },
        ]
        const dataSource = {
            api: {
                readData: {
                    url: '/mis/act/act-0003/act-fs-list',
                    method: 'GET',
                    initParams: {
                        "fincStatCd": document.querySelector('select[name=fincStatCd]').value,
                        "fincStatYy": document.querySelector('input[name=fincStatYy]').value,


                    }
                }
            },
            serialize(params) {
                return Qs.stringify(params);
            },
            initialRequest: true
        };
        actFsGrid = new Grid({
            el: document.getElementById('grid1'),
            rowHeaders: ['rowNum'],
            columns: columnData,
            data: dataSource,
            bodyHeight: 550,
            treeColumnOptions: {
                name: 'disNm',
                useIcon: true,
                useCascadingCheckbox: false
            },
            onGridUpdated: () => {
                actFsGrid.expandAll(); //트리 전부 열기
            }
        });
        actFsGrid.on('click', (ev) => {
            const seq = actFsGrid.getValue(ev.rowKey, 'seq');
            const fincStatYy = actFsGrid.getValue(ev.rowKey, 'fincStatYy');
            const fincStatCd = actFsGrid.getValue(ev.rowKey, 'fincStatCd');
            actDtlItem(seq, fincStatYy, fincStatCd);
        });
    }

    let actFsDtlGrid;
    let loadActFsDtlGrid = () => {
        const columnData = [
            {
                header: '구분',
                name: 'acctCls',
                width: 80,
                align: 'center',
                renderer: {
                    type: TextValueRenderer,
                    options: {
                        listItems: [
                            {value: 'A', text: '계정'},
                        ]
                    }
                }

            },
            {
                header: '코드',
                name: 'acctCd',
                width: 80,
                align: 'center'
            },
            {
                header: '계정명',
                name: 'acctNm',
                editor: 'text',
                renderer: {
                    type: SearchIconRenderer
                },
                minWidth: 230
            }
        ]
        const dataSource = {
            api: {
                readData: {
                    url: '/mis/act/act-0003/act-fsDtl-list',
                    method: 'GET',
                    initParams: {
                        "seq": '',
                        "fincStatYy": ''

                    }
                }
            },
            serialize(params) {
                return Qs.stringify(params);
            },
            initialRequest: false
        };
        actFsDtlGrid = new Grid({
            el: document.getElementById('grid2'),
            rowHeaders: ['rowNum'],
            columns: columnData,
            data: dataSource,
            bodyHeight: 550,
        });
    }

    function actDtlItem(seq, fincStatYy, fincStatCd) {
        const item = {
            'seq': seq,
            'fincStatYy': fincStatYy,
            'fincStatCd': fincStatCd
        }
        actFsDtlGrid.readData(undefined, item, true);
    }

    window.addEventListener('load', () => {
        init();
    });

    function init() {
        loadActFsGrid();
        setRefreshObserver(actFsGrid);

        loadActFsDtlGrid();
        setRefreshObserver(actFsDtlGrid);
    }

    search = () => {
        let search_item = {
            "fincStatCd": document.querySelector('select[name=fincStatCd]').value,
            "fincStatYy": document.querySelector('input[name=fincStatYy]').value

        };
        const dtlItem = {
            'seq': '',
            'fincStatYy': '',
            'fincStatCd': ''
        };

        actFsGrid.readData(undefined, search_item, true);
        actFsDtlGrid.readData(undefined, dtlItem, true);
    };


</script>