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
    <jsp:include page="../header.jsp"></jsp:include>
        <body>
            <h1>Total report</h1>
        <s:if test="listProduct.size() > 0">
            <table>
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
                        <td><c:out value="${row.sum}"/></td>
                        <td><c:out value="${row.min}"/></td>
                        <td><c:out value="${row.max}"/></td>
                        <td><c:out value="${row.avg}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
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
                    title: 'Stock report',
                    is3D: true,
                }

                var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
                chart.draw(data, options);
            }
        </script>
        <div id="piechart_3d" style="width: 700px; height: 550px"></div>
    </s:if>
</body>
</html>
