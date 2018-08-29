<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp" />
    <body>
        <jsp:include page="../navigation.jsp"/>
        <form:form class="form-horizontal" method="post" modelAttribute="cate" action="./edit">
            <div class="col-sm-1"></div>
            <h3>Update Category</h3>
            <div class="form-group">
                <label class="control-label col-sm-1" for="id">ID</label>
                <div class="col-sm-4">
                    <form:input path="id" type="text" class="form-control" id="id" placeholder="ID" readonly="true"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-1" for="name">Name</label>
                <div class="col-sm-4">
                    <form:input path="name" type="text" class="form-control" id="name" placeholder="Name" maxlength="20"/>
                    <form:errors path="name" cssStyle="color: red"/>
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
