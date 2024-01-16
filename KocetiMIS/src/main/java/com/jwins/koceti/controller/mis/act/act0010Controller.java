package com.jwins.koceti.controller.mis.act;

import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.mis.act.ActIncmCd;
import com.jwins.koceti.model.mis.act.ActNtnRate;
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
@RequestMapping("/mis/act/act-0010")
public class act0010Controller {
    @Autowired
    SqlSession sql;

    @GetMapping
    public String main(HttpSession session) {
        session.setAttribute("currentMenu", "act-0010");

        return "mis/act/act_0010";
    }

    @ResponseBody
    @GetMapping("/act-taxesByCountry-list")
    public DataSourceRes<ActIncmCd> act_taxesByCountry_list(@RequestParam String incmNm) {
        List<ActIncmCd> list = sql.selectList("act_0010.act_taxesByCountry_list", incmNm);
        DataSourceRes<ActIncmCd> res = new DataSourceRes<>();

        res.makeSuccessRes(1, list);

        return res;
    }

    @ResponseBody
    @GetMapping("/act-taxDetail-list")
    public DataSourceRes<ActNtnRate> act_taxDetail_list(@RequestParam String incmCd) {
        List<ActNtnRate> list = sql.selectList("act_0010.act_taxDetail_list", incmCd);
        DataSourceRes<ActNtnRate> res = new DataSourceRes<>();

        res.makeSuccessRes(1, list);

        return res;
    }
}
