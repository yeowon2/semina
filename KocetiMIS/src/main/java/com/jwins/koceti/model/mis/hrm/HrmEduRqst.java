package com.jwins.koceti.model.mis.hrm;

import com.fasterxml.jackson.annotation.JsonUnwrapped;
import com.jwins.koceti.model.common.ComRqstNo;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter

/* 교육신청 */
public class HrmEduRqst {
    private String eduRqstNo;               // 교육신청번호
    private String yy;                      // 년도
    private String aprqNo;                  // 회계신청번호
    private String acctExpnCd;              // 계정코드[조합]
    private String budgCd;                  // 예산코드
    private String acctCd;                  // 계정코드
    private String expnItmCd;               // 비목코드
    private String expnCstCd;               // 비용코드
    private int aprqSeq;                    // 회계신청순번
    private String rqstEmpNo;               // 신청자
    private String rqstEmpNm;               // 신청자
    private String rqstDeptCd;              // 신청부서
    private String rqstDeptNm;               // 신청부서
    private String rqstDt;                  // 신청일
    private String rmk;                     // 비고
    private String approvYn;                // 승인여부
    private int aprqAmt;                    // 회계신청금액
    private String eduBdgCls;               // 교육예산구분
    private String eduContDtl;              // 교육세부내용
    private String eduPayCls;               // 결재방법
    private String custCd;                  // 거래처코드
    private String bkCd;                    // 은행코드
    private String accNo;                   // 계좌번호
    private String dpsitNm;                 // 예금주
    private String vatCls;                  // 부가세구분
    private String vatDt;                   // 부가세일자
    private String prceAmt;                 // 대금가액
    private String vatAmt;                  // 부가세금액
    private String cmpYn;                   // 일괄등록여부
    private String cmpNm;                   // 일광등록여부
    private String eduCls;                  // 교육구분
    private String conversationId;          // 세금계산서 번호
    private String cardCo;                  // 카드회사
    private String collNo;                  // 추심버놓
    private String cmptncCdOld;             // 역량코드_컨버젼_이전
    private String chrgAprovYn;             // 담당자 승인여부
    private String busiPlcCd;               // 사업장코드
    private String rqstSyntGrdCd;           // 신청자 통합 직급
    private String rqstCls;                 // 신청구분
    private String vctnClRsn;               // 휴가신청취소사유
    private String privRqstNo;              // 이전 신청번호
    private Date insDt;                     // 등록일
    private String insId;                   // 등록자
    private Date uptDt;                     // 수정일
    private String uptId;                   // 수정자

    /* Join */
    @JsonUnwrapped
    private HrmEduRecpt hrmEduRecpt;
    @JsonUnwrapped
    private ComRqstNo comRqstNo;

    /* 검색조건 */
    private Date rqstSdt;
    private Date rqstEdt;
    private String eduRqstSdt;
    private String eduRqstEdt;
    private String apvStatCd;
}
