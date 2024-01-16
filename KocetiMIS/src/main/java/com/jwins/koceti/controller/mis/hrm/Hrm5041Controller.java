package com.jwins.koceti.controller.mis.hrm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mis/hrm/hrm-5041")
public class Hrm5041Controller {


    @GetMapping("/findByList")
    public String findByList() {

        return "/mis/hrm/hrm-5041";
    }
}
