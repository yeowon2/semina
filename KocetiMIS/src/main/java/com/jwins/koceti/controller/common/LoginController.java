package com.jwins.koceti.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class LoginController {

    @ResponseBody
    @PostMapping("/login")
    public String login(@RequestBody Map<String, String> params) {
        // 로그인처리
        return "redirect:/";
    }
}
