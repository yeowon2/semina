package com.jwins.koceti.service.mis.hrm;

import com.jwins.koceti.dao.mis.hrm.Hrm7021Dao;
import com.jwins.koceti.model.mis.hrm.Hrm_7021;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class Hrm7021ServiceImpl implements Hrm7021Service {

    @Autowired
    Hrm7021Dao dao;

    @Override
    public List<Hrm_7021> findByRetireeList(Map<String, Object> params) {
        return dao.findByRetireeList(params);
    }
}
