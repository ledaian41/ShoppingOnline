<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="./header.jsp"></jsp:include>
        <body>
            <h3>Update Category</h3>
        <form:form class="form-horizontal" method="post" modelAttribute="cate" action="./edit">
            <div class="form-group">
                <label class="control-label col-sm-2" for="id">ID</label>
                <div class="col-sm-10">
                    <form:input path="id" type="text" class="form-control" id="id" placeholder="ID" readonly="true"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="name">Name</label>
                <div class="col-sm-10">
                    <form:input path="name" type="text" class="form-control" id="name" placeholder="Name"/>
                </div>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-success">Save</button>
                <a href="./index" class="btn btn-warning">Cancel</a>
            </div>
        </form:form>
    </body>
</html>
