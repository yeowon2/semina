package com.jwins.koceti.model.mis.act;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ActMgmt {
    private String mgtItmCd; //관리항목코드
    private String mgtItmNm; //관리항목명
    private String dataTp; //데이터타입
    private String referTb; //참조테이블
    private String referFld; //참조필드
    private String referFldNm; //참조필드명
    private String fldSize; //필드사이즈
}
