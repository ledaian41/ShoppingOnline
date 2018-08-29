<!-- Navigation -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand">Clothes Shopping Online</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <sec:authorize access="isAuthenticated()">
                        <sec:authentication var="principal" property="principal" />
                        <a href="#"><span class="glyphicon glyphicon-user"></span>
                            Hello: ${principal.username}
                        </a>
                    </sec:authorize>
                    <sec:authorize access="!isAuthenticated()">
                        <sec:authentication var="principal" property="principal" />
                        <a href="${pageContext.request.contextPath}/auth/register"><span class="glyphicon glyphicon-user"></span>
                            Sign Up
                        </a>
                    </sec:authorize>
                </li>
                <li>
                    <c:url value="/j_spring_security_logout" var="logoutUrl" />
                    <sec:authorize access="isAuthenticated()">
                        <sec:authentication var="principal" property="principal" />
                        <a href="${logoutUrl}"><span class="glyphicon glyphicon-user"></span>
                            Log out
                        </a>
                    </sec:authorize>
                    <sec:authorize access="!isAuthenticated()">
                        <sec:authentication var="principal" property="principal" />
                        <a href="${pageContext.request.contextPath}/auth/login"><span class="glyphicon glyphicon-user"></span>
                            Login
                        </a>
                    </sec:authorize>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>