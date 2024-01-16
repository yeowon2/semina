package com.jwins.koceti.controller;

import com.jwins.koceti.service.common.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class RootController {
    @Autowired
    MenuService menuService;

    @GetMapping(value={"/", "/login"})
    public String main(HttpSession session) {
        session.removeAttribute("currentMenu");
        return "login";
    }

    /*
    * MIS PMS EIP 각각의 맞는 INDEX return
    * */
    @GetMapping("/{path}/index")
    public String systemIndex(@PathVariable String path, Model model, HttpSession session) {
        session.removeAttribute("currentMenu");
        session.setAttribute("path", path);

        if("eip".equals(path)) {
            return "eipIndex";
        }else if("mis".equals(path)) {
            return "index";
        }else if("pms".equals(path)) {
            return "index";
        } else if("adm".equals(path)) {
            return "index";
        } else {
            return "";
        }
    }

}
