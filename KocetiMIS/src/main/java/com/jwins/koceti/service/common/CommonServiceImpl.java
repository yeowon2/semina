package com.jwins.koceti.service.common;

import com.jwins.koceti.dao.common.CommonDao;
import com.jwins.koceti.model.common.Code;
import com.jwins.koceti.model.common.ComCorp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommonServiceImpl implements CommonService {

    @Autowired
    CommonDao dao;

    @Override
    public List<Code> getCodeList(String prefix) {
        return dao.getCodeList(prefix);
    }

    @Override
    public List<ComCorp> findByBusiPlcCd() {
        return dao.findByBusiPlcCd();
    }
}
