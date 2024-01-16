<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>기숙사정보관리</title>

  <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/mis/gen/gen_3410.css"/>"/>

  <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-grid.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-pagination.css"/>"/>
</head>
<body>
<div class="grid_layout">
  <%@ include file="../../template.jsp" %>
  <div class="main">
    <div class="head">
      <div class="menu_title_wrap">
        <h1>기숙사정보관리</h1>
      </div>
      <div class="bread_crumb_wrap">
        <div>
          <span>총무관리</span>
          <span>/</span>
          <span>기숙사관리</span>
          <span>/</span>
          <span  class="current_menu">기숙사정보관리</span>
        </div>
      </div>
    </div>
    <div class="body">
      <div class="search_container">
            <div class="top">
                <h2>검색조건</h2>
                <div class="btn_container">
                    <button type="button" class="btn primary_btn" id="submitBtn">조회</button>
                    <button type="button" class = "btn excel_btn" id = "excelBtn" >엑셀</button>
                </div>
            </div>
            <div class="param_container">
                <div>
                    <label>사용처구분</label>
                    <select name="homeCls" >
                        <option name="homeCls"  value="">--전체--</option>
                        <option name="homeCls" value="410-010">군산</option>

                    </select>
                </div>
                <div>
                    <label>원내/외구분</label>
                    <select name="cls" >
                        <option name="cls"  value="">--전체--</option>
                        <option name="cls"  value="491-010">원내</option>
                        <option name="cls"  value="491-020">원외</option>
                    </select>
                </div>
                <div>
                    <label>호실구분</label>
                    <select name="roomCls" >
                        <option name="roomCls" value="">--전체--</option>
                        <option name="roomCls" value="492-010">1인실</option>
                        <option name="roomCls" value="492-020">2인실</option>
                        <option name="roomCls" value="492-030">3인실</option>
                        <option name="roomCls" value="492-040">4인실</option>
                        <option name="roomCls" value="492-800">게스트룸</option>
                        <option name="roomCls" value="492-900">귀빈실</option>
                        <option name="roomCls" value="492-990">창고</option>
                    </select>
                </div>
                <div>
                    <label>사용여부</label>
                    <select name="useYn" >
                        <option name="useYn" value="">--전체--</option>
                        <option name="useYn" value="Y">사용</option>
                        <option name="useYn" value="N">미사용</option>
                    </select>
                </div>
                <div>
                    <label>동번호</label>
                    <input class="input_text" type="text" name="houseNo">
                </div>
                <div>
                    <label>방번호</label>
                    <input class="input_text" type="text" name="roomNo">
                </div>
                <div>
                    <label>성별</label>
                    <select name="sexDist">
                        <option name="sexDist" value="">--전체--</option>
                        <option name="sexDist" value="M">남</option>
                        <option name="sexDist" value="F">여</option>
                        <option name="sexDist" value="A">공용</option>
                    </select>
                </div>
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
    document.getElementById('submitBtn').addEventListener('click',()=> search());
    document.getElementById('excelBtn').addEventListener('click',()=> excelDown());
    let Grid=tui.Grid;
    Grid.setLanguage('ko')


    let dormGrid;
    let loadDormGrid= () => {

        const columnData =[
            {
                header:"상태",
                name: 'tmHeader',
                width:40
            },
            {
                header: "사용처구분",
                name:'homeCls',
                align:"center",
                formatter: 'listItemText',
                editor: {
                    type: 'select',
                    options: {
                        listItems: [
                            {text:'군산' , value: '410-010'}
                        ]
                    }
                },
                width:100
            },
            {
                header: "원내/외구분",
                name:'cls',
                align:"center",
                formatter: 'listItemText',
                editor: {
                    type: 'select',
                    options: {
                        listItems: [
                            {text:'원내' , value: '491-010'},
                            {text:'원외' , value: '491-020'}
                        ]
                    }
                },
                width:100
            },
            {
                header: "동번호",
                name:'houseNo',
                align:"center",
                width:100
            },
            {
                header: "호실",
                name:'roomNo',
                align:"center",
                width:100
            },
            {
                header: "호실구분",
                name:'roomCls',
                align:"center",
                formatter: 'listItemText',
                editor: {
                    type: 'select',
                    options: {
                        listItems: [
                            {text:'1인실' , value: '492-010'},
                            {text:'2인실' , value: '492-020'},
                            {text:'3인실' , value: '492-030'},
                            {text:'4인실' , value: '492-040'},
                            {text:'게스트룸' , value: '492-800'},
                            {text:'귀빈실' , value: '492-900'},
                            {text:'창고' , value: '492-990'}
                        ]
                    }
                },
                width:100
            },
            {
                header: "호실내순번",
                name:'roomNoSeq',
                align:"center",
                width:100
            },
            {
                header: "성별",
                name:'sexDist',
                align:"center",
                formatter: 'listItemText',
                editor: {
                    type: 'select',
                    options: {
                        listItems: [
                            {text:'남' , value: 'M'},
                            {text:'여' , value: 'F'},
                            {text:'공용' , value: 'A'},
                        ]
                    }
                },
                width:100
            },
            {
                header: "월사용액",
                name:'useFree',
                align:"right",
                width:150
            },
            {
                header: "일사용요금",
                name:'useFreeDay',
                align:"right",
                width:150
            },
            {
                header: "사용여부",
                name:'useYn',
                align:"center",
                renderer:{
                    type:CheckBoxYNRenderer,

                },
                width:100

            },
            {
                header: "비고",
                name:'rmk',
                align:"center",
                minWidth:200
            },
        ];
        const dataSource={
            api:{
                readData:{url:'/gen/gen-3410/dorm-list', method:'GET'}
            },
            serialize(params){
                return Qs.stringify(params);
            },
            initialRequest: true
        };

        dormGrid=new Grid({
            el: document.getElementById('grid'),
            rowHeaders:['checkbox'],
            columns:columnData,
            data:dataSource,
            minRowHeight : 20,
            rowHeight : 30,
            scrollX:true,
            scrollY:true
        });

    }
    search=()=>{
        let search_item={
            'homeCls':  document.querySelector('select[name=homeCls]').value,
            'cls':document.querySelector('select[name=cls]').value,
            'roomCls': document.querySelector('select[name=roomCls]').value,
            'useYn':document.querySelector('select[name=useYn]').value,
            'houseNo':document.querySelector('input[name=houseNo]').value,
            'roomNo':document.querySelector('input[name=roomNo]').value,
            'sexDist': document.querySelector('select[name=sexDist]').value
        }
        console.log(search_item);
        dormGrid.readData(undefined,search_item,true);
    };
    excelDown=()=>{
        const options = {
            includeHeader : true,
            fileName : '기숙사정보',
            useFormattedValue : true,
        }
        dormGrid.export('xlsx', options);
    }
    window.addEventListener('load', () => {
        loadDormGrid();
        search();
    });

</script>