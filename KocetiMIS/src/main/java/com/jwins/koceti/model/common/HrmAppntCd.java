package com.jwins.koceti.model.common;

import lombok.Getter;
import lombok.Setter;

/**
 * 인사발령코드관리
 * HRM_APPNT_CD
 */
@Getter
@Setter
public class HrmAppntCd {
    private String appntCd;         // 인사발령코드
    private String appntNm;         // 인사발령명
    private String upAppntCd;       // 상위발령코드
    private String appntCls;        // 발령구분
    private String dtMndtYn;        // 종료일필수여부
    private String dupCdYn;         // 겸직코드여부
    private String chkDt;           // 수정일시
    private String useYn;           // 사용여부
    private String ordNo;           // 정렬번호
}
