<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="./header.jsp"/>
    <body>
        <h2>Product details</h2>
        <div class="form-horizontal">
            <div class="form-group">
                <label class="control-label col-sm-2" for="id">ID</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="id" placeholder="ID" value="${product.id}" readonly="true"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="name">Name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="name" placeholder="Name" value="${product.name}" readonly="true"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="description">Description</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="description" placeholder="Description" value="${product.description}" readonly="true"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="price">Price</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="price" placeholder="Price" value="${product.price}" readonly="true"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="amount">Amount</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="amount" placeholder="Amount" value="${product.amount}" readonly="true"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-10">
                    <img src="${pageContext.request.contextPath}/image/${product.thumnail}" width="20%" height="20%"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="category">Category</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="category" placeholder="Category" value="${product.category.name}" readonly="true" />
                </div>
            </div>
        </div>
        <a class="btn btn-success" href="./index">Index Page</a>
    </body>
</html>
