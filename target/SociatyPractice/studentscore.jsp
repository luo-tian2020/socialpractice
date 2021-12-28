<%--
  Created by IntelliJ IDEA.
  User: 27317
  Date: 2021/12/18
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>成绩查询</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" href="static/dist/css/bootstrap.min.css">
    <script src="static/dist/js/jquery-3.6.0.min.js"></script>
    <script src="static/dist/js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="studenthead.jsp" />
<c:if test="${fn:length(requestScope.studentScore)==0}">
    你还没有参加社会实践活动！
</c:if>
<c:if test="${fn:length(requestScope.studentScore)!=0}">

<div class="emp_info col-sm-10">

    <div class="panel panel-success">
        <!-- 路径导航 -->
        <div class="panel-heading">
            <ol class="breadcrumb">
                <li><a href="#">社会实践</a></li>
                <li class="active">分数</li>
            </ol>
        </div>
        <!-- Table -->
        <table class="table table-bordered table-hover" id="emp_table">
            <thead>
            <th>活动id</th>
            <th>活动名称</th>
            <th>学生学号</th>
            <th>学生姓名</th>
            <th>分数</th>

            </thead>
            <tbody>
            <c:forEach items="${requestScope.studentScore}" var="score" varStatus="status">
                <tr>
                    <td>${score.activityid}</td>
                    <td>${score.activitytitle}</td>

                    <td>${user.staffid}</td>
                    <td>${user.username}</td>
                    <td>${score.score==-1?"暂未评分":score.score}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    </div>
</c:if>
<jsp:include page="foot.jsp" />
</body>
</html>
