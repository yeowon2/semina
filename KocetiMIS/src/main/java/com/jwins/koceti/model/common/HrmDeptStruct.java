package com.jwins.koceti.model.common;

import lombok.Getter;
import lombok.Setter;

/**
 * 조직개편일
 * HRM_DEPT_STRUCT
 */
@Getter
@Setter
public class HrmDeptStruct {
    private String structDt;        //조직개편일
    private String curYN;           //현재사용상태
    private String structDtNm;     // 공통코드 Name으로 사용
}
