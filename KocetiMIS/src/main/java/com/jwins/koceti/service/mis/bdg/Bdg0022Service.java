package com.jwins.koceti.service.mis.bdg;

import com.jwins.koceti.model.common.Code;
import com.jwins.koceti.model.mis.bdg.BdgPlcItmCd;
import com.jwins.koceti.model.mis.bdg.dto.Bdg0022Tree;

import java.util.List;
import java.util.Map;

public interface Bdg0022Service {
    List<BdgPlcItmCd> findByBdgPlcItmCdList(Map<String, String> params);

    List<Bdg0022Tree> findByBdgPlcList(Map<String, String> params);

    List<Code> findByBdgStdCodeList(Map<String, String> params);
}
