<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"/>
    <body class="content">
        <h1>Shopping Cart</h1>
        <a href="../home/index">Go to shopping</a>
        <c:choose>
            <c:when test="${myCart.size() > 0}">
                <div class="content table-responsive table-full-width">
                    <table class="table table-hover table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Product's name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="row" items="${myCart}">
                                <tr>
                                    <td><c:out value="${row.product.id}"/></td>
                                    <td><c:out value="${row.product.name}"/></td>
                                    <td><c:out value="${row.product.price}"/></td>
                                    <td><c:out value="${row.quantity}"/></td>
                                    <td><c:out value="${row.product.price * row.quantity}" /></td>
                                    <td>
                                        <a class="btn btn-success" href="./order?id=${row.product.id}&quantity=1" > + </a>
                                        <a class="btn btn-warning" href="./order?id=${row.product.id}&quantity=-1" > - </a>
                                        <a class="btn btn-danger" href="./delete?id=${row.product.id}" >Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!--<a href="./payment?id=${row.id}" avaiable="false">Payment</a>-->
            </c:when>
            <c:otherwise>
                <p>Shopping Cart is empty!!</p>
            </c:otherwise>
        </c:choose>
    </body>
</html>
