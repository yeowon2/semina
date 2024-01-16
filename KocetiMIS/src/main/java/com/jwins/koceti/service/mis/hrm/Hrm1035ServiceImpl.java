package com.jwins.koceti.service.mis.hrm;

import com.jwins.koceti.dao.mis.hrm.Hrm1035Dao;
import com.jwins.koceti.model.mis.hrm.Hrm_1035;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class Hrm1035ServiceImpl implements Hrm1035Service {

    @Autowired
    Hrm1035Dao dao;

    @Override
    public List<Hrm_1035> findByApntCd() {
        return dao.findByApntCd();
    }

    @Override
    public List<Hrm_1035> findByList(Map<String, Object> params) {
        return dao.findByList(params);
    }

}
