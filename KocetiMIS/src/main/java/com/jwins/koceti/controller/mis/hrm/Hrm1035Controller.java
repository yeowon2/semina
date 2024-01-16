package com.jwins.koceti.controller.mis.hrm;

import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.mis.hrm.Hrm_1035;
import com.jwins.koceti.service.mis.hrm.Hrm1035Service;
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
@RequestMapping("/mis/hrm/hrm-1035")
public class Hrm1035Controller {

    @Autowired
    Hrm1035Service hrm1035Service;

    @GetMapping
    public String main(HttpSession session, Model model) {
        session.setAttribute("currentMenu", "hrm-1035");
        List<Hrm_1035> apntList = hrm1035Service.findByApntCd();
        model.addAttribute("apntList",apntList);

        return "/mis/hrm/hrm_1035";
    }

    @ResponseBody
    @GetMapping("/findByList")
    public DataSourceRes<Hrm_1035> findByList(@RequestParam Map<String, Object> params,
                                              @RequestParam(required = false, value = "appntCls") List<String> appntCls) {
        params.put("appntCls", appntCls);
        List<Hrm_1035> resultList = hrm1035Service.findByList(params);

        DataSourceRes<Hrm_1035> res = new DataSourceRes<>();
        res.makeSuccessRes(1, resultList);

        return res;
    }

}
