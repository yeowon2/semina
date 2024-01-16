package com.jwins.koceti.controller.mis.hrm;

import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.common.HrmAppntCd;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/mis/hrm/hrm-1010")
public class Hrm1010Controller {

    @Autowired
    SqlSession sql;

    @GetMapping
    public String main(HttpSession session) {
        session.setAttribute("currentMenu", "hrm-1010");
        return "/mis/hrm/hrm_1010";
    }

    @ResponseBody
    @GetMapping("/get-appnt")
    public DataSourceRes<HrmAppntCd> getAppntList() {
        List<HrmAppntCd> appntList = sql.selectList("hrm_1010.searchAppnt");

        DataSourceRes<HrmAppntCd> res = new DataSourceRes<>();
        res.makeSuccessRes(1, appntList);

        return res;
    }
}
