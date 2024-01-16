package com.jwins.koceti.dao.mis.hrm;

import com.jwins.koceti.model.mis.hrm.Hrm_2027;

import java.util.List;
import java.util.Map;

public interface Hrm2027Dao {

    List<Hrm_2027> findByList(Map<String, Object> params);
}
