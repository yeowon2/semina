<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>계좌관리</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-grid.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-pagination.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-date-picker.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-time-picker.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/mis/act/act_0005.css"/>"/>
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
                    <span class="current_menu">계좌관리</span>
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
                    <label>사업장</label>
                    <select class="input_text" name="busiPlcCd">
                        <option name="busiPlcCd" value="">---전체---</option>
                        <option name="busiPlcCd" value="01">건설기계부품연구원</option>
                    </select>
                </div>
                <div>
                    <label>은행명</label>
                    <input class="input_text" name="bkNm">
                </div>
                <div>
                    <label>계좌번호</label>
                    <input class="input_text" name="bkAccNo">
                </div>
                <div>
                    <label>사용유무</label>
                    <select class="input_text" name="useYn">
                        <option name="useYn" value="">--전체--</option>
                        <option name="useYn" value="Y" selected>사용</option>
                        <option name=useYn"" value="N">미사용</option>
                    </select>
                </div>
            </div>
            <div class="bottom">
                <div class="bottom_top">
                    <label>계좌내역</label>
                    <div class="button_wrap">
                        <button type="button" class="btn white_btn button" id="addBtn">추가</button>
                        <button type="button" class="btn gray_btn button" id="delete">삭제</button>
                    </div>
                </div>
                <div id="grid">
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

    let actBankAcctGrid;
    let loadActBankAcctGrid=()=>{
        const columnData=[
            {
                header: "은행명",
                name: 'bkNm',
                align: 'center',
                renderer: {
                    type: SearchIconRenderer
                },
                width: 100
            },
            {
                header: "계좌번호",
                name: 'bkAccNo',
                align: 'center',
                editor: 'text',
                width: 150
            },
            {
                header: "지점명",
                name: 'brncOffc',
                align: 'center',
                editor: 'text',
                width: 80
            },
            {
                header: "예금주",
                name: 'dpsitNm',
                align: 'center',
                editor: 'text',
                width: 100
            },
            {
                header: "예금계정코드",
                name: 'acctCd',
                align: 'center',
                width: 120,
                renderer: {
                    type: SearchIconRenderer
                }
            },
            {
                header: "통장용도",
                name: 'dpsitUse',
                align: 'center',
                width: 120,
                editor: 'text',
                align:'center'
            },
            {
                header: "예금종류",
                name: 'dpsitTp',
                align: 'center',
                formatter: 'listItemText',
                editor: {
                    type: 'select',
                    options: {
                        listItems: [
                            {text:'보통예금' , value: '306-001'},
                            {text:'정기예금' , value: '306-002'},
                            {text:'MMDA' , value: '306-003'},
                            {text:'MMF' , value: '306-004'},
                            {text:'MMT' , value: '306-005'},
                            {text:'퇴직연금신탁' , value: '306-006'},
                        ]
                    }
                },
                width: 80,
            },
            {
                header: "개설일자",
                name: 'openDt',
                align: 'center',
                editor: 'text',
                renderer: {
                    type: DatePickerRenderer
                },
                width: 100,
            },
            {
                header: "만길일자",
                name: 'termDt',
                align: 'center',
                editor: 'text',
                renderer: {
                    type: DatePickerRenderer
                },
                width: 100,
            },
            {
                header: "이율",
                name: 'rate',
                align: 'center',
                width: 30,
                editor: 'text',
            },
            {
                header: "운용구분",
                name: 'oprtCls',
                align: 'center',
                formatter: 'listItemText',
                editor: {
                    type: 'select',
                    options: {
                        listItems: [
                            {text:'수시입출금' , value: '307-001'},
                            {text:'자금운용' , value: '307-002'}
                        ]
                    }
                },
                width: 100
            },
            {
                header: "운용목적",
                name: 'oprtPps',
                align: 'center',
                formatter: 'listItemText',
                editor: {
                    type: 'select',
                    options: {
                        listItems: [
                            {text:'보통예금(일반)' , value: '309-001'},
                            {text:'MMDA(일반)' , value: '309-002'},
                            {text:'MMDA(유동성확보)' , value: '309-003'},
                            {text:'정기예금(자금운용)' , value: '309-004'},
                            {text:'MMT(유동성확보)' , value: '309-005'},
                            {text:'퇴직연금신탁' , value: '309-006'},
                        ]
                    }
                },
                width: 100
            },
            {
                header: "비고",
                name: 'rmk',
                minWidth: 220
            },
        ];

        const dataSource = {
            api: {
                readData: {
                    url: '/mis/act/act-0005/act-bank-acct-list',
                    method: 'GET',
                    initParams: {
                        "busiPlcCd": '',
                        "bkNm": '',
                        "bkAccNo": '',
                        "useYn": document.querySelector('select[name=useYn]').value,
                    }
                }
            },
            serialize(params) {
                return Qs.stringify(params);
            },
            initialRequest: true
        };
      actBankAcctGrid=new Grid({
          el: document.getElementById('grid'),
          rowHeaders: ['rowNum', 'checkbox'],
          columns: columnData,
          data: dataSource,
          columnOptions:{
            frozenCount:3,
            frozenBorderWidth:1,
            resizable: true

          },
          bodyHeight: 550,
          minRowHeight: 20,
          rowHeight: 30,
          scrollX: true,
          scrollY: true

      });
    }

    window.addEventListener('load',()=>{
        init();
    })
    function init(){
        loadActBankAcctGrid();
        setRefreshObserver(actBankAcctGrid);
    }

    search = () => {
        let search_item = {
            "busiPlcCd":document.querySelector('select[name=busiPlcCd]').value,
            "bkNm": document.querySelector('input[name=bkNm]').value,
            "bkAccNo": document.querySelector('input[name=bkAccNo]').value,
            "useYn": document.querySelector('select[name=useYn]').value,

        }
        actBankAcctGrid.readData(undefined, search_item, true);
    };
</script>