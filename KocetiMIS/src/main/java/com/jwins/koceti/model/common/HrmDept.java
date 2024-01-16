package com.jwins.koceti.model.common;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class HrmDept {

    public String deptCd;       // 부서코드
    public String deptNm;       // 부서명
    public String deptFrmDt;    // 부서생성일자
    public String deptToDt;     // 부서폐쇄일자
    public String lev;          // 레벨
    public String ordNo;        // 정렬번호
    public String deptGrpCd;    // 부서그룹코드
    public String deptEmpNo;    // 부서장사번
    public String teamYn;       // 팀여부
    public String postDeptCd;   // 소속부서코드
    public String useYn;        // 사용여부
    public String deptEngNm;    // 부서영문명
    public String deptCls;      // 부서구분
    public String bdgDeptCls;   // 부서계정구분
    public String deptSectryEmpNo;  // 비서번호
    public String upDeptCd;     // 상위부서코드
    public String ordNoList;    // 부서순서
    public String deptArea;     // 부서위치
    public Date insDt;          // 등록일
    public String insId;        // 등록자
    public Date uptDt;          // 수정일
    public String uptId;        // 수정자
}
