<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp" />
    <body>
        <jsp:include page="../navigation.jsp"/>
        <div class="form-horizontal">
            <div class="col-sm-1"></div>
            <h2>Category details</h2>
            <div class="form-group">
                <label class="control-label col-sm-1" for="id">ID</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" id="id" placeholder="ID" value="${cate.id}" readonly="true" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-1" for="name">Name</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" id="name" placeholder="Name" value="${cate.name}" readonly="true" />
                </div>
            </div>
            <div class="col-sm-1"></div>
            <a class="btn btn-default" href="./index">Index Page</a>
        </div>
    </body>
</html>
