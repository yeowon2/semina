package com.jwins.koceti.service.mis.hrm;

import com.jwins.koceti.dao.mis.hrm.Hrm2027Dao;
import com.jwins.koceti.model.mis.hrm.Hrm_2027;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class Hrm2027ServiceImpl implements Hrm2027Service {

    @Autowired
    Hrm2027Dao dao;

    @Override
    public List<Hrm_2027> findByList(Map<String, Object> params) {
        return dao.findByList(params);
    }
}
