package com.jwins.koceti.service.mis.bdg;

import com.jwins.koceti.model.mis.bdg.BdgExpnCstCd;

import java.util.List;
import java.util.Map;

public interface Bdg0060Service {
    List<BdgExpnCstCd> findByExpnCstList(Map<String, String> params);
}
