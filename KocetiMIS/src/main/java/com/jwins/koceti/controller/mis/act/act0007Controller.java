package com.jwins.koceti.controller.mis.act;

import com.jwins.koceti.model.common.Code;
import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.mis.act.ExchangeRate;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mis/act/act-0007")
public class act0007Controller {
    @Autowired
    SqlSession sql;

    @GetMapping
    public String main(HttpSession session, Model model) {
        session.setAttribute("currentMenu", "act-0007");

        List<Code> list = sql.selectList("common.getCodeList", "614");
        model.addAttribute("commCdList", list);
        return "mis/act/act_0007";
    }

    @ResponseBody
    @GetMapping("/act-exchangeRate-list")
    public DataSourceRes<ExchangeRate> act_exchangeRate_list(@RequestParam Map<String, Object> params) {
        List<ExchangeRate> list = sql.selectList("act_0007.act_exchangeRate_list", params);
        DataSourceRes<ExchangeRate> res = new DataSourceRes<>();

        res.makeSuccessRes(1, list);

        return res;
    }
}
