package com.jwins.koceti.util;

import com.jwins.koceti.model.common.MenuTree;
import com.jwins.koceti.service.common.MenuService;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class MenuInterceptor implements HandlerInterceptor {

    public MenuService menuService;

    public MenuInterceptor(MenuService menuService) {
        this.menuService = menuService;
    }


    @Override
    @ModelAttribute
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        if(modelAndView != null) {
            String uri = findByUri(httpServletRequest);
            System.out.println("uri  " +  uri);
            modelAndView.addObject("menuList", fndByMenu(uri));
        }
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }

    private String findByUri(HttpServletRequest request) {

        String uri = request.getRequestURI();
        String menuCls = "";

        if(uri.contains("mis")) {
            menuCls = "M_MIS";

        } else if(uri.contains("pms")) {
            menuCls = "M_PMS";

        } else if(uri.contains("adm")) {
            menuCls = "M_ADM";
        }

        return menuCls;

    }
    private List<MenuTree> fndByMenu(String uri) {
        List<MenuTree> menuList = menuService.findByMenuList(uri);
        return menuList;
    }

}
