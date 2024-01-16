package com.jwins.koceti.service.mis.hrm;

import com.jwins.koceti.model.mis.hrm.Hrm_7021;

import java.util.List;
import java.util.Map;

public interface Hrm7021Service {

    List<Hrm_7021> findByRetireeList(Map<String, Object> params);
}
