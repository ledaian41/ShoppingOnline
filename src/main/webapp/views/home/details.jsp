<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"/>
    <body>
        <jsp:include page="../customer_nav.jsp"/>
        <!-- Page Content -->
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <p class="lead category">Categories</p>
                    <div class="list-group">
                        <c:forEach var="cate" items="${listCate}">
                            <a href="./index?cate=${cate.id}" class="list-group-item">${cate.name}</a>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="thumbnail">
                        <img class="img-responsive" src="${pageContext.request.contextPath}/image/${product.thumnail}" width="20%" height="20%">
                        <div class="caption-full">
                            <h4 class="pull-right">$${product.price}</h4>
                            <h4><a href="#">${product.name}</a>
                            </h4>
                            <p>${product.description}.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container -->
        <jsp:include page="../footer.jsp"/>
    </body>
</html>
