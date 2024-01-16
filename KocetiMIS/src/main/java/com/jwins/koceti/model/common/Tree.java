package com.jwins.koceti.model.common;

import java.util.List;

/**
 * 트리구조를 갖는 클래스의 인터페이스
 * @param <T> 트리구조가 될 클래스
 */
public interface Tree<T> {
    String getCode();
    String getParentCode();
    List<T> getChildren();
}