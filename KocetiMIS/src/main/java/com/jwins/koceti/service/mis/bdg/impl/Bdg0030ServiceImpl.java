package com.jwins.koceti.service.mis.bdg.impl;

import com.jwins.koceti.dao.mis.bdg.Bdg0030Dao;
import com.jwins.koceti.model.mis.bdg.BdgExpnCd;
import com.jwins.koceti.service.mis.bdg.Bdg0030Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class Bdg0030ServiceImpl implements Bdg0030Service {

    @Autowired
    Bdg0030Dao bdg0030Dao;

    @Override
    public List<BdgExpnCd> findByExpnItemList(Map<String, String> params) {
        return bdg0030Dao.findByExpnItemList(params);
    }
}
