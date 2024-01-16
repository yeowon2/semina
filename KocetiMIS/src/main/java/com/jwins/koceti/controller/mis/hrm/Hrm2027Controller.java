package com.jwins.koceti.controller.mis.hrm;

import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.mis.hrm.Hrm_2027;
import com.jwins.koceti.service.mis.hrm.Hrm2027Service;
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
@RequestMapping("/mis/hrm/hrm-2027")

public class Hrm2027Controller {

    @Autowired
    Hrm2027Service hrm2027Service;

    @GetMapping
    public String main(HttpSession session) {
        session.setAttribute("currentMenu", "hrm-2027");
        return "/mis/hrm/hrm_2027";
    }

    @ResponseBody
    @GetMapping("/findByList")
    public DataSourceRes<Hrm_2027> findByList(@RequestParam Map<String, Object> params,
                                              @RequestParam(required = false, value = "empCls") List<String> empCls) {
        params.put("empCls", empCls);
        List<Hrm_2027> resultList = hrm2027Service.findByList(params);

        DataSourceRes<Hrm_2027> res = new DataSourceRes<>();
        res.makeSuccessRes(1, resultList);

        return res;
    }
}

