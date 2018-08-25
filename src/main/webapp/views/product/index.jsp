<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"/>
    <body>
        <jsp:include page="../navigation.jsp"/>
        <div class="col-md-1">
            <p class="lead category">Management</p>
            <div class="list-group">
                <a href="${pageContext.request.contextPath}/cate/index" class="list-group-item">Categories</a>
                <a href="${pageContext.request.contextPath}/product/index" class="list-group-item">Products</a>
                <a href="${pageContext.request.contextPath}/report/stock" class="list-group-item">Report</a>
            </div>
        </div>
        <div class="col-md-11"> 
            <h4 class="title">Products</h4>
            <form action="index" method="GET">
                <div>
                    <div class="col-md-2">
                        <input class="form-control" id="keyword" name="keyword" value="${keyword}" placeholder="Searching..." />
                    </div>
                    <input type="submit" value="Search" class="btn btn-default" style="display: inline" />
                    <a class="btn btn-default" href="create">New Product</a>
                </div>
            </form>
            <s:if test="listProduct.size() > 0">
                <div class="content table-responsive table-full-width">
                    <table class="table table-hover table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Image</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="row" items="${listProduct}">
                                <tr>
                                    <td><c:out value="${row.id}"/></td>
                                    <td><c:out value="${row.name}"/></td>
                                    <td><img src="${pageContext.request.contextPath}/image/${row.thumnail}" width="10%" height="10%" alt="image ${row.name}"/></td>
                                    <td>
                                        <!--<a class="btn btn-info" href="../shop/order?id=${row.id}&quantity=1" >Buy</a>-->
                                        <a class="btn btn-default" href="./details?id=${row.id}" >Details</a>
                                        <a class="btn btn-default" href="./edit?id=${row.id}" >Edit</a>
                                        <a class="btn btn-danger" href="./delete?id=${row.id}" >Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td/><td/><td/>
                                <td>
                                    <c:if test="${page != 1}"> 
                                        <c:choose>
                                            <c:when test="${keyword == null}">
                                                <a href="./index?page=${page - 1}">Previous</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="./index?page=${page - 1}&keyword=${keyword}">Previous</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if> 
                                    Page ${page} / ${totalPage}
                                    <c:if test="${page != totalPage}"> 
                                        <c:choose>
                                            <c:when test="${keyword == null}">
                                                <a href="./index?page=${page + 1}">Next</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="./index?page=${page + 1}&keyword=${keyword}">Next</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </s:if>
        </div>
    </body>
</html>
