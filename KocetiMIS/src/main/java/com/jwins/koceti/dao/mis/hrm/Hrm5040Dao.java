package com.jwins.koceti.dao.mis.hrm;

import com.jwins.koceti.model.mis.hrm.HrmEduRqst;

import java.util.List;
import java.util.Map;

public interface Hrm5040Dao {

    List<HrmEduRqst> findByList(Map<String, Object> params);
}
