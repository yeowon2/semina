<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KOCETI Potal</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/index.css"/>"/>

</head>
<body>
    <div class="eip_container">
        <nav class="nav_wrap">
            <ul>
                <li>결재</li>
                <li>문서함</li>
                <li>메일</li>
                <li>게시판</li>
                <li>일정관리</li>
                <li id="mis">경영정보</li>
                <li id="pms">연구관리</li>
            </ul>
        </nav>

    </div>
</body>
<script>
    document.getElementById('mis').addEventListener('click', () => {location.href="/mis/index";})
    document.getElementById('pms').addEventListener('click', () => {location.href="/pms/index";})
</script>
</html>
