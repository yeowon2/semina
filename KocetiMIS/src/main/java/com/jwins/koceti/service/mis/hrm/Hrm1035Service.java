package com.jwins.koceti.service.mis.hrm;

import com.jwins.koceti.model.mis.hrm.Hrm_1035;

import java.util.List;
import java.util.Map;

public interface Hrm1035Service {
    List<Hrm_1035> findByApntCd();

    List<Hrm_1035> findByList(Map<String, Object> params);
}
