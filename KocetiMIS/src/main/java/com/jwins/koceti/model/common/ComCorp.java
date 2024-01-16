package com.jwins.koceti.model.common;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class ComCorp {
    
    // 연구기관정보

    private String corpCd;  // 기관코드
    private String corpNm;  // 법인명
    private String corpEngNm;   //법인명_영문
    private String corpNo;      // 법인번호
    private String corpCls;     // 사업구분
    private String repres;      //대표자
    private String busiRegNo;   // 사업자번호
    private String faxNo;       // 팩스번호
    private String telNo;       // 전화번호
    private String intyTp;      // 업종
    private String intyCon;     // 업태
    private String period;      // 주기
    private String periodFrmDt; // 당기시작일
    private String periodToDt;  // 당기종료일
    private String postNo;      // 우편번호
    private String addr;        // 주소
    private String addrDtl;     // 상세주소
    private String engAddr;     // 영문주소
    private String engAddrDtl;  // 영문세부주소
    private String budgAllocCls;    // 예산배정구분
    private String taxCd;           // 세무서코드
    private String taxNm;           // 세무서명
    private int cardCtrlDays;       // 카드통제일수
    private String corpInfNm;       // 약식법인 한글명
    private String engRepres;       // 대표자(원장)영문
    private String homeTaxId;       // 홈텍스아이디
    private String represCorp;      // 대표여부
    private String custCd;          // 거래처코드
    private String taxCorpNm;       // 세무기관명
    private String insId;           // 등록자
    private Date insDt;             // 등록일
    private String uptId;           // 수정자
    private Date uptDt;             // 수정일








}
