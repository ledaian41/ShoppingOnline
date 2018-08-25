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
        <div class="container center-block" style="padding-top: 150px;">
            <h1 style="text-align: center;">Register</h1>
            <div class="col-lg-4"></div>
            <div class="col-lg-4">
                <form class="form-horizontal" action="/register" th:object="${user}" method="POST" enctype="utf8">
                    <div class="form-group">
                        <label>First name</label>
                        <input class="input100" type="text" name="firstName" placeholder="First name">
                    </div>
                    <div class="form-group">
                        <label>Last name</label>
                        <input class="input100" type="text" name="lastName" placeholder="Last name">
                    </div>
                    <div class="form-group">
                        <label>Phone number</label>
                        <input class="input100" type="text" name="phone" placeholder="Phone number">
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <input class="input100" type="text" name="address" placeholder="Address">
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input class="input100" type="password" name="password" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <label>Confirm</label>
                        <input class="input100" type="password" name="matchingPassword" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <div class="col-lg-6">
                            <div class="container-login100-form-btn">
                                <button class="login100-form-btn" type="submit">Submit</button>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="container-login100-form-btn">
                                <a class="login100-form-btn" href="./login">login</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>