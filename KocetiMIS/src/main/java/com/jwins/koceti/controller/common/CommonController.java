package com.jwins.koceti.controller.common;

import com.jwins.koceti.model.common.Code;
import com.jwins.koceti.model.common.CommonCode;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

// 공통처리
@Controller
@Slf4j
@RequestMapping("/common")
public class CommonController {

    @Autowired
    SqlSession sql;

    @ResponseBody
    @GetMapping("/codes")
    public List<CommonCode> getCommonCodeList(@RequestParam List<String> prefixes) {
        return sql.selectList("common.getCommonCodeList", prefixes);
    }

    @ResponseBody
    @GetMapping("/codes/appnt")
    public List<Code> getAppntCodeList(){
        return sql.selectList("common.getAppntCodeList");
    }

    @ResponseBody
    @GetMapping("/session/{key}")
    public Object getSessionData(HttpSession session,
                                 @PathVariable String key) {
        log.info("session = {}", session);
        return session.getAttribute(key);
    }
}

