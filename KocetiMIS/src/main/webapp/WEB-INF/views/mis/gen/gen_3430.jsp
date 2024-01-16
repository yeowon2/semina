<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>기숙사입주신청</title>
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
    <h2 class="modal_title">기숙사입주신청</h2>
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
            <p name="emailAddr"></p>
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
          <div class="input_wrap datepicker_wrap">
            <label>입주희망일</label>
            <input name="hopeDt"  type="date" class="input_text">
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
          <div class="input_wrap address_wrap">
            <label>주소</label>
            <div class="search_wrap">
              <input name="postNo" type="text" class="search_input input_text">
              <button class="search_btn">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                </svg>
              </button>
            </div>
             <input name="addr" type="text" class="input_text">
            <input name="addrDtl" type="text" class="input_text">
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
            <label>입원일</label>
            <input name="hrmFrmDt" type="date" class="input_text">
          </div>
          <div class="input_wrap datepicker_wrap" >
            <label>계약종료일</label>
            <input name="hrmToDt" type="date" class="input_text">
          </div>
        </div>
        <div class="row_wrap">
          <div class="input_wrap label_wrap">
            <label>입주지역/입주희망구분</label>
            <select name="homeCls">
              <option name="homeCls" >--선택--</option>
              <option name="homeCls" value="410-010" selected>군산</option>
            </select>
            <p>/</p>
            <input name="cls" value="491-010" type="checkbox" checked>
            <label>원내</label>
            <input name="cls" value="491-020" type="checkbox" >
            <label>원외</label>
          </div>
          <div class="input_wrap label_wrap">
            <label>급여대상여부</label>
            <input name="payYn" value="Y" type="checkbox" checked>
            <label>대상</label>
            <input name="payYn" value="N" type="checkbox" >
            <label>비대상</label>
          </div>
        </div>
      </div>
      <div class="container bottom_container">
        <div class="assign_info_container bottom">
          <span class="sub_title">배정정보</span>
          <div class="input_wrap datepicker_wrap">
            <label>실제입시일</label>
            <input name="frmDt" type="date" class="input_text">
          </div>
          <div class="input_wrap datepicker_wrap">
            <label>실제퇴실시일</label>
            <input type="date" class="input_text" name="toDt">
          </div>
          <div class="input_wrap">
            <label>배정동호실</label>
            <div class="search_wrap">
              <input name="roomNm" type="text" class="search_input input_text">
              <button class="search_btn">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                </svg>
              </button>
            </div>
          </div>
          <div class="input_wrap">
            <label>배정동호실</label>
            <input type="text" class="input_text">
          </div>
          <p class="important_text"><span>&#8251;</span>기숙사입주자께서는 재무시설팀에서 키를 수령하실 수 있습니다.</p>
        </div>
        <div class="notice_info_container bottom">
          <span class="sub_title">입주자 유의사항</span>
          <textarea>

                  입주자(기숙사) 유의사항 안내
               -----------------------------------

①입주자는 시설을 상시 이용이 가능하도록 유지 관리하여야 하며 다음 각 호의 사항을 준수하여야 한다.

  1. 재해의 예방 및 품위유지
  2. 전기, 수도, 가스 및 냉.난방의 절약
  3. 전용시설 및 공용시설의 청결 유지
  4. 기숙사내 질서 문란행위 금지(음주, 도박, 고성방가 등)

 ②입주자는 기숙사 시설물의 손상, 멸실, 기타 긴급한 사태가 발생하였을 때는 즉시 주관부서에 통보하여야 한다.

 ③입주자의 고의 또는 과실로 기숙사의 시설물이 손상된 때에는 변상하여야 한다.

 ④입주자는 의무사항 준수에 대한 서약서를 제출하여야 한다.


상기의 유의사항 미준수 및 이로 인한 연구원의 재산 손실 및 명예 훼손 등의 문제 발생시  퇴실, 변상조치 및 관련되는 여러 조치가 개별적으로 또는 동시에 이루어 질 수 있음을 알려드립니다.



※ 불편사항 신고 : 재무시설팀(2582)

          </textarea>
          <div class="agree_wrap">
            <p>위 내용을 숙지하였으며, 모두 동의합니다.</p>
            <input name="infoCheck" value="Y" type="checkbox">
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
      url:"/mis/gen/gen-3420/dorm-rqst-item",
      params:{rqstNo:rqstNo}
    })
   .then(function (res){

      const result=res.data;


      document.querySelector('.modal_bg').classList.add('show');
      document.querySelector('body').style.overflow = 'hidden';

      document.querySelector('.modal input[name=rqstNo]').value=result.rqstNo;
      document.querySelector('.modal input[name=rqstDt]').value= dateFormatter(result.rqstDt);
      document.querySelector('.modal p[name=emailAddr]').innerHTML=result.emailAddr;
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
       document.querySelector('.modal input[name=postNo]').value=result.postNo;
       document.querySelector('.modal input[name=addr]').value=result.addr;
       document.querySelector('.modal input[name=addrDtl]').value=result.addrDtl;
       document.querySelector('.modal input[name=cellPonNo]').value=result.cellPonNo;
       document.querySelector('.modal input[name=telNo]').value=result.telNo;
       document.querySelector('.modal input[name=hrmFrmDt]').value=dateFormatter(result.hrmFrmDt);
       document.querySelector('.modal input[name=hrmToDt]').value=dateFormatter(result.hrmToDt);
       document.querySelector('.modal select[name=homeCls]').value=result.homeCls;

       document.querySelector('.modal input[name=frmDt]').value=dateFormatter(result.frmDt);
       document.querySelector('.modal input[name=toDt]').value=dateFormatter(result.toDt);
       document.querySelector('.modal input[name=roomNm]').value=result.roomNm;

       document.querySelector('.modal input[name=infoCheck]').checked=true;

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

     if(result.cls === '491-010'){
       document.querySelector('.modal input[name=cls][value="491-010"]').checked=true;
       document.querySelector('.modal input[name=cls][value="491-020"]').checked=false;
     }else if(result.cls === '491-020'){
       document.querySelector('.modal input[name=cls][value="491-010"]').checked=false;
       document.querySelector('.modal input[name=cls][value="491-020"]').checked=true;
     }

     if(result.payYn === 'Y'){
       document.querySelector('.modal input[name=payYn][value=Y]').checked=true;
       document.querySelector('.modal input[name=payYn][value=N]').checked=false;
     }else if(result.payYn === 'N'){
       document.querySelector('.modal input[name=payYn][value=Y]').checked=false;
       document.querySelector('.modal input[name=payYn][value=N]').checked=true;
     }
      document.querySelectorAll('.modal  input').forEach((e)=>{

          e.disabled=true;
      });
     document.querySelectorAll('.modal  select').forEach((e)=>{

       e.disabled=true;
     });
     document.querySelector('.modal textarea').disabled=true;
   })
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

      e.value="";
      e.disabled=false;
    });

    document.querySelector('.modal textarea').disabled=false;

    document.querySelector('.modal input[name=sexDist]').checked=false;
    document.querySelector('.modal input[name=empCls][value="801-010"]').checked=true;
    document.querySelector('.modal input[name=empCls][value="801-020"]').checked=false;
    document.querySelector('.modal input[name=cls][value="491-010"]').checked=true;
    document.querySelector('.modal input[name=cls][value="491-020"]').checked=false;
    document.querySelector('.modal input[name=payYn][value=Y]').checked=true;
    document.querySelector('.modal input[name=payYn][value=N]').checked=false;
  }
</script>