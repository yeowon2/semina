<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--현재 메뉴 세팅--%>
<input id="sessionCurrentMenu" type="hidden" value="${sessionScope.currentMenu}"/>
<input id="path" type="hidden" value="${sessionScope.path}"/>

<div class="grid_layout_bg"></div>
<div class="top_nav">
    <div class="logo_wrap">
        <a href="<c:url value="/${sessionScope.path}/index"/>">
            <img class="logo" alt="로고" src="<c:url value="/resources/img/koceti_logo_mini.svg"/>"/>
        </a>
    </div>

    <%--대메뉴--%>
    <ul class="menu_list">
        <c:forEach var="depth1" items="${menuList}">
            <li class="menu" data-menu-id="${depth1.menuId}">
                <div class="arrow"></div>
                <span class="material-symbols-outlined weight-300 icon">
                        group
                </span>
                <span class="menu_name">${depth1.menuNm}</span>
            </li>
        </c:forEach>
    </ul>
</div>

<div class="sub_nav">
    <%--<div class="title_container">
    </div>--%>
    <div class="menu_cls_wrap">
        <ul>
            <li id="allMenu">전체메뉴</li>
            <li id="myMenu">나의메뉴</li>
        </ul>
    </div>
    <div class="nav_container">
        <%--    소메뉴     --%>
        <c:forEach var="rootDepth" items="${menuList}">
            <ul class="menu_depth1" data-menu-id="${rootDepth.menuId}">
                <c:forEach var="depth1" items="${rootDepth.children}">
                    <li class="menu">
                        <div class="menu_wrap">
                            <span class="menu_name">${depth1.menuNm}</span>
                            <span class="material-symbols-outlined more_btn">expand_more</span>
                        </div>
                        <ul class="menu_depth2">
                            <div class="wrap">
                                <c:forEach var="depth2" items="${depth1.children}">
                                    <c:choose>
                                        <c:when test="${depth2.pgmId != null}">
                                            <li class="menu" data-menu-pgm-url="${depth2.pgmUrl}">
                                                <a href="/${sessionScope.path}/${depth2.pgmLink}/${depth2.pgmUrl}">
                                                    <span class="menu_name">${depth2.menuNm}</span>
                                                </a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="menu">
                                                <span class="menu_name">${depth2.menuNm}</span>
                                            </li>
                                            <c:forEach var="depth3" items="${depth2.children}">
                                                <li class="menu depth3" data-menu-pgm-url="${depth3.pgmUrl}">
                                                    <a href="/${sessionScope.path}/${depth3.pgmLink}/${depth3.pgmUrl}">
                                                        <span class="menu_name">${depth3.menuNm}</span>
                                                    </a>
                                                </li>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </ul>
                    </li>
                </c:forEach>
            </ul>
        </c:forEach>
    </div>

    <div class="nav_footer">
        <span>시스템 문의</span>
        <span>Tel. 042-123-1512</span>
        <span>Copyright 2023. JWINS all rights reserved.</span>
    </div>
</div>
<div class="header">
    <div class="menu_btn_wrap">
        <span class="material-symbols-outlined menu_btn" id="navToggleBtn">
            menu
        </span>
    </div>
    <div class="menu_list_wrap">
        <div>
            <a href="<c:url value="/mis/index"/>">MIS</a>
            <a href="<c:url value="/pms/index"/>">PMS</a>
            <a href="<c:url value="/adm/index"/>">관리자</a>
        </div>
    </div>
    <div class="profile_container">
        <span>관리자</span>

        <div class="profile_box">
            <div class="top">
                <span class="title">사원정보</span>
            </div>
            <div class="member_info">
                <span class="name">관리자</span>
                <span class="id">admin</span>
                <div class="email_wrap">
                    <span class="material-symbols-outlined weight-200 icon">mail</span>
                    <span>admin@jwins.co.kr</span>
                </div>
            </div>
            <button type="button" class="logout_btn">로그아웃</button>
        </div>
    </div>
</div>