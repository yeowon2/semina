package com.jwins.koceti.controller.mis.hrm;

import com.jwins.koceti.model.common.DataSourceRes;
import com.jwins.koceti.model.mis.hrm.Hrm_7021;
import com.jwins.koceti.service.mis.hrm.Hrm7021Service;
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
@RequestMapping("/mis/hrm/hrm-7021")
public class Hrm7021Controller {

    @Autowired
    Hrm7021Service hrm7021service;

    @GetMapping
    public String main(HttpSession session) {
        session.setAttribute("currentMenu", "hrm-7021");
        return "/mis/hrm/hrm_7021";
    }

    @ResponseBody
    @GetMapping("/findByRetireeList")
    public DataSourceRes<Hrm_7021> findByRetireeList(@RequestParam Map<String, Object> params,
                                                     @RequestParam(required = false, value = "empCls") List<String> empCls){
        params.put("empCls", empCls);

        List<Hrm_7021> retireeList = hrm7021service.findByRetireeList(params);

        DataSourceRes<Hrm_7021> res = new DataSourceRes<>();
        res.makeSuccessRes(1, retireeList);

        return res;
    }
}

