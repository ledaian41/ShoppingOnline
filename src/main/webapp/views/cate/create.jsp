<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"></jsp:include>
        <body>
            <h3>Create new category</h3>
        <form:form class="form-horizontal" method="post" modelAttribute="cate" action="./create">
            <div class="form-group">
                <label class="control-label col-sm-1" for="name">Name</label>
                <div class="col-sm-3">
                    <form:input path="name" type="text" class="form-control" id="name" placeholder="Name"/>
                    <form:errors path="name" cssStyle="color: red"/>
                </div>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-success">Save</button>
                <a href="./index" class="btn btn-warning">Cancel</a>
            </div>
        </form:form>
    </body>
</html>
