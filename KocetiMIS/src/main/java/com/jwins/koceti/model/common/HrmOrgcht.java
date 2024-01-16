package com.jwins.koceti.model.common;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class HrmOrgcht {

    private String deptOrgCd;       // 부서조직코드
    private String structDt;        // 조직개편일
    private String upDeptCd;        // 상위부서코드
    private String deptCd;          // 부서코드
    private String deptNm;          // 부서명
    private String lev;             // 레벨
    private String ordNo;           // 정렬번호
    private String deptGrdCd;       // 부서그룹코드
    private String deptEmpNo;       // 부서장 사번
    private String teamYn;          // 팀여부
    private String postDeptCd;      // 소속부서코드
    private String useYn;           // 사용여부
    private String deptEngNm;       // 부서영문명
    private String deptCls;         // 부서구분
    private String bdgDeptCls;      // 부서계정구분
    private String deptSectryEmpNo;     // 비서사번
    private String ordNoList;           // 부서순서
    private Date insDt;                 // 등록일
    private String insId;               // 등로자
    private String uptId;               // 수정자
    private Date uptDt;                 // 수정일
}
