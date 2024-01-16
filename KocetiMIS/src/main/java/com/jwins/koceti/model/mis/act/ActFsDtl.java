package com.jwins.koceti.model.mis.act;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ActFsDtl {
    private String busiPlcCd; //사업장코드
    private String seq; //순번
    private String fincStatCd; //재무제표구분
    private String acctCls; //계정구분
    private String acctCd; //계정코드
    private String busiClsCd; //사업분류코드
    private String fincStatYY; //회계년도
    private String acctNm; //계정명
}
