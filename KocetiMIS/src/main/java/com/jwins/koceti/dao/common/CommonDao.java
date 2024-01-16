package com.jwins.koceti.dao.common;

import com.jwins.koceti.model.common.Code;
import com.jwins.koceti.model.common.ComCorp;

import java.util.List;

public interface CommonDao {
    List<Code> getCodeList(String prefix);

    List<ComCorp> findByBusiPlcCd();
}
