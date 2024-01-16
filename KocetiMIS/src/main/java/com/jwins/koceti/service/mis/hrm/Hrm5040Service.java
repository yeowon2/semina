package com.jwins.koceti.service.mis.hrm;

import com.jwins.koceti.model.mis.hrm.HrmEduRqst;

import java.util.List;
import java.util.Map;

public interface Hrm5040Service {

    List<HrmEduRqst> findByList(Map<String, Object> params);
}
