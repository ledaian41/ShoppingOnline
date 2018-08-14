<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"></jsp:include>
        <body>
            <h2>Category details</h2>
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="id">ID</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="id" placeholder="ID" value="${cate.id}" readonly="true"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="name">Name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="name" placeholder="Name" value="${cate.name}" readonly="true"/>
                </div>
            </div>
        </div>
        <a class="btn btn-success" href="./index">Index Page</a>
    </body>

</html>
