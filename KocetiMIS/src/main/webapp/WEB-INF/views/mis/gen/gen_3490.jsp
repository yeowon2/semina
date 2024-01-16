<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>기숙사퇴실신청</title>
  <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/common/modal.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/css/mis/gen/gen_3430.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-date-picker.css"/>"/>
  <link rel="stylesheet" href="<c:url value="/resources/lib/tui-grid/tui-time-picker.css"/>"/>
</head>
<body>
<div class="modal_bg" id="add_model">
  <div class="modal">
    <div class="modal_close_btn">
      <span class="material-symbols-outlined weight-500">close</span>
    </div>
    <h2 class="modal_title">기숙사퇴실신청</h2>
    <div class="root_container">
      <div class="container rqst_info_container">
        <span class="sub_title">신청자정보</span>
        <div class="row_wrap">
          <div class="input_wrap">
            <label>신청번호</label>
            <input name="rqstNo" type="text" class="input_text">
          </div>
          <div class="input_wrap datepicker_wrap">
            <c:set var="date" value="<%=new java.util.Date()%>"/>
            <c:set var="today"><fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/></c:set>
            <label>신청일</label>
            <input type="date" name="rqstDt"  class="input_text" value="${today}">
          </div>
        </div>
        <div class="row_wrap">
          <div class="input_wrap">
            <label>부서</label>
            <input name="rqstDeptNm" type="text" class="input_text">
            <input name="rqstDeptCd" type="text" class="input_text" style="display: none;">
          </div>
          <div class="input_wrap">
            <label>직급</label>
            <input name="rqstGrdNm" type="text" class="input_text">
            <input name="rqstGrdCd" type="text" class="input_text" style="display:none;">
          </div>
        </div>
        <div class="row_wrap">
          <div class="input_wrap">
            <label>성명</label>
            <div class="search_wrap" style="margin-right:10px; ">
              <input name="rqstEmpNm" type="text" class="search_input input_text">
              <button class="search_btn">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                </svg>
              </button>
            </div>
            <input name="rqstEmpNo" type="text" class="input_text">
          </div>
          <div class="input_wrap">
            <label>승인상태</label>
            <select name="apvStatCd">
              <option name="apvStatCd" value="002-0010">임시저장</option>
              <option name="apvStatCd" value="002-0020">진행중</option>
              <option name="apvStatCd" value="002-0030">회수</option>
              <option name="apvStatCd" value="002-0040">반려</option>
              <option name="apvStatCd" value="002-0050">승인</option>
            </select>
          </div>
        </div>
      </div>
      <div class="container tenant_info_container">
        <span class="sub_title">입주자정보</span>
        <div class="row_wrap">
          <div class="input_wrap">
            <label>부서</label>
            <input name="deptNm" type="text" class="input_text">
            <input name="deptCd" type="text" class="input_text" style="display:none;">
          </div>
          <div class="input_wrap label_wrap">
            <label>사원구분</label>
            <input name="empCls" value="801-010" type="checkbox"  checked>
            <label>내부인</label>
            <input name="empCls" value="801-020" type="checkbox" >
            <label>외부인</label>
          </div>
        </div>
        <div class="row_wrap">
          <div class="input_wrap">
            <label>성명</label>
            <div class="search_wrap" style="margin-right:10px; ">
              <input name="empNm" type="text" class="search_input input_text">
              <button class="search_btn">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                </svg>
              </button>
            </div>
            <input name="empNo" type="text" class="input_text">
          </div>
          <div class="input_wrap">
            <label>직급</label>
            <input name="grdNm" type="text" class="input_text" >
            <input name="grdCd" type="text" class="input_text" style="display: none;" >
          </div>
        </div>
        <div class="row_wrap">
          <div class="input_wrap">
            <label>휴대폰</label>
            <input name="cellPonNo" type="text" class="input_text">
          </div>
          <div class="input_wrap">
            <label>내선번호</label>
            <input name="telNo" type="text" class="input_text">
          </div>
        </div>
        <div class="row_wrap">
          <div class="input_wrap datepicker_wrap">
            <label>배정동호실</label>
            <input name="roomNm"  type="text" class="input_text">
          </div>
          <div class="input_wrap label_wrap">
            <label>성별</label>
            <input name="sexDist" value="M" type="checkbox" >
            <label>남</label>
            <input name="sexDist" value="F" type="checkbox" >
            <label>여</label>
          </div>
        </div>
        <div class="row_wrap">
          <div class="input_wrap date_wrap">
            <label>기간</label>
            <input name="frmDt" type="date" class="input_text">~
            <input name="toDt" type="date" class="input_text">
          </div>
        </div>
        <div class="row_wrap">
          <div class="input_wrap datepicker_wrap">
            <label>입실일</label>
            <input name="hrmFrmDt" type="date" class="input_text">
          </div>
          <div class="input_wrap datepicker_wrap" >
            <label>퇴실일</label>
            <input name="hrmToDt" type="date" class="input_text">
          </div>
        </div>
      </div>
      <div class="container bottom_container">
        <div class="assign_info_container bottom">
          <span class="sub_title">신청정보</span>
          <div class="input_wrap datepicker_wrap">
            <label>퇴실희망일</label>
            <input type="date" class="input_text" name="hopeDt">
          </div>
          <span class="sub_title">신청정보</span>
          <div class="input_wrap datepicker_wrap">
            <label>실제퇴실일</label>
            <input type="date" class="input_text" name="actDt">
          </div>
          <div class="input_wrap">
            <label>비고</label>
            <input type="text" class="input_text">
          </div>
        </div>
        <div class="notice_info_container bottom">
          <p class="important_text"><span>&#8251;</span>키는 필히 반납하여 주시기 바랍니다.</p>
          <div class="notice_wrap">
            <ul class="notice_list">
              <li class="notice_item">퇴거하실 때에는 다음 입주자를 위하여 본인이 이용하였던 비품정돈 및 내부청소를 깨끗이 한 후 관리실의 확인을 받으시기 바랍니다.</li>
              <li class="notice_item">기숙사퇴거일은 키를 반납하신 날입니다.</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="btn_container">
      <button type="button" class="btn primary_btn">저장</button>
      <button type="button" class="btn primary_btn">승인요청</button>
      <button type="button" class="btn primary_btn">삭제</button>
    </div>
  </div>
</div>
</body>
</html>
<script src="<c:url value="/resources/lib/axios.js"/>"></script>
<script>
  document.querySelector('.modal_close_btn').addEventListener('click',()=> close());

  function search_item(rqstNo){
    reset();
    axios({
      method:"get",
      url:"/mis/gen/gen-3480/dorm-rqst-item",
      params:{rqstNo:rqstNo}
    })
    .then(function (res){

      const result=res.data;

      document.querySelector('.modal_bg').classList.add('show');
      document.querySelector('body').style.overflow = 'hidden';

      console.log(result);
      document.querySelector('.modal input[name=rqstNo]').value=result.rqstNo;
      document.querySelector('.modal input[name=rqstDt]').value= dateFormatter(result.rqstDt);
      document.querySelector('.modal input[name=rqstDeptNm]').value=result.rqstDeptNm;
      document.querySelector('.modal input[name=rqstGrdNm]').value=result.rqstGrdNm;
      document.querySelector('.modal input[name=rqstEmpNo]').value=result.rqstEmpNo;
      document.querySelector('.modal input[name=rqstEmpNm]').value=result.rqstEmpNm;
      document.querySelector('.modal select[name=apvStatCd]').value=result.apvStatCd;

      document.querySelector('.modal input[name=deptNm]').value=result.deptNm;
      document.querySelector('.modal input[name=empNm]').value=result.empNm;
      document.querySelector('.modal input[name=empNo]').value=result.empNo;
      document.querySelector('.modal input[name=grdNm]').value=result.grdNm;
      document.querySelector('.modal input[name=hopeDt]').value=dateFormatter(result.hopeDt);
      document.querySelector('.modal input[name=cellPonNo]').value=result.cellPonNo;
      document.querySelector('.modal input[name=telNo]').value=result.telNo;
      document.querySelector('.modal input[name=hrmFrmDt]').value=dateFormatter(result.hrmFrmDt);
      document.querySelector('.modal input[name=hrmToDt]').value=dateFormatter(result.hrmToDt);
      document.querySelector('.modal input[name=frmDt]').value=dateFormatter(result.frmDt);
      document.querySelector('.modal input[name=toDt]').value=dateFormatter(result.toDt);
      document.querySelector('.modal input[name=roomNm]').value=result.roomNm;

      document.querySelector('.modal input[name=hopeDt]').value=dateFormatter(result.hopeDt);
      document.querySelector('.modal input[name=actDt]').value=dateFormatter(result.actDt);

      if(result.empCls === '801-010'){
        document.querySelector('.modal input[name=empCls][value="801-010"]').checked=true;
        document.querySelector('.modal input[name=empCls][value="801-020"]').checked=false;
      }else if(result.empCls === '801-020'){
        document.querySelector('.modal input[name=empCls][value="801-010"]').checked=false;
        document.querySelector('.modal input[name=empCls][value="801-020"]').checked=true;
      }

      if(result.sexDist === 'M'){
        document.querySelector('.modal input[name=sexDist][value=M]').checked=true;
        document.querySelector('.modal input[name=sexDist][value=F]').checked=false;
      }else if(result.sexDist === 'F'){
        document.querySelector('.modal input[name=sexDist][value=M]').checked=false;
        document.querySelector('.modal input[name=sexDist][value=F]').checked=true;

      }
    });

    document.querySelectorAll('.modal  input').forEach((e)=>{

      e.disabled=true;
    });
    document.querySelectorAll('.modal  select').forEach((e)=>{

      e.disabled=true;
    });
  }

  close =() =>{
    document.querySelector('.modal_bg').classList.remove('show');
    document.querySelector('body').style.overflow = 'initial';
  }

  function reset(){
    document.querySelectorAll('.modal  input').forEach((e)=>{
      e.disabled=false;

    });
    document.querySelectorAll('.modal  input[type=text]').forEach((e)=>{

      e.value="";

    });
    document.querySelectorAll('.modal  input[type=date]').forEach((e)=>{

      e.value="";

    });
    document.querySelectorAll('.modal  select').forEach((e)=>{
      e.disabled=false;
      e.value="";
    });

    document.querySelector('.modal input[name=sexDist]').checked=false;
    document.querySelector('.modal input[name=empCls][value="801-010"]').checked=true;
    document.querySelector('.modal input[name=empCls][value="801-020"]').checked=false;
  }
</script>
