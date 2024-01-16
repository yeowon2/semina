package com.jwins.koceti.controller.mis.act;

import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.mis.act.ActBank;
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
@RequestMapping("/mis/act/act-0004")
public class Act0004Controller {
    @Autowired
    SqlSession sql;

    @GetMapping
    public String main(HttpSession session) {
        session.setAttribute("currentMenu", "act-0004");
        return "mis/act/act_0004";
    }

    @ResponseBody
    @GetMapping("/act-bank-list")
    public DataSourceRes<ActBank> act_cd_list(@RequestParam Map<String, Object> params) {
        List<ActBank> list = sql.selectList("act_0004.act_bank_list", params);
        DataSourceRes<ActBank> res = new DataSourceRes<>();
        res.makeSuccessRes(1, list);
        return res;
    }

}
