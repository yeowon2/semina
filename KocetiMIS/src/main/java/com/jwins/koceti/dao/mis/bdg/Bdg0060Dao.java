package com.jwins.koceti.dao.mis.bdg;

import com.jwins.koceti.model.mis.bdg.BdgExpnCstCd;

import java.util.List;
import java.util.Map;

public interface Bdg0060Dao {
    List<BdgExpnCstCd> findByExpnCstList(Map<String, String> params);
}
