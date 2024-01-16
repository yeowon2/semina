package com.jwins.koceti.model.mis.hrm;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter

/* 교육대상자 */
public class HrmEduRecpt {
    private String empNo;               // 사번
    private String empNm;               // 교육자명
    private String eduEmpNm;            // 교육자명
    private String eduEmpNo;            // 교육자명

    private String eduRqstNo;           // 교육 신청번호
    private int seq;                    // 순번
    private String eduFrmDt;            // 교육시작일자
    private String eduToDt;             // 교육종료일자
    private String eduFrmTime;          // 교육시작시간
    private String eduToTime;           // 교육종료시간
    private String eduDeptCd;           // 교육대상자부서
    private String eduDeptNm;           // 교육대상자부서
    private String eduSyntGrdCd;        // 교육대상자직급
    private String eduJobPost;          // 교육대상자 직위
    private String eduCrsNm;            // 교육과정명
    private String eduOrgNm;            // 교육기관명
    private String eduPlc;              // 교육장소
    private int eduAmt;                 // 교육비
    private int eduTime;                // 교육시간
    private String rtnYn;               // 환급여부
    private int rtnRate;                // 환급비용
    private int rtnAmt;                 // 환급비율
    private String cmpltYn;             // 수료여부
    private int eduPnt;                 // 교육점수
    private int cmpTm;                  // 이수시간
    private String eduOnline;           // 교육유형
    private String eduSati;             // 교육만족도
    private Date insDt;                 // 등록일시
    private String insId;               // 등록자
    private Date uptDt;                 // 수정일시
    private String uptId;               // 수정자
}
