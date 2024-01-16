<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>계정코드관리</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-grid.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-pagination.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/mis/act/act_0001.css"/>"/>
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
                    <span class="current_menu">계정코드관리</span>
                </div>
            </div>
        </div>
        <div class="body">
            <div class="top">
                <div class="btn_container">
                    <button type="button" class="btn gray_btn" >도움말</button>
                    <button type="button" class="btn excel_btn" id="excelBtn">엑셀</button>
                    <button type="button" class="btn white_btn" >신규</button>
                    <button type="button" class="btn primary_btn" id="submitBtn">조회</button>
                    <button type="button" class="btn white_btn" >저장</button>
                </div>
            </div>
            <div class="param_container">
                <div>
                    <label>계정명</label>
                    <input class="input_text" name="acctNm">
                </div>
                <div>
                    <label>계정코드</label>
                    <input class="input_text" name="acctCdNm">
                </div>
            </div>
            <div class="bottom">
                <div class="left">
                    <div class="left_top">
                        <label>계정내역</label>
                        <button class="btn white_btn button" id="openBtn">전체 열기/닫기</button>
                    </div>
                    <div id="grid1"></div>
                </div>
                <div class="right">
                    <div class="right_top">
                        <div class="title"><p>계정정보</p></div>
                        <div class="scroll_layout">
                            <div class="acct_info_wrap">
                                <div class="row">
                                    <div class="col">
                                        <label>계정코드</label>
                                        <input class="input" name="acctCd">
                                    </div>
                                    <div class="col">
                                        <label>계정명(한글)</label>
                                        <input class="input" name="acctNm">
                                    </div>
                                </div>
                                <div class="row">
                                    <label>계정명(영문)</label>
                                    <input class="input" name="acctNmEng">
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label>계정레벨</label>
                                        <input class="input" name="acctLev">
                                    </div>
                                    <div class="col">
                                        <label>상위계정</label>
                                        <div class="input search lage_input">
                                            <input name="upAcctNm" type="text" class="search_input  ">
                                            <button class="search_btn">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                     fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                                </svg>
                                            </button>
                                        </div>
                                        <input name="upAcctCd" class="input small_input">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label>차대구분</label>
                                        <input name="drCr" type="radio" value="D" class="input_radio"> 차변
                                        <input name="drCr" type="radio" value="C" class="input_radio"
                                               style="margin-left : 10px;"> 대변
                                    </div>
                                    <div class="col">
                                        <label>보조부</label>
                                        <input class="input lage_input" name="subdNm1">
                                        <input class="input small_input" name="subdCd1">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label>계정특성</label>
                                        <select name="acctChar">
                                            <option name="acctChar" value="">--선택--</option>
                                            <c:forEach items="${acctCharList}" var="item">
                                                <option name="acctChar" value="${item.code}">${item.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col">
                                        <label>보조부</label>
                                        <input class="input lage_input" name="subdNm2">
                                        <input class="input small_input" name="subdCd2">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label>사용유무</label>
                                        <input name="useYn" type="radio" value="Y" class="input_radio"> 사용
                                        <input name="useYn" type="radio" value="N" class="input_radio"
                                               style="margin-left : 10px;"> 미사용
                                    </div>
                                    <div class="col">
                                        <label>순번</label>
                                        <input class="input" name="ordNo">
                                    </div>
                                </div>
                                <div class="row">
                                    <label>계정그룹</label>
                                    <select class="" name="acctClsf">
                                        <option name="acctClsf" value="">--선택--</option>
                                        <option name="acctClsf" value="A07-101">자산</option>
                                        <option name="acctClsf" value="A07-201">부채</option>
                                        <option name="acctClsf" value="A07-301">자본</option>
                                        <option name="acctClsf" value="A07-401">수익</option>
                                        <option name="acctClsf" value="A07-501">비용</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="right_bottom">
                        <div class="right_bottom_top">
                            <label>괸리항목내역</label>
                            <div class="button_wrap">
                                <button type="button" class="btn white_btn button" id="addBtn">추가</button>
                                <button type="button" class="btn gray_btn button" id="delete">삭제</button>
                            </div>
                        </div>
                        <div id="grid2"></div>
                    </div>
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
    document.getElementById('excelBtn').addEventListener('click', () => excelDown());
    document.getElementById('submitBtn').addEventListener('click', () => search());

    document.getElementById('openBtn').addEventListener('click', function () {
        if (this.classList.contains('close')) {
            this.classList.remove('close');
            acctCdGrid.expandAll();
        } else {
            this.classList.add('close');
            acctCdGrid.collapseAll(); //모든 자식트리 접기
        }
    });

    let Grid = tui.Grid;
    Grid.setLanguage('ko');

    let acctCdGrid;
    let mgtItemGrid;

    let loadAcctCdGrid = () => {
        const columnData = [
            {
                header: "계정코드",
                name: 'acctCd',
                align: 'center',
                width: 80

            },
            {
                header: "계정명(한글)",
                name: 'acctNm',
            },
            {
                header: "계정코드영문명",
                name: 'acctNmEng',
                hidden: true
            },
            {
                header: "계정레벨",
                name: 'acctLev',
                hidden: true
            },
            {
                header: "상위계정코드",
                name: 'upAcctCd',
                hidden: true
            },
            {
                header: "상위계정코드명",
                name: 'upAcctNm',
                hidden: true
            },
            {
                header: "차대구분",
                name: 'drCr',
                hidden: true
            },
            {
                header: "보조부1",
                name: 'subdCd1',
                hidden: true
            },
            {
                header: "보조부명2",
                name: 'subdNm1',
                hidden: true
            },
            {
                header: "보조부2",
                name: 'subdCd2',
                hidden: true
            },
            {
                header: "보조부명2",
                name: 'subdNm2',
                hidden: true
            },
            {
                header: "계정 특성",
                name: 'acctChar',
                hidden: true
            },
            {
                header: "사용유무",
                name: 'useYn',
                hidden: true
            },
            {
                header: "오더번호",
                name: 'ordNo',
                hidden: true
            },
            {
                header: "계정구분",
                name: 'acctClsf',
                hidden: true
            }


        ];
        const dataSource = {
            api: {
                readData: {
                    url: '/mis/act/act-0001/act-cd-list',
                    method: 'GET',
                    initParams: {
                        "acctCd": '',
                        "acctNm": ''
                    }
                }
            },
            serialize(params) {
                return Qs.stringify(params);
            },
            initialRequest: true
        };
        acctCdGrid = new Grid({
            el: document.getElementById('grid1'),
            rowHeaders: ['rowNum'],
            columns: columnData,
            data: dataSource,
            bodyHeight: 550,
            treeColumnOptions: {
                name: 'acctNm',
                useIcon: true,
                useCascadingCheckbox: false
            },
            onGridUpdated: () => {
                acctCdGrid.expandAll(); //트리 전부 열기
            }
        });
        acctCdGrid.on('click', (ev) => {
            const acctCd = acctCdGrid.getValue(ev.rowKey, 'acctCd');
            const acctNm = acctCdGrid.getValue(ev.rowKey, 'acctNm');
            const acctNmEng = acctCdGrid.getValue(ev.rowKey, 'acctNmEng');
            const acctLev = acctCdGrid.getValue(ev.rowKey, 'acctLev');
            const upAcctCd = acctCdGrid.getValue(ev.rowKey, 'upAcctCd');
            const upAcctNm = acctCdGrid.getValue(ev.rowKey, 'upAcctNm');
            const drCr = acctCdGrid.getValue(ev.rowKey, 'drCr');
            const subdCd1 = acctCdGrid.getValue(ev.rowKey, 'subdCd1');
            const subdNm1 = acctCdGrid.getValue(ev.rowKey, 'subdNm1');
            const subdCd2 = acctCdGrid.getValue(ev.rowKey, 'subdCd2');
            const subdNm2 = acctCdGrid.getValue(ev.rowKey, 'subdNm2');
            const acctChar = acctCdGrid.getValue(ev.rowKey, 'acctChar');
            const useYn = acctCdGrid.getValue(ev.rowKey, 'useYn');
            const ordNo = acctCdGrid.getValue(ev.rowKey, 'ordNo');
            const acctClsf = acctCdGrid.getValue(ev.rowKey, 'acctClsf');

            reset();

            document.querySelector('.acct_info_wrap input[name=acctCd]').value = acctCd;
            document.querySelector('.acct_info_wrap input[name=acctNm]').value = acctNm;
            document.querySelector('.acct_info_wrap input[name=acctNmEng]').value = acctNmEng;
            document.querySelector('.acct_info_wrap input[name=acctLev]').value = acctLev;
            document.querySelector('.acct_info_wrap input[name=upAcctNm]').value = upAcctNm;
            document.querySelector('.acct_info_wrap input[name=upAcctCd]').value = upAcctCd;
            document.querySelector('.acct_info_wrap input[name=subdCd1]').value = subdCd1;
            document.querySelector('.acct_info_wrap input[name=subdNm1]').value = subdNm1;
            document.querySelector('.acct_info_wrap input[name=subdCd2]').value = subdCd2;
            document.querySelector('.acct_info_wrap input[name=subdNm2]').value = subdNm2;
            document.querySelector('.acct_info_wrap input[name=ordNo]').value = ordNo;


            if(acctChar==null){
                document.querySelector('.acct_info_wrap select[name=acctChar]').value ='';
            }else{
                document.querySelector('.acct_info_wrap select[name=acctChar]').value = acctChar;
            }
            if(acctClsf==null){
                document.querySelector('.acct_info_wrap select[name=acctClsf]').value = '';
            }else{
                document.querySelector('.acct_info_wrap select[name=acctClsf]').value = acctClsf;
            }

            if (drCr == 'D') {
                document.querySelector('.acct_info_wrap input[type=radio][value=D]').checked = true;
            } else if (drCr == 'C') {
                document.querySelector('.acct_info_wrap input[type=radio][value=C]').checked = true;
            }

            if (useYn == 'Y') {
                document.querySelector('.acct_info_wrap input[type=radio][value=Y]').checked = true;
            } else if (useYn == 'N') {
                document.querySelector('.acct_info_wrap input[type=radio][value=N]').checked = true;
            }

            mgtItem(acctCd);
        });
    };

    let loadMgtItemGrid = () => {
        const columnData = [

            {
                header: "코드",
                name: 'mgtItmCd',
                width: 100,
                renderer: {
                    type: SearchIconRenderer
                },
                align: 'center'
            },
            {
                header: "관리항목",
                name: 'mgtItmNm',
                align: 'center'
            },
            {
                header: "보조부",
                name: 'subdYn',
                width: 70,
                renderer: {
                    type: CheckBoxYNRenderer
                },
                align: 'center'
            },
            {
                header: "차변필수",
                name: 'drInstYn',
                width: 70,
                renderer: {
                    type: CheckBoxYNRenderer
                },
                align: 'center'
            },
            {
                header: "대변필수",
                name: 'crInstYn',
                width: 70,
                renderer: {
                    type: CheckBoxYNRenderer
                },
                align: 'center'
            },
        ];
        const dataSource = {
            api: {
                readData: {
                    url: '/mis/act/act-0001/act-mgt-list',
                    method: 'GET'
                }
            },
            serialize(params) {
                return Qs.stringify(params);
            },
            initialRequest: false
        };
        mgtItemGrid = new Grid({
            el: document.getElementById('grid2'),
            rowHeaders: ['rowNum','checkbox'],
            columns: columnData,
            data: dataSource,
            bodyHeight: 250,
        });

    }


    window.addEventListener('load', () => {
        init();
    });

    function init() {
        loadAcctCdGrid();
        setRefreshObserver(acctCdGrid);
        loadMgtItemGrid();
        setRefreshObserver(mgtItemGrid);
    }

    function mgtItem(acctCd) {
        mgtItemGrid.readData(undefined, {'acctCd': acctCd}, true);
    }

    function reset() {
        document.querySelectorAll('.acct_info_wrap .input').forEach(el => {
            el.value = '';
        });

        document.querySelectorAll('.acct_info_wrap input[type=radio]').forEach(el => {
            el.checked = false;
        });

        document.querySelectorAll('.acct_info_wrap select').forEach(el => {
            el.value = '';
        });
    }
</script>