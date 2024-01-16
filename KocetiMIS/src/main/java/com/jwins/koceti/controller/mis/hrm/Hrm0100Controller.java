package com.jwins.koceti.controller.mis.hrm;

import com.jwins.koceti.model.mis.hrm.HrmAppntNo;
import com.jwins.koceti.model.common.DataSourceRes;
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
@RequestMapping("/mis/hrm/hrm-0100")
public class Hrm0100Controller {

    @Autowired
    SqlSession sql;

    @GetMapping
    public String main(HttpSession session) {
        session.setAttribute("currentMenu", "hrm-0100");
        return "/mis/hrm/hrm_0100";
    }

    @ResponseBody
    @GetMapping("/appnt-list")
    public DataSourceRes<HrmAppntNo> getAppntList(@RequestParam Map<String, Object> params) {
        List<HrmAppntNo> appntList = sql.selectList("hrm_0100.searchAppntLst", params);

        DataSourceRes<HrmAppntNo> res = new DataSourceRes<>();
        res.makeSuccessRes(1, appntList);

        return res;
    }

    @ResponseBody
    @GetMapping("/appnt-req-info")
    public HrmAppntNo getAppntReqInfo(@RequestParam String appntNo) {
        return sql.selectOne("hrm_0100.getAppnNotMst", appntNo);
    }
}
