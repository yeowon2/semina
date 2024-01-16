package com.jwins.koceti.controller.mis.act;

import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.mis.act.ActIntyCd;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/mis/act/act-0009")
public class Act0009Controller {
    @Autowired
    SqlSession sql;

    @GetMapping
    public String main(HttpSession session) {
        session.setAttribute("currentMenu", "act-0009");

        return "mis/act/act_0009";
    }

    @ResponseBody
    @GetMapping("/act-incm-list")
    public DataSourceRes<ActIntyCd> act_mgt_list(@RequestParam String habtCls) {
        List<ActIntyCd> list = sql.selectList("act_0009.act_incm_list", habtCls);
        DataSourceRes<ActIntyCd> res = new DataSourceRes<>();

        res.makeSuccessRes(1, list);

        return res;
    }
}
