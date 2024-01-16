package com.jwins.koceti.service.common;

import com.jwins.koceti.model.common.Code;
import com.jwins.koceti.model.common.ComCorp;

import java.util.List;

public interface CommonService {
    List<Code> getCodeList(String prefix);

    List<ComCorp> findByBusiPlcCd();
}
