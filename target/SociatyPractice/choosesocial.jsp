<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 27317
  Date: 2021/12/16
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>社会实践选择</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" href="static/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/dist/css/toast.min.css">
    <script src="static/dist/js/jquery-3.6.0.min.js"></script>
    <script src="static/dist/js/bootstrap.min.js"></script>
    <script src="static/dist/js/toast.min.js"></script>
</head>
<body>
<jsp:include page="studenthead.jsp" />
<c:if test="${(fn:length(requestScope.notAttend))+(fn:length(requestScope.attend))==0}">
    老师还没发布活动，请耐心等待！
</c:if>
<c:if test="${(fn:length(requestScope.notAttend))+(fn:length(requestScope.attend))!=0}">

<div class="row">
    <div class="col-1">
        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">实践未选</a>
            <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">实践已选</a>
        </div>
    </div>
    <div class="col-11">
        <div class="tab-content" id="v-pills-tabContent">
            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                <c:if test="${fn:length(requestScope.notAttend)==0}">
                    恭喜你参加了所有活动！
                </c:if>
                <c:if test="${fn:length(requestScope.notAttend)!=0}">

                <div class="emp_info col-sm-10">

                    <div class="panel panel-success">
                        <!-- 路径导航 -->
                        <div class="panel-heading">
                            <ol class="breadcrumb">
                                <li><a href="#">社会实践</a></li>
                                <li class="active">未参选</li>
                            </ol>
                        </div>
                        <!-- Table -->
                        <table class="table table-bordered table-hover" id="emptable">
                            <thead>
                            <th>活动id</th>
                            <th>活动名称</th>
                            <th>详情</th>
                            <th>所需人数</th>
                            <th>剩余人数</th>
                            <th>负责人</th>
                            <th>负责人工号</th>
                            <th>操作</th>
                            </thead>
                            <tbody>
                            <c:forEach items="${requestScope.notAttend}" var="activity" varStatus="status">
                                <tr>
                                    <td>${activity.activityid}</td>
                                    <td>${activity.activitytitle}</td>
                                    <td class="detail" data-toggle="modal" data-target="#detailModal" data-title="${activity.activitytitle}" data-detail="${activity.activitydetail}">点击查看</td>
                                    <td>${activity.persons}</td>
                                    <td>${activity.leaveperson}</td>
                                    <td>${activity.username}</td>
                                    <td>${activity.staffid}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/addactivitytouser?activityid=${activity.activityid}&studentid=${sessionScope.user.id}" role="button" class="btn btn-primary">参选</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                </c:if>
            </div>
            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                <c:if test="${fn:length(requestScope.attend)==0}">
                    你还没有选择参加活动哦！
                </c:if>
                <c:if test="${fn:length(requestScope.attend)!=0}">
                <div class="emp_info col-sm-10">

                    <div class="panel panel-success">
                        <!-- 路径导航 -->
                        <div class="panel-heading">
                            <ol class="breadcrumb">
                                <li><a href="#">社会实践</a></li>
                                <li class="active">已参选</li>
                            </ol>
                        </div>
                        <!-- Table -->
                        <table class="table table-bordered table-hover" id="emp_table">
                            <thead>
                            <th>活动id</th>
                            <th>活动名称</th>
                            <th>详情</th>
                            <th>所需人数</th>
                            <th>剩余人数</th>
                            <th>负责人</th>
                            <th>负责人工号</th>
                            <th>操作</th>
                            </thead>
                            <tbody>
                            <c:forEach items="${requestScope.attend}" var="activitynot" varStatus="status1">
                                <tr>
                                    <td>${activitynot.activityid}</td>
                                    <td>${activitynot.activitytitle}</td>
                                    <td class="detail" data-toggle="modal" data-target="#detailModal" data-title="${activitynot.activitytitle}" data-detail="${activitynot.activitydetail}">点击查看</td>
                                    <td>${activitynot.persons}</td>
                                    <td>${activitynot.leaveperson}</td>
                                    <td>${activitynot.username}</td>
                                    <td>${activitynot.staffid}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/deleteActivitytouser?activityid=${activitynot.activityid}&id=${sessionScope.user.id}" role="button" class="btn btn-primary">退选</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </c:if>
</div>

        <div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="detailModalLabel">New message</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <span id="detailact" ></span>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>

<script type="text/javascript">
    //弹窗
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
    let flag='${requestScope.flag}';
    if(flag=='0')
    {
        this.dialogtest("警告","参选失败","static/image/error.svg")
    }
    else if(flag=='1')
    {
        this.dialogtest("成功","参选成功","static/image/success.svg")
    }
    else if(flag=='2')
    {
        this.dialogtest("警告","退选失败","static/image/error.svg")
    }
    else if(flag=='3')
    {
        this.dialogtest("成功","退选成功","static/image/success.svg")
    }

    $('#detailModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var detailinfo = button.data('detail'); // Extract info from data-* attributes
        var titleinfo = button.data('title');
        var modal = $(this);
        modal.find('#detailModalLabel').text(titleinfo+'详情' );
        modal.find('#detailact ').text(detailinfo);
    })
</script>
</c:if>
<jsp:include page="foot.jsp" />
</body>
</html>
