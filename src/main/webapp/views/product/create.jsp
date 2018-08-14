<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"/>
    <body>
        <h3>Create new product</h3>
        <form:form class="form-horizontal" method="post" modelAttribute="product" action="./create" enctype="multipart/form-data">
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
                    <input name="file" type="file"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="category">Category</label>
                <div class="form-control" style="border: none">
                    <form:select class="form-control col-sm-10" data-live-search="true" path="category.id">
                        <c:forEach var="cate" items="${listCate}">
                            <form:option value="${cate.id}" >${cate.name}</form:option>
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
