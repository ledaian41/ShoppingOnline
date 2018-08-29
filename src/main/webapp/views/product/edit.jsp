<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"/>
    <body>
        <jsp:include page="../navigation.jsp"/>
        <form:form class="form-horizontal" method="post" modelAttribute="product" action="./edit" enctype="multipart/form-data">
            <div class="col-sm-1"></div>
            <h3>Update Product</h3>
            <form:input path="id" type="text" id="id" hidden="true"/>
            <form:input path="thumnail" type="text" id="thumnail" hidden="true"/>
            <div class="form-group">
                <label class="control-label col-sm-1" for="name">Name</label>
                <div class="col-sm-4">
                    <form:input path="name" type="text" class="form-control" id="name" placeholder="Name" maxlength="20"/>
                    <form:errors path="name" cssStyle="color: red"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-1" for="description">Description</label>
                <div class="col-sm-4">
                    <form:input path="description" type="text" class="form-control" id="description" placeholder="Description"/>
                    <form:errors path="description" cssStyle="color: red"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-1" for="price">Price</label>
                <div class="col-sm-4">
                    <form:input path="price" type="number" step="0.1" min="0" class="form-control" id="price" placeholder="Price"/>
                    <form:errors path="price" cssStyle="color: red"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-1" for="amount">Amount</label>
                <div class="col-sm-4">
                    <form:input path="amount" type="number" min="0" class="form-control" id="amount" placeholder="Amount"/>
                    <form:errors path="amount" cssStyle="color: red"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-1" for="file">Upload file</label>
                <div class="col-sm-4">
                    <input type="file" name="file"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-1" for="thumnail">Thumnail</label>
                <div class="col-sm-11">
                    <img src="${pageContext.request.contextPath}/image/${product.thumnail}" width="20%" height="20%"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-1" for="category">Category</label>
                <div class="col-sm-4">
                    <form:select class="form-control" data-live-search="true" path="category.id">
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
            <div class="col-sm-1"></div>
            <div class="form-group">
                <button type="submit" class="btn btn-default">Save</button>
                <a href="./index" class="btn btn-danger">Cancel</a>
            </div>
        </form:form>
    </body>
</html>
