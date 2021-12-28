<%--
  Created by IntelliJ IDEA.
  User: 27317
  Date: 2021/12/18
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>教师</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" href="static/dist/css/bootstrap.min.css">
    <script src="static/dist/js/jquery-3.6.0.min.js"></script>
    <script src="static/dist/js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="teacherhead.jsp" />
<c:if test="${fn:length(Activitylist)==0}">
    <h2>你还没有发布任何社会实践活动！</h2>
</c:if>
<c:if test="${fn:length(Activitylist)!=0}">
<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
    <h1 class="display-4">${fn:length(Activitylist)}</h1>
    <p class="lead">您已经发布了${fn:length(Activitylist)}个社会实践，鼓励学生进行社会实践，让学生早日适应社会，进行建设祖国，我辈义不容辞！</p>
</div>

<div class="card" style="margin-left: 5rem;margin-right: 5rem;">
    <div class="card-header">
        你发布的社会实践信息概览
    </div>

    <div class="card-block">

        <table class="table table-striped">
            <thead>
            <tr>
                <th>序号</th>
                <th>活动名称</th>
                <th>活动开始时间</th>
                <th>活动结束时间</th>
                <th>活动详情</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.Activitylist}" var="activity" varStatus="status">
                <tr>
                    <th scope="row">${status.index+1}</th>
                    <td>${activity.activitytitle}</td>
                    <td>${activity.starttime}</td>
                    <td>${activity.endtime}</td>
                    <td title="${activity.activitydetail}">查看</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <!-- TABLE FIN -->

    </div>
</div>
</c:if>
<jsp:include page="foot.jsp" />
</body>
</html>
