package com.jwins.koceti.dao.common;

import com.jwins.koceti.model.common.Menu;

import java.util.List;

public interface MenuDao {
    List<Menu> findByMenuList(String menuCls);
}
