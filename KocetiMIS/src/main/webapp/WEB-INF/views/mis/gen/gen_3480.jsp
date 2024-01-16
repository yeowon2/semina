<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기숙사퇴실신청</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/mis/gen/gen_3420.css"/>"/>

    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-grid.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-pagination.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-date-picker.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-time-picker.css"/>"/>
</head>
<body>
<div class="grid_layout">
    <%@ include file="../../template.jsp"%>
    <div class="main">
        <div class="head">
            <div class="menu_ttile_wrap">
                <h1>기숙사퇴실신청</h1>
            </div>
            <div class="bread_crumb_wrap">
                <div>
                    <span>총무관리</span>
                    <span>/</span>
                    <span>기숙사관리</span>
                    <span>/</span>
                    <span  class="current_menu">기숙사입주신청</span>
                </div>
            </div>
        </div>
        <div class="body">
            <div class="search_container">
                <div class="top">
                    <h2>검색조건</h2>
                    <div class="btn_container">
                        <button type="button" class="btn primary_btn" id="submitBtn">조회</button>
                        <button type="button" class="btn primary_btn" id="addBtn">신청</button>
                        <button type="button" class ="btn excel_btn" id = "excelBtn" >엑셀</button>
                    </div>
                </div>
                <div class="param_container">
                    <div>
                        <label>성명</label>
                        <div class="search_wrap" >
                            <input class="search_input" type="text" name="empNm">
                            <button class="search_btn">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                </svg>
                            </button>
                        </div>
                        <input type="text" name="empNo" style="display: none">
                    </div>
                    <div>
                        <label>신청부서</label>
                        <div class="search_wrap">
                            <input class="search_input" type="text" name="deptNm">
                            <button class="search_btn">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                    <div>
                        <c:set var="date" value="<%=new java.util.Date()%>"/>
                        <c:set var="today"><fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/></c:set>
                        <c:set var="nowYY"><fmt:formatDate value="${date}" pattern="yyyy"/></c:set>
                        <label>신청기간</label>
                        <div class="datepicker_wrap">
                            <input type="date" name="frDt" class="input_text" value="${nowYY}-01-01"/>
                            ~
                            <input type="date" name="toDt" class="input_text" value="${today}"/>
                        </div>
                    </div>
                    <div>
                        <label>승인상태</label>
                        <select name="apvStatCd" >
                            <option name="apvStatCd" value="">--전체--</option>
                            <option name="apvStatCd" value="002-0010">임시저장</option>
                            <option name="apvStatCd" value="002-0020">진행중</option>
                            <option name="apvStatCd" value="002-0030">회수</option>
                            <option name="apvStatCd" value="002-0040">반려</option>
                            <option name="apvStatCd" value="002-0050">승인</option>
                        </select>
                    </div>
                    <div>
                        <label>직급</label>
                        <select name="grdCd">
                            <option name="grdCd" value="">--전체--</option>
                            <option name="grdCd" value="104-010">원장</option>
                            <option name="grdCd" value="104-030">책임</option>
                            <option name="grdCd" value="104-040">선임</option>
                            <option name="grdCd" value="104-050">전임</option>
                            <option name="grdCd" value="104-060">원</option>
                            <option name="grdCd" value="104-070">연구보조</option>
                            <option name="grdCd" value="104-080">행정기능원</option>
                            <option name="grdCd" value="104-110">전문위원</option>
                            <option name="grdCd" value="104-130">인턴</option>
                        </select>
                    </div>
                    <div class="datepicker_wrap">
                        <label>퇴실희망일</label>
                        <input type="date" name="hopeDt" class="input_text">
                    </div>
                </div>
            </div>
            <div id="grid"></div>
            <%@ include file="gen_3490.jsp" %>
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
    document.getElementById('submitBtn').addEventListener('click',()=> search());
    document.getElementById('addBtn').addEventListener('click',()=> addModal_open());
    document.getElementById('excelBtn').addEventListener('click',()=> excelDown());
    let Grid =tui.Grid;
    Grid.setLanguage('ko')

    let loadDormGrid= () =>{
        const columnData =[
            {
                header:"사원 구분",
                name: 'empClsNm',
                align:"center",
                editable:'normal',
                width:80,


            },
            {
                header:"신청일",
                name: 'rqstDt',
                renderer:{
                    type:DateFormatRenderer
                },
                align:"center",
                width:120
            },
            {
                header:"입주자",
                name: 'empNm',
                align:"center",
                width:100

            },
            {
                header:"입주부서",
                name: 'deptNm',
                align:"center",
                width:200
            },
            {
                header:"직급",
                name: 'grdNm',
                align:"center",
                width:50
            },

            {
                header:"퇴실희망일",
                name: 'hopeDt',
                renderer:{
                    type:DateFormatRenderer
                },
                align:"center",
                width:120
            },
            {
                header:"실제퇴실일",
                name: 'actDt',
                renderer:{
                    type:DateFormatRenderer
                },
                align:"center",
                width:120
            },
            {
                header:"원내/원외",
                name: 'clsNm',
                align:"center",
                width:100
            },

            {
                header:"동",
                name: 'houseNo',
                align:"center",
                width:50
            },
            {
                header:"호",
                name: 'roomNo',
                align:"center",
                width:80
            },
            {
                header:"순번",
                name: 'roomNoSeq',
                align:"center",
                width:50
            },
            {
                header:"호실구분",
                name: 'roomClsNm',
                align:"center",
                width: 100
            },


            {
                header:"승인상태",
                name: 'apvStatNm',
                align:"center",
                minWidth: 100
            },
            {
                header: '신청번호',
                name: 'rqstNo',
                hidden:true
            },
        ];

        const dataSource={
            api:{
                readData:{
                    url:'/mis/gen/gen-3480/dorm-rqst-list',
                    method:'GET',
                    initParams: {
                        empNm:'',
                        empNo:'',
                        deptNm:'',
                        frDt:document.querySelector('input[name=frDt]').value,
                        toDt:document.querySelector('input[name=toDt]').value,
                        grdCd:'',
                        hopeDt:'',
                        apvStatCd:''

                    }
                }
            },
            serialize(params){
                return Qs.stringify(params);
            },
            initialRequest: true
        };
        dormGrid=new Grid({
            el: document.getElementById('grid'),
            rowHeaders:['rowNum'],
            columns:columnData,
            header:{
                height:70,
                complexColumns:[
                    {
                        header:'배정정보',
                        name:'info',
                        childNames:['clsNm','houseNo','roomNo','roomNoSeq','roomClsNm']
                    }
                ]
            },
            data:dataSource,
            minRowHeight : 20,
            rowHeight : 30,
            scrollX:true,
            scrollY:true
        });
        // 셀 더블클릭 이벤트
        dormGrid.on('dblclick', (ev) => {

            const rqstNo=dormGrid.getValue(ev.rowKey, 'rqstNo');
            search_item(rqstNo);
        });
    }
    window.addEventListener('load', () => {
        loadDormGrid();
    });
    search=()=>{
        let search_item={
            empNm:document.querySelector('input[name=empNm]').value,
            empNo:document.querySelector('input[name=empNo]').value,
            deptNm:document.querySelector('input[name=deptNm]').value,
            frDt:document.querySelector('input[name=frDt]').value,
            toDt:document.querySelector('input[name=toDt]').value,
            apvStatCd:document.querySelector('select[name=apvStatCd]').value,
            grdCd:document.querySelector('select[name=grdCd]').value,
            hopeDt:document.querySelector('input[name=hopeDt]').value,
        }

        dormGrid.readData(undefined,search_item,true);
    };
    addModal_open=()=>{
        reset();
        document.querySelector('.modal_bg').classList.add('show');
        document.querySelector('body').style.overflow = 'hidden';

    }

</script>