<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"/>
    <body>
        <jsp:include page="../navigation.jsp"/>
        <form:form class="form-horizontal" method="post" modelAttribute="product" action="./create" enctype="multipart/form-data">
            <div class="col-sm-1"></div>
            <h3>Create new product</h3>
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
                    <input name="file" type="file"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-1" for="category">Category</label>
                <div class="col-sm-4">
                    <form:select class="form-control" data-live-search="true" path="category.id">
                        <c:forEach var="cate" items="${listCate}">
                            <form:option value="${cate.id}" >${cate.name}</form:option>
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
