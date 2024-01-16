package com.jwins.koceti.model.common;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * 신청번호 관리 (COM_RQST_NO)
 */
@Getter
@Setter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ComRqstNo {
    private String busiPlcCd;           //사업장코드
    private String pgmId;               //프로그램아이디
    private String rqstNo;              //신청번호
    private String clsCd;               //분류코드
    private String upRqstNo;            //상위신청번호
    private String apvStatCd;           //결재상태코드
    private String apvStatNm;           //결재상태코드
    private String gwDocNo;             //그룹웨어문서번호
    private String apvUserId;           //결재자아이디
    private String apvDt;               //결재일자
    private String rqstEmpNo;           //신청자
    private String rqstDeptNo;          //신청부서
    private String rqstDt;              //신청일
    private String rmk;                 //비고
    private String rqstApvDt;           //발의부서결재일
    private String rqstApvUserId;       //발의부서결재자
    private String flag;                //상태_공통
    private String apvOpin;             //결재의견
    private String gwDocId;             //그룹웨어문서아이디
    private String gwFormId;            //그룹웨어양식아이디
    private String sbj;                 //제목
    private Date insDt;                 //등록일시
    private String insId;               //등록자
    private Date uptDt;                 //수정일시
    private String uptId;               //수정자
    private String rusRsn;              //반려사유
}
