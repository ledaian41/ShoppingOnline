<%-- 
    Document   : login
    Created on : Aug 18, 2018, 7:39:54 PM
    Author     : Le An
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"/>
    <body>
        <jsp:include page="../customer_nav.jsp"/>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-pic js-tilt" data-tilt>
                        <img src="${pageContext.request.contextPath}/resources/images/img-01.png" alt="IMG">
                    </div>
                    <form class="login100-form validate-form" method="POST" action="<c:url value='/j_spring_security_login' />">
                        <span class="login100-form-title">
                            Member Login
                        </span>
                        <div class="wrap-input100">
                            <input class="input100" type="text" name="username" placeholder="Username">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                            </span>
                        </div>
                        <div class="wrap-input100">
                            <input class="input100" type="password" name="password" placeholder="Password">
                            <span class="focus-input100"></span>
                            <span class="symbol-input100">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                            </span>
                        </div>
                        <div class="text-center p-t-12 txt2">
                            <input type="checkbox" name="remember-me"/> Remember me
                        </div>
                        <p style="color: red">${message}</p>
                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn">
                                Login
                            </button>
                        </div>
                        <div class="text-center p-t-136">
                            <a class="txt2" href="./register">
                                Create your Account
                                <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
