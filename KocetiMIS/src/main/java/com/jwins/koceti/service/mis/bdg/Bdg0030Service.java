package com.jwins.koceti.service.mis.bdg;

import com.jwins.koceti.model.mis.bdg.BdgExpnCd;

import java.util.List;
import java.util.Map;

public interface Bdg0030Service {
    List<BdgExpnCd> findByExpnItemList(Map<String, String> params);
}
