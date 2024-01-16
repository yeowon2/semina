package com.jwins.koceti.model.mis.gen;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GenDormRqst {
    private String rqstNo; // 신청번호
    private  String rqstDt;  //신청일
    private String rqstDeptCd; //신청자 부서코드
    private String rqstDeptNm; //신청자 부서명
    private String rqstGrdCd; //신청자 직급코드
    private String rqstGrdNm; //신청자 직급명
    private String emailAddr ;//이메일
    private String rqstEmpNo; //신청자 코드
    private String rqstEmpNm; //신청자 이름
    private String deptCd;  //부서코드
    private String deptNm;  //부서명
    private String grdNm;  //직급명
    private String empClsNm;  //사원구분
    private String empCls; //사원구분코드
    private String empNo;  //사원번호
    private String empNm;  //사원명
    private String houseNo;  //동
    private String roomNo;  //호수
    private int roomNoSeq;  //호실내순번
    private String clsNm; //원내외구분
    private String roomClsNm;  //호실구분
    private String hopeDt;  //입시희망일
    private String frmDt;  //실제입시일
    private String toDt;  //실제퇴실일
    private String roomNm; //배정동호실
    private String payYn;  //임금지급대상
    private String apvStatNm;  //승인상태한글
    private String apvStatCd; //승인상태코드
    private String homeCls; //지역코드
    private String hrmFrmDt; //입원일
    private String hrmToDt; //계약종료일
    private String postNo; //우편번호
    private String addr; //주소
    private String addrDtl;//상세주소
    private String cellPonNo;//휴대폰
    private String telNo;//내선번호
    private String sexDist; //성별
    private String actDt; //실제적용일


}
