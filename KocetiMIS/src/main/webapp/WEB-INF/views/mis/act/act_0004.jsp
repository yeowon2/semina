<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>은행코드관리</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-grid.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-pagination.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/mis/act/act_0004.css"/>"/>
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
                    <span class="current_menu">은행코드관리</span>
                </div>
            </div>
        </div>
        <div class="body">
            <div class="top">
                <div class="btn_container">
                    <button type="button" class="btn gray_btn">도움말</button>
                    <button type="button" class="btn excel_btn" id="excelBtn">엑셀</button>
                    <button type="button" class="btn white_btn">신규</button>
                    <button type="button" class="btn primary_btn" id="submitBtn">조회</button>
                    <button type="button" class="btn white_btn">저장</button>
                </div>
            </div>
            <div class="param_container">
                <div>
                    <label>은행명</label>
                    <input class="input_text" name="bkNm">
                </div>
            </div>
            <div class="bottom">
                <div class="left">
                    <div class="left_top">
                        <label>은행내역</label>
                    </div>
                    <div id="grid"></div>
                </div>
                <div class="right">
                    <div class="right_top">
                        <label>은행정보</label>
                    </div>
                    <div class="scroll_layout">
                        <div class="bk_info_wrap">
                            <div class="row">
                                <div class="col">
                                    <label>은행코드</label>
                                    <input class="input" name="bkCd">
                                </div>
                                <div class="col">
                                    <label>은행명(한글)</label>
                                    <input class="input" name="bkNm">
                                </div>
                            </div>
                            <div class="row">
                                <label>은행명(영문)</label>
                                <input class="input" name="bkNmEng">
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label>사업자번호</label>
                                    <input class="input" name="regNo">
                                </div>
                                <div class="col">
                                    <label>사용유무</label>
                                    <input name="useYn" type="radio" value="Y" class="input_radio">사용
                                    <input name="useYn" type="radio" value="N" class="input_radio"
                                           style="margin-left : 10px;">미사용
                                </div>
                            </div>
                            <div class="row">
                                <label>주소</label>
                                <div class="input search small_input">
                                    <input name="postNo" type="text" class="search_input  ">
                                    <button class="search_btn">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                             fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                        </svg>
                                    </button>
                                </div>
                                <input name="addr" class="input lage_input">
                            </div>
                            <div class="row">
                                <label>상세주소</label>
                                <input class="input" name="addrDtl">
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label>전화번호</label>
                                    <input class="input" name="telNo">
                                </div>
                                <div class="col">
                                    <label>팩스번호</label>
                                    <input class="input" name="faxNo">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label>대표자</label>
                                    <input class="input" name="chrgNm">
                                </div>
                                <div class="col">
                                    <label>핸드폰번호</label>
                                    <input class="input" name="hpNo">
                                </div>
                            </div>
                        </div>
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

    let Grid = tui.Grid;
    Grid.setLanguage('ko');

    let actBankGrid;

    let loadActBankGrid = () => {
        const columnData = [
            {
                header: "은행코드",
                name: 'bkCd',
                align: 'center',
                width: 80
            },
            {
                header: "은행명",
                name: 'bkNm',
                width: 110
            },
            {
                header: "은행명(영문)",
                name: 'bkNmEng'
            },
            {
                header: "사업자번호",
                name: 'regNo',
                hidden: true
            },
            {
                header: "사용유무",
                name: 'useYn',
                hidden: true
            },
            {
                header: "우편주소",
                name: 'postNo',
                hidden: true
            },
            {
                header: "주소",
                name: 'addr',
                hidden: true
            },
            {
                header: "상세주소",
                name: 'addrDtl',
                hidden: true
            },
            {
                header: "전화번호",
                name: 'telNo',
                hidden: true
            },
            {
                header: "팩스번호",
                name: 'faxNo',
                hidden: true
            },
            {
                header: "대표자",
                name: 'chrgNm',
                hidden: true
            },
            {
                header: "핸드폰번호",
                name: 'HpNo',
                hidden: true
            },
        ];

        const dataSource = {
            api: {
                readData: {
                    url: '/mis/act/act-0004/act-bank-list',
                    method: 'GET',
                    initParams: {
                        "bkNm": ''
                    }
                }
            },
            serialize(params) {
                return Qs.stringify(params);
            },
            initialRequest: true
        };
        actBankGrid = new Grid({
            el: document.getElementById('grid'),
            rowHeaders: ['rowNum'],
            columns: columnData,
            data: dataSource,
            bodyHeight: 550,
            header: {
                complexColumns: [
                    {
                        header: '은행명',
                        name: 'bkNmHeader',
                        childNames: ['bkNm', 'bkNmEng'],
                        hideChildHeaders: true
                    }
                ]
            }
        });
        actBankGrid.on('click', (ev) => {
            const bkCd = actBankGrid.getValue(ev.rowKey, 'bkCd');
            const bkNm = actBankGrid.getValue(ev.rowKey, 'bkNm');
            const bkNmEng = actBankGrid.getValue(ev.rowKey, 'bkNmEng');
            const regNo = actBankGrid.getValue(ev.rowKey, 'regNo');
            const useYn = actBankGrid.getValue(ev.rowKey, 'useYn');
            const addr = actBankGrid.getValue(ev.rowKey, 'addr');
            const postNo = actBankGrid.getValue(ev.rowKey, 'postNo');
            const addrDtl = actBankGrid.getValue(ev.rowKey, 'addrDtl');
            const telNo = actBankGrid.getValue(ev.rowKey, 'telNo');
            const faxNo = actBankGrid.getValue(ev.rowKey, 'faxNo');
            const chrgNm = actBankGrid.getValue(ev.rowKey, 'chrgNm');
            const hpNo = actBankGrid.getValue(ev.rowKey, 'hpNo');

            reset();

            document.querySelector('.bk_info_wrap input[name=bkCd]').value = bkCd;
            document.querySelector('.bk_info_wrap input[name=bkNm]').value = bkNm;
            document.querySelector('.bk_info_wrap input[name=bkNmEng]').value = bkNmEng;
            document.querySelector('.bk_info_wrap input[name=regNo]').value = regNo;
            document.querySelector('.bk_info_wrap input[name=addr]').value = addr;
            document.querySelector('.bk_info_wrap input[name=postNo]').value = postNo;
            document.querySelector('.bk_info_wrap input[name=addrDtl]').value = addrDtl;
            document.querySelector('.bk_info_wrap input[name=telNo]').value = telNo;
            document.querySelector('.bk_info_wrap input[name=faxNo]').value = faxNo;
            document.querySelector('.bk_info_wrap input[name=chrgNm]').value = chrgNm;
            document.querySelector('.bk_info_wrap input[name=hpNo]').value = hpNo;

            if (useYn == 'Y') {
                document.querySelector('.bk_info_wrap input[type=radio][value=Y]').checked = true;
            } else if (useYn == 'N') {
                document.querySelector('.bk_info_wrap input[type=radio][value=N]').checked = true;
            }
        });
    }

    window.addEventListener('load', () => {
        init();
    });

    function init() {
        loadActBankGrid()
        setRefreshObserver(actBankGrid);

    }

    function reset() {
        document.querySelectorAll('.bk_info_wrap .input').forEach(el => {
            el.value = '';
        });

        document.querySelectorAll('.bk_info_wrap input[type=radio]').forEach(el => {
            el.checked = false;
        });


    }
</script>