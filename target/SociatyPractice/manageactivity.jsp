<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 27317
  Date: 2021/12/20
  Time: 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>manageactivity</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" href="static/dist/css/bootstrap.min.css">
    <script src="static/dist/js/jquery-3.6.0.min.js"></script>
    <script src="static/dist/js/bootstrap.min.js"></script>
    <script src="static/dist/js/toast.min.js"></script>
    <link rel="stylesheet" href="static/dist/css/toast.min.css">
</head>
<body>
<jsp:include page="teacherhead.jsp" />
<c:if test="${requestScope.flag==0||flag==0}">
    <c:if test="${fn:length(requestScope.teacheractivity)==0}">
        你还没有发布社会实践！
    </c:if>
    <c:if test="${fn:length(requestScope.teacheractivity)!=0}">

<div class="emp_info col-sm-10">

    <div class="panel panel-success">
        <!-- 路径导航 -->
        <div class="panel-heading">
            <ol class="breadcrumb">
                <li class="active">你负责的社会实践</li>
            </ol>
        </div>
        <!-- Table -->
        <table class="table table-bordered table-hover" id="emp_table">
            <thead>
            <th>序号</th>
            <th>活动id</th>
            <th>活动名称</th>
            <th>详情</th>
            <th>所需人数</th>
            <th>剩余人数</th>
            <th>操作</th>

            </thead>
            <tbody>
            <c:forEach items="${requestScope.teacheractivity}" var="activity" varStatus="status">
                <tr>
                    <td>${status.index+1}</td>
                    <td>${activity.activityid}</td>
                    <td>${activity.activitytitle}</td>
                    <td data-toggle="modal" data-target="#detailModal" data-whatever="${activity.activitydetail}" data-title="${activity.activitytitle}">点击查看</td>
                    <td>${activity.persons}</td>
                    <td>${activity.leaveperson}</td>
                    <td>
                        <a role="button" class="btn btn-primary" href="javascript:doPost('${pageContext.request.contextPath}/willteacherscore', {'id':'${sessionScope.user.id}','activityid':'${activity.activityid}'})">评分</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
        <div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-center" id="detailModalLabel"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <span id="detailact" ></span>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
</c:if>
        <c:if test="${requestScope.flag==1||flag==1}">
            <c:if test="${fn:length(requestScope.teacherscore)==0}">
                还没有学生选择该实践活动哦！
            </c:if>
            <c:if test="${fn:length(requestScope.teacherscore)!=0}">

            <div class="emp_info col-sm-10">

                <div class="panel panel-success">
                    <!-- 路径导航 -->
                    <div class="panel-heading">
                        <ol class="breadcrumb">
                            <li class="active">进行评分</li>
                        </ol>
                    </div>
                    <!-- Table -->
                    <table class="table table-bordered table-hover" id="emptable">
                        <thead>
                        <th>序号</th>
                        <th>活动id</th>
                        <th>活动名称</th>
                        <th>学生id</th>
                        <th>学生姓名</th>
                        <th>分数</th>
                        <th>评分</th>

                        </thead>
                        <tbody>
                        <c:forEach items="${requestScope.teacherscore}" var="score" varStatus="scorestatus">
                            <tr>
                                <td>${scorestatus.index+1}</td>
                                <td>${score.activityid}</td>
                                <td>${score.activitytitle}</td>
                                <td>${score.staffid}</td>
                                <td>${score.username}</td>
                                <td>${score.score==-1?"暂未评分":score.score}</td>
                                <td>
                                    <form class="form-inline" action="${pageContext.request.contextPath}/updateScore" method="post">
                                        <div class="form-group mx-sm-2 mb-1">
                                            <input type="hidden" id="activityid" name="activityid" value="${score.activityid}"/>
                                            <input type="hidden" id="studentid" name="studentid" value="${score.studentid}" />
                                            <input type="hidden" id="staffid" name="staffid" value="${sessionScope.user.id}" />
                                            <input type="text" class="form-control" id="scoreget" placeholder="分数" name="score" />
                                        </div>
                                        <button type="submit" class="btn btn-primary mb-1">确认</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            </c:if>
        </c:if>
<jsp:include page="foot.jsp" />
        <script type="text/javascript">
            function dialogtest(title,content,pic)
            {
                $.toast({
                    title: title,
                    subtitle: '刚刚',
                    content: content,
                    type: 'info',
                    delay: 2000,
                    img: {
                        src: pic,
                        class: 'rounded',
                        title: 'Thumbnail Title',
                    },
                    pause_on_hover: false
                });
            }
            let flagscore='${requestScope.flagscore}';
            if(flagscore=='0')
            {
                this.dialogtest("警告","修改失败","static/image/error.svg")
            }
            else if(flagscore=='1')
            {
                this.dialogtest("成功","修改成功","static/image/success.svg")
            }
            $('#detailModal').on('show.bs.modal', function (event) {
                let button = $(event.relatedTarget) // Button that triggered the modal
                let detailactivity = button.data('whatever');
                let activitytitle=button.data("title");
                var modal = $(this);
                modal.find('#detailModalLabel').text(activitytitle);
                modal.find('#detailact').text(detailactivity);
            });
            function doPost(to, p) { // to:提交动作（action）,p:参数
                var myForm = document.createElement("form");
                myForm.method = "post";
                myForm.action = to;
                for ( var i in p) {
                    var myInput = document.createElement("input");
                    myInput.setAttribute("name", i); // 为input对象设置name
                    myInput.setAttribute("value", p[i]); // 为input对象设置value
                    myForm.appendChild(myInput);
                }
                document.body.appendChild(myForm);
                myForm.submit();
                document.body.removeChild(myForm); // 提交后移除创建的form
            }
        </script>
</body>
</html>
