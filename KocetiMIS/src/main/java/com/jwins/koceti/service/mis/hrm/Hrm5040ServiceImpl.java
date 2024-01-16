package com.jwins.koceti.service.mis.hrm;

import com.jwins.koceti.dao.mis.hrm.Hrm5040Dao;
import com.jwins.koceti.model.mis.hrm.HrmEduRqst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class Hrm5040ServiceImpl implements Hrm5040Service {

    @Autowired
    Hrm5040Dao dao;

    @Override
    public List<HrmEduRqst> findByList(Map<String, Object> params) {
        return dao.findByList(params);
    }
}
