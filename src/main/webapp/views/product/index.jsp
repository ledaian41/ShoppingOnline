<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="./header.jsp"/>
    <body>
        <h4 class="title">Products</h4>      
        <a class="btn btn-success" href="create">Create</a>       
    <s:if test="listProduct.size() > 0">
        <div class="content table-responsive table-full-width">
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="row" items="${listProduct}">
                        <tr>
                            <td><c:out value="${row.id}"/></td>
                            <td><c:out value="${row.name}"/></td>
                            <td>
                                <a class="btn btn-info" href="./details?id=${row.id}" >Details</a>
                                <a class="btn btn-warning" href="./edit?id=${row.id}" >Edit</a>
                                <a class="btn btn-danger" href="./delete?id=${row.id}" >Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </s:if>
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/cate/index">Categories</a>
</body>
</html>
