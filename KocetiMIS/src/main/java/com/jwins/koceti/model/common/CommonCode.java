package com.jwins.koceti.model.common;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class CommonCode {
    private String parentCode;
    private List<Code> codeList;
}
