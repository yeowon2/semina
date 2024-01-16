package com.jwins.koceti.service.common;

import com.jwins.koceti.model.common.MenuTree;

import java.util.List;

public interface MenuService {
    List<MenuTree> findByMenuList(String menuCls);
}
