<%-- 
    Document   : product
    Created on : Aug 21, 2018, 7:44:50 PM
    Author     : Le An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp" />
    <body>
        <jsp:include page="../navigation.jsp"/>
        <div class="col-md-1">
            <p class="lead category">Management</p>
            <div class="list-group">
                <a href="${pageContext.request.contextPath}/cate/index" class="list-group-item">Categories</a>
                <a href="${pageContext.request.contextPath}/product/index" class="list-group-item">Products</a>
                <a href="${pageContext.request.contextPath}/report/stock" class="list-group-item">Report</a>
            </div>
        </div>
        <div class="col-md-11">
            <h1>Report</h1>
            <s:if test="listProduct.size() > 0">
                <div class="content table-responsive table-full-width">
                    <table class="table table-hover table-striped">
                        <thead>
                            <tr>
                                <th>Category</th>
                                <th>Quantity</th>
                                <th>Total price</th>
                                <th>Min</th>
                                <th>Max</th>
                                <th>Average</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="row" items="${listReport}">
                                <tr>
                                    <td><c:out value="${row.group}"/></td>
                                    <td><c:out value="${row.count}"/></td>
                                    <td><c:out value="$${row.sum}"/></td>
                                    <td><c:out value="$${row.min}"/></td>
                                    <td><c:out value="$${row.max}"/></td>
                                    <td><c:out value="$${row.avg}"/></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <br/>
                <script type="text/javascript" src="https://www.google.com/jsapi"></script>
                <script type="text/javascript">
                    google.load("visualization", "1", {packages: ["corechart"]});
                    google.setOnLoadCallback(drawChart);
                    function drawChart() {
                        var data = google.visualization.arrayToDataTable([
                            ['Category', 'Quantity'],
                    <c:forEach var="row" items="${listReport}">
                            ['${row.group}',${row.count}],
                    </c:forEach>
                        ]);

                        var options = {
                            title: 'Trending',
                            is3D: true,
                        }

                        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
                        chart.draw(data, options);
                    }
                </script>
                <script type="text/javascript">
                    google.load("visualization", "1", {packages: ["corechart"]});
                    google.setOnLoadCallback(drawChart);
                    function drawChart() {
                        var data = google.visualization.arrayToDataTable([
                            ['Category', 'Max', 'Average', 'Min'],
                    <c:forEach var="row" items="${listReport}">
                            ['${row.group}',${row.max},${row.avg},${row.min}],
                    </c:forEach>
                        ]);

                        var options = {
                            title: 'Price',
                            is3D: true,
                        }

                        var chart = new google.visualization.BarChart(document.getElementById('curve_chart'));
                        chart.draw(data, options);
                    }
                </script>
                <div>
                    <div id="piechart_3d" style="width: 700px; height: 550px; display: inline-block"></div>
                    <div id="curve_chart" style="width: 700px; height: 550px; display: inline-block"></div>
                </div>
            </s:if>
        </div>
    </body>
</html>
