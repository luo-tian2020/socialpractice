<%--
  Created by IntelliJ IDEA.
  User: 27317
  Date: 2021/12/12
  Time: 20:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>student</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" href="static/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/dist/css/pricing.css">
    <script src="static/dist/js/jquery-3.6.0.min.js"></script>
    <script src="static/dist/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="studenthead.jsp"/>
<c:if test="${fn:length(Activitylist)==0}">
    <h2>你还没有参加任何社会实践活动！</h2>
</c:if>
<c:if test="${fn:length(Activitylist)!=0}">

<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
    <h1 class="display-4">${fn:length(Activitylist)}</h1>
    <p class="lead">您已经参与了${fn:length(Activitylist)}个社会实践，相信你对社会实践有独到的见解，让我们享受接下来的社会实践生活吧！撸起袖子加油干！</p>
</div>

<div class="card" style="margin-left: 5rem;margin-right: 5rem;">
    <div class="card-header">
        你已经参加的社会实践信息概览
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
</div>
</body>
</html>
