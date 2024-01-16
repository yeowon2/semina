package com.jwins.koceti.model.mis.act;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ActMgt {
    private String mgtItmCd; //관리항목코드
    private String mgtItmNm;//관리항목명
    private String subdYn;//보조부사용여부
    private String drInstYn;//차변필수여부
    private String crInstYn;//대변필수여부
    private String AcctCd; //계정코드

}
