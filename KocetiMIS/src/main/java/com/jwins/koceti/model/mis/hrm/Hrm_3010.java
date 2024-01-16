package com.jwins.koceti.model.mis.hrm;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Hrm_3010 {
    private String deptNm;  //부서명
    private String empNo;   //사번
    private String empNm;   //성명
    private String age;     //나이
    private String sexDist; //성별
    private String resNo;   //주민등록번호
    private String holdOffiNm;  //재직구분
    private String empClsNm;    //고용형태
    private String jobTpNm;     //직종명
    private String grdNm;       //직급명
    private String jobPostNm;   //직위명
    private String salStep;     //호봉
    private String entDt;       //입사일
    private String entClsNm;    //입사구분
    private String emplClsNm;   //채용구분
    private String gunsokDt;    //근속일자
    private String rsignCls;    //퇴직구분
    private String rsignDt;     //인사발령명
    private String lastSchla;   //최종학력
    private String lastSchlNm;  //최종학교명
    private String emailAddr;   //이메일
}
