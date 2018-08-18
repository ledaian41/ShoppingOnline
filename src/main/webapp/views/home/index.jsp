<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"/>
    <body>
        <jsp:include page="../navigation.jsp"/>
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
                    <form action="index" method="GET">
                        <div class="search-pannel form-inline">
                            <input class="form-control" id="keyword" name="keyword" value="${keyword}" placeholder="Searching..." />
                            <input class="search-btn btn btn-default" type="submit" value="Search" />
                        </div>
                    </form>
                    <c:choose>
                        <c:when test="${not empty listProduct && listProduct != null}">
                            <div class="row carousel-holder">
                                <div class="col-md-12">
                                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                        <ol class="carousel-indicators">
                                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                        </ol>
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                            </div>
                                            <div class="item">
                                                <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                            </div>
                                            <div class="item">
                                                <img class="slide-image" src="http://placehold.it/800x300" alt="">
                                            </div>
                                        </div>
                                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left"></span>
                                        </a>
                                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right"></span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <c:forEach var="row" items="${listProduct}">
                                    <div class="col-sm-4 col-lg-4 col-md-4">
                                        <div class="thumbnail">
                                            <img src="${pageContext.request.contextPath}/image/${row.thumnail}" alt="image ${row.name}">
                                            <div class="caption">
                                                <h4 class="pull-right">$${row.price}</h4>
                                                <h4><a href="./details?id=${row.id}">${row.name}</a>
                                                </h4>
                                                <p>${row.description}.</p>
                                                <a class="btn btn-default" href="../shop/order?id=${row.id}&quantity=1" >Buy</a>
                                            </div>
                                        </div>
                                    </div> 
                                </c:forEach>
                            </div>
                            <c:if test="${page != 1}"> 
                                <c:choose>
                                    <c:when test="${keyword == null}">
                                        <c:choose>
                                            <c:when test="${cateId == null}">
                                                <a href="./index?page=${page - 1}">Previous</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="./index?page=${page - 1}&cate=${cateId}">Previous</a>
                                            </c:otherwise>
                                        </c:choose>
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
                                        <c:choose>
                                            <c:when test="${cateId == null}">
                                                <a href="./index?page=${page + 1}">Next</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="./index?page=${page + 1}&cate=${cateId}">Next</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="./index?page=${page + 1}&keyword=${keyword}">Next</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <h3>Sorry! Comming soon...</h3>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <!-- /.container -->
        <jsp:include page="../footer.jsp"/>
    </body>
</html>
