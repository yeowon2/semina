package com.jwins.koceti.model.mis.hrm;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonUnwrapped;
import com.jwins.koceti.model.common.ComRqstNo;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * 인사발령번호대장 <br>
 * 인사발령기본정보에 관한 클래스
 */
@Getter
@Setter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class HrmAppntNo {
    private String appntNo;         //발령번호
    private String rqstEmpNo;       //신청자번호
    private String rqstEmpNm;       //신청자명
    private String rqstDeptCd;      //신청부서번호
    private String rqstDeptNm;      //신청부서명
    private String rqstDt;          //신청일
    private String appntDt;         //발령일자
    private String appntSbj;        //발령내용
    private String rmk;             //비고
    private Date insDt;             //등록일시
    private String insId;           //등록자
    private Date uptDt;             //수정일시
    private String uptId;           //수정자

    @JsonUnwrapped
    private ComRqstNo comRqstNo;    //신청번호관리 DTO
}