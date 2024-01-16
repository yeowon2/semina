package com.jwins.koceti.controller.mis.act;

import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.mis.act.ActBankAcct;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mis/act/act-0005")
public class Act0005Controller {
    @Autowired
    SqlSession sql;

    @GetMapping
    public String main(HttpSession session) {
        session.setAttribute("currentMenu", "act-0005");
        return "mis/act/act_0005";
    }

    @ResponseBody
    @GetMapping("/act-bank-acct-list")
    public DataSourceRes<ActBankAcct> act_mgt_list(@RequestParam Map<String, Object> params) {
        List<ActBankAcct> list = sql.selectList("act_0005.act_bank_acct_list", params);
        DataSourceRes<ActBankAcct> res = new DataSourceRes<>();

        res.makeSuccessRes(1, list);

        return res;
    }
}
