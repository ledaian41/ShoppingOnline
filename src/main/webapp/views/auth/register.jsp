<%-- 
    Document   : register
    Created on : Aug 19, 2018, 10:44:53 PM
    Author     : Le An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Form</title>
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.ico"/>
        <link href="${pageContext.request.contextPath}/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/resources/css/util.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Register</h1>
        <form action="/register" th:object="${user}" method="POST" enctype="utf8">
            <div>
                <label>First name</label>
                <input class="input100" type="text" name="firstName" placeholder="First name">
            </div>
            <div>
                <label>Last name</label>
                <input class="input100" type="text" name="lastName" placeholder="Last name">
            </div>
            <div>
                <label>Phone number</label>
                <input class="input100" type="text" name="phone" placeholder="Phone number">
            </div>
            <div>
                <label>Address</label>
                <input class="input100" type="text" name="address" placeholder="Address">
            </div>
            <div>
                <label>Password</label>
                <input class="input100" type="password" name="password" placeholder="Password">
            </div>
            <div>
                <label>Confirm</label>
                <input class="input100" type="password" name="matchingPassword" placeholder="Password">
            </div>
            <button type="submit">Submit</button>
        </form>
        <a href="./login">login</a>
    </body>
</html>