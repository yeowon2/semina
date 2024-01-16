package com.jwins.koceti.dao.mis.bdg;

import com.jwins.koceti.model.mis.bdg.PadBdgStdMgt;
import com.jwins.koceti.model.mis.bdg.dto.Bdg0010Tree;

import java.util.List;
import java.util.Map;

public interface Bdg0010Dao {

    List<PadBdgStdMgt> findByBdgList(Map<String, String> params);

    List<Bdg0010Tree> findByBdgDtlListN(Map<String, String> params);

    List<Bdg0010Tree> findByBdgDtlListY(Map<String, String> params);
}
