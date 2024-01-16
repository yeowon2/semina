package com.jwins.koceti.controller.mis.hrm;

import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.mis.hrm.HrmEduRqst;
import com.jwins.koceti.service.common.CommonService;
import com.jwins.koceti.model.common.Code;
import com.jwins.koceti.service.mis.hrm.Hrm5040Service;
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

@RequestMapping("/mis/hrm/hrm-5040")
@Controller
public class Hrm5040Controller {

    @Autowired
    CommonService commonService;

    @Autowired
    Hrm5040Service hrm5040Service;

    @GetMapping
    public String main(HttpSession session, Model model) {
        session.setAttribute("currentMenu", "hrm-5040");

        List<Code> codeList = commonService.getCodeList("000-010");
        model.addAttribute("codeList", codeList);

        return "/mis/hrm/hrm_5040";
    }
    @ResponseBody
    @GetMapping("/findByList")
    public DataSourceRes<HrmEduRqst> findByList(@RequestParam Map<String, Object> params) {
         List<HrmEduRqst> resultList = hrm5040Service.findByList(params);

        DataSourceRes<HrmEduRqst> res = new DataSourceRes<>();
        res.makeSuccessRes(1, resultList);

        return res;
    }

}
