package com.jwins.koceti.service.mis.bdg.impl;

import com.jwins.koceti.dao.mis.bdg.Bdg0060Dao;
import com.jwins.koceti.model.mis.bdg.BdgExpnCstCd;
import com.jwins.koceti.service.mis.bdg.Bdg0060Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class bdg0060ServiceImpl implements Bdg0060Service {

    @Autowired
    Bdg0060Dao bdg0060Dao;

    @Override
    public List<BdgExpnCstCd> findByExpnCstList(Map<String, String> params) {
        return bdg0060Dao.findByExpnCstList(params);
    }
}
