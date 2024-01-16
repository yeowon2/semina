<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MIS</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/template.css"/>"/>
</head>
<body>
<div class="grid_layout">
    <%@ include file="template.jsp" %>
    <div class="main">
        <div class="head">
            <div class="bread_crumb_wrap">
                <div>
                    <span>Home</span>
                    <span>/</span>
                    <span class="current_menu">Home</span>
                </div>
            </div>
            <div class="menu_title_wrap">
                <%--<h1>건설기계부품연구원 경영정보시스템</h1>--%>
            </div>
            <span class="menu_info"></span>
        </div>

        <div class="body">

        </div>
    </div>
</div>
<script src="<c:url value="/resources/js/template.js"/>"></script>
</body>
</html>