<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="./header.jsp"/>
    <body>
        <h3>Update Product</h3>
        <form:form class="form-horizontal" method="post" modelAttribute="product" action="./edit" enctype="multipart/form-data">
            <form:input path="id" type="text" id="id" hidden="true"/>
            <form:input path="thumnail" type="text" id="thumnail" hidden="true"/>
            <div class="form-group">
                <label class="control-label col-sm-2" for="name">Name</label>
                <div class="col-sm-10">
                    <form:input path="name" type="text" class="form-control" id="name" placeholder="Name"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="description">Description</label>
                <div class="col-sm-10">
                    <form:input path="description" type="text" class="form-control" id="description" placeholder="Description"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="price">Price</label>
                <div class="col-sm-10">
                    <form:input path="price" type="text" class="form-control" id="price" placeholder="Price"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="amount">Amount</label>
                <div class="col-sm-10">
                    <form:input path="amount" type="text" class="form-control" id="amount" placeholder="Amount"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="file">Upload file</label>
                <div class="col-sm-10">
                    <input type="file" name="file"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-10">
                    <img src="${pageContext.request.contextPath}/image/${product.thumnail}" width="20%" height="20%"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="category">Category</label>
                <div class="form-control" style="border: none">
                    <form:select class="form-control col-sm-10" data-live-search="true" path="category.id">
                        <c:forEach var="cate" items="${listCate}">
                            <c:choose>
                                <c:when test="${product.category.id == cate.id}">
                                    <form:option value="${cate.id}" selected="true">${cate.name}</form:option>
                                </c:when>
                                <c:otherwise>
                                    <form:option value="${cate.id}">${cate.name}</form:option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </form:select>
                </div>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-success">Save</button>
                <a href="./index" class="btn btn-warning">Cancel</a>
            </div>
        </form:form>
    </body>
</html>
