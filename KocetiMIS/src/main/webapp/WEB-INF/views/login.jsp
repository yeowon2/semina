<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KOCETI 로그인</title>
</head>
<body>
    <div class="login_container">
        <form id="loginForm" action="/login" method="POST">
            <div>
                <label>
                    <select name="systemCls" id="systemCls">
                        <option value="eip">EIP</option>
                        <option value="mis">MIS</option>
                        <option value="pms">PMS</option>
                    </select>
                </label>
            </div>
            <div>
                <label>
                    <input type="text" name="userId" placeholder="ID"/>
                </label>
            </div>
            <div>
                <label>
                    <input type="password" name="password" placeholder="비밀번호"/>
                </label>
            </div>
            <button type="button" id="login_btn">로그인</button>
        </form>
    </div>

<div>
    <p>
        MIS,PMS,EIP 선택후 로그인 버튼 누르시면 이동합니다. 로그인구현x
    </p>
</div>
</body>
<script>
    document.getElementById('login_btn').addEventListener('click', () => {
        // document.getElementById('loginForm').submit();

        let loginInfo = {
            loginId:'',
            password:'',
            systemCls: document.getElementById('systemCls').value
        }

        let xhr = new XMLHttpRequest();
        xhr.open('POST', '/login', true);
        xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
        xhr.send(JSON.stringify(loginInfo));

        xhr.onreadystatechange = () => {
            if(xhr.readyState === 4) {
                if(xhr.status === 200) {
                    // if(로그인 성공시) {
                        const redirectUri =loginInfo.systemCls + "/index";
                        location.href=redirectUri;

                    // else { //로그인 실패시
                    /*let redirectUri = xhr.responseText;

                    location.href=redirectUri;*/
                }
            }
        }

        /*
        로그인 구현 후
        -> form 로그인 처리
        -> 현재 로그인 버튼 클릭시 systemCls(MIS,PMS,EIP)에 해당하는 메인페이지 호출
        */
        /*const cls = document.getElementById('systemCls').value;
        let uri = cls + "/index";
            console.log(uri);*/
        <%--window.location.href="/${cls}/index";--%>
    })
</script>
</html>
