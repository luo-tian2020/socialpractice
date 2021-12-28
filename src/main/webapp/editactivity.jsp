<%--
  Created by IntelliJ IDEA.
  User: 27317
  Date: 2021/12/18
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>社会实践管理</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" href="static/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/dist/css/toast.min.css">
    <script src="static/dist/js/jquery-3.6.0.min.js"></script>
    <script src="static/dist/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <script src="static/dist/js/toast.min.js"></script>

</head>
<body>
<jsp:include page="teacherhead.jsp" />
<ul class="nav nav-tabs" id="myTab" role="tablist">
    <li class="nav-item">
        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#admin" role="tab" aria-controls="home"
           aria-selected="true">
            <h6>已发布</h6>
        </a>
    </li>
    <li class="nav-item">
        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#edit" role="tab" aria-controls="profile"
           aria-selected="false">
            <h6>发布</h6>
        </a>
    </li>
</ul>
<div class="tab-content border border-top-0" id="myTabContent" >
    <div class="tab-pane fade show active" id="admin" role="tabpanel" aria-labelledby="home-tab">
<c:if test="${fn:length(requestScope.teacheractivity)==0}">
    你还没有发布任何实践活动！
</c:if>
<c:if test="${fn:length(requestScope.teacheractivity)!=0}">
        <ul class="list-group list-group-flush">
            <li class="list-group-item">
                <div class="emp_info col-sm-10">

                    <div class="panel panel-success">
                        <!-- 路径导航 -->
                        <div class="panel-heading">
                            <ol class="breadcrumb">
                                <li><a href="#">社会实践</a></li>
                                <li class="active">已发布</li>
                            </ol>
                        </div>
                        <!-- Table -->
                        <table class="table table-bordered table-hover" id="emptable">
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
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-activitytitle="${activity.activitytitle}" data-activitydetail="${activity.activitydetail}" data-activityid="${activity.activityid}" data-persons="${activity.persons}" data-leaveperson="${activity.leaveperson}" data-starttime="${activity.starttime}" data-endtime="${activity.endtime}" data-staffid="${activity.staffid}" data-isfull="${activity.isfull}">修改</button>
                                            <%--                                        <a  role="button" class="btn btn-primary" data-target="#editVoince" data-id="${activity}">修改</a>--%>
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#deleteModal" data-activityid="${activity.activityid}" data-activitytitle="${activity.activitytitle}">删除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </li>
        </ul>
</c:if>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
            <form action="${pageContext.request.contextPath}/updateactivity" method="post">
                <div class="modal-dialog  modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">活动信息修改</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="activityid" id="activityid"/>
                            <input type="hidden" name="staffid" id="staffid"/>
                            <input type="hidden" name="isfull" id="isfull"/>
                            <div class="form-group">
                                <label >活动名称</label>
                                <input class="form-control" id="activitytitle" name="activitytitle">
                            </div>
                            <div class="form-group">
                                <label>活动详细信息</label>
                                <textarea type="text" class="form-control" id="activitydetail" name="activitydetail" placeholder="1234 Main St" row="4"></textarea>
                            </div>
                            <div class="form-group" >
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>开始时间</label>
                                        <input type="text" class="form-control"  name="starttime" id="starttime">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label >结束时间</label>
                                        <input type="text" class="form-control" id="endtime"  name="endtime">
                                    </div>
                                </div>

                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label >所需人数</label>
                                    <input type="text" class="form-control" id="persons" name="persons">
                                </div>
                                <input type="hidden" class="form-control" id="leaveperson" name="leaveperson">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                            <button type="submit" class="btn btn-primary" >提交</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
<%--删除--%>
        <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
            <form action="${pageContext.request.contextPath}/deleteactivity" method="post">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteModalLabel">New message</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                        <input type="hidden" class="form-control" id="deleteid" name="activityid" />
                    <input type="hidden" class="form-control" id="userid" name="id" value="${sessionScope.user.id}" />
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-primary">确认</button>
                    </div>
                </div>
            </div>
            </form>
        </div>
        <div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="detailModalLabel"></h5>
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

    </div>
    <div class="tab-pane fade" id="edit" role="tabpanel" aria-labelledby="profile-tab">
        <ul class="list-group list-group-flush">
            <li class="list-group-item">
                <form action="${pageContext.request.contextPath}/addactivity" method="post">
                    <input type="hidden" name="staffid" value="${sessionScope.user.id}"/>
                        <div class="form-group">
                            <label for="inputEmail4" class="float-left">活动名称</label>
                            <input type="text" class="form-control" id="inputEmail4" name="activitytitle">
                        </div>
                        <div class="form-group">
                            <label for="inputPassword4" class="float-left">活动详情</label>
                            <textarea type="text" class="form-control" id="inputPassword4" rows="5" name="activitydetail"> </textarea>
                        </div>
                    <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputstarttime" class="float-left">开始时间</label>
                        <input type="text" class="form-control" id="inputstarttime" placeholder="2021 10 21" name="starttime">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputendtime" class="float-left">结束时间</label>
                        <input type="text" class="form-control" id="inputendtime" placeholder="2022 10 21" name="endtime">
                    </div>
    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="inputCity" class="float-left">所需人数</label>
                            <input type="text" class="form-control" id="inputCity" name="persons">
                        </div>
                    </div>
                    <button type="reset" class="btn btn-primary">重置</button>
                    <button type="submit" class="btn btn-primary">添加</button>
                </form>

            </li>
        </ul>
    </div>
</div>

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
            let flag='${requestScope.flag}';
            if(flag=='0')
            {
                this.dialogtest("警告","修改失败","static/image/error.svg")
            }
            else if(flag=='1')
            {
                this.dialogtest("成功","修改成功","static/image/success.svg")
            }
            else if(flag=='2')
            {
                this.dialogtest("成功","删除失败","static/image/error.svg")
            }
            else if(flag=='3')
            {
                this.dialogtest("成功","删除成功","static/image/success.svg")
            }
            else if(flag=='4')
            {
                this.dialogtest("成功","添加失败","static/image/error.svg")
            }
            else if(flag=='5')
            {
                this.dialogtest("成功","添加成功","static/image/success.svg")
            }
            else if(flag=='6')
            {this.dialogtest("警告","修改失败,所选人数过多","static/image/error.svg")}


            $('#exampleModal').on('show.bs.modal', function (event) {
                let button = $(event.relatedTarget) // Button that triggered the modal
                let activityid=button.data("activityid");
                let activitydetail=button.data("activitydetail");
                let activitytitle=button.data("activitytitle");
                let starttime=button.data("starttime");
                let endtime=button.data("endtime");
                let persons=button.data("persons");
                let leaveperson=button.data("leaveperson");
                let staffid=button.data("staffid");
                let isfull=button.data("isfull");
                var modal = $(this);
                modal.find('#activitytitle').val(activitytitle);
                modal.find('#activitydetail').val(activitydetail);
                modal.find('#starttime').val(starttime);
                modal.find('#endtime').val(endtime);
                modal.find('#persons').val(persons);
                modal.find('#leaveperson').val(leaveperson);
                modal.find('#activityid').val(activityid);
                modal.find('#staffid').val(staffid);
                modal.find('#isfull').val(isfull);
            });
            $('#deleteModal').on('show.bs.modal', function (event) {
                let button = $(event.relatedTarget) // Button that triggered the modal
                let activityid = button.data('activityid');
                let activitytitle = button.data('activitytitle');
                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                var modal = $(this);
                modal.find('#deleteModalLabel').text("确认删除"+activitytitle+"?");
                modal.find('#deleteid').val(activityid);
            });
            $('#detailModal').on('show.bs.modal', function (event) {
                let button = $(event.relatedTarget) // Button that triggered the modal
                let detailactivity = button.data('whatever');
                let activitytitle=button.data("title");
               // Extract info from data-* attributes
                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                var modal = $(this);
                modal.find('#detailModalLabel').text(activitytitle);
                modal.find('#detailact').text(detailactivity);
            });
            $('#starttime').datepicker({format: 'yyyy-mm-dd'});
            $('#inputstarttime').datepicker({format: 'yyyy-mm-dd'});
            $('#endtime').datepicker({format: 'yyyy-mm-dd'});
            $('#inputendtime').datepicker({format: 'yyyy-mm-dd'});
        </script>
<jsp:include page="foot.jsp" />
</body>
</html>
