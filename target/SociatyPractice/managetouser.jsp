<%--
  Created by IntelliJ IDEA.
  User: 27317
  Date: 2021/12/21
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>用户管理</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" href="static/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/echarts@5.2.2/dist/echarts.min.js" type="text/javascript"></script>
    <script src="static/dist/js/jquery-3.6.0.min.js"></script>
    <script src="static/dist/js/bootstrap.min.js"></script>
    <script src="static/dist/js/toast.min.js"></script>
    <link rel="stylesheet" href="static/dist/css/toast.min.css">


</head>
<body>
<jsp:include page="managehead.jsp" />
<input id="studentslength" name="studentslength" type="hidden" value="${fn:length(requestScope.students)}" />
<input id="teacherslength" name="teacherslength" type="hidden" value="${fn:length(requestScope.teachers)}" />
<div class="row">
    <div class="col-1">
        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">用户概况</a>
            <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">学生</a>
            <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">教师</a>
            <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">管理员</a>
        </div>
    </div>
    <div class="col-9">
        <div class="tab-content" id="v-pills-tabContent">
            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                <c:if test="${(fn:length(requestScope.students))+(fn:length(requestScope.teachers))+(fn:length(requestScope.managers))==0}">
                 啊嘞，还没有用户哦！
                </c:if>
               <c:if test="${(fn:length(requestScope.students))+(fn:length(requestScope.teachers))+(fn:length(requestScope.managers))!=0}">
                   <h5>用户信息展示</h5>
                   <div id="container2" style="width: 30vw;height: 30vw;float: right;margin-top: 4vw"></div>
                   <div id="container1" style="width: 30vw;height: 30vw;"></div>
                   <h6 class="row justify-content-center">共计${(fn:length(requestScope.students))+(fn:length(requestScope.teachers))+(fn:length(requestScope.managers))}人</h6>
               </c:if>
            </div>
            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                <c:if test="${fn:length(requestScope.students)==0}">
                    啊嘞，还没有学生！
                </c:if>
                <c:if test="${fn:length(requestScope.students)!=0}">

                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">学生信息</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">信息修改</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">信息删除</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th scope="col">学生序号</th>
                                    <th scope="col">学生id</th>
                                    <th scope="col">学生用户名</th>
                                    <th scope="col">学号</th>
                                    <th scope="col">学院</th>
                                    <th scope="col">联系方式</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${requestScope.students}" var="student" varStatus="studentstatus">
                                <tr>
                                    <th scope="row">${studentstatus.index+1}</th>
                                    <td>${student.id}</td>
                                    <td>${student.username}</td>
                                    <td>${student.staffid}</td>
                                    <td>${student.college}</td>
                                    <td>${student.phone}</td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <div class="form-group" style="margin-top: 5vh;">
                            <label for="inputid" class="float-left">学生id</label>
                            <input type="text" class="form-control" id="inputid" placeholder="请输入学生id">
                        </div>
                            <div class="form-inline">
                                <div class="form-row">
                            <div class="form-group mb-2">
                                <select class="custom-select mr-sm-2" id="inputselect" name="property">
                                    <option  value="password">密码</option>
                                    <option value="staffid">学号</option>
                                    <option value="username">用户名</option>
                                    <option value="college">学院</option>
                                    <option value="phone">联系方式</option>
                                </select>
                            </div>
                            <div class="form-group mx-sm-3 mb-2">
                                <input type="text" class="form-control" id="inputinfo" placeholder="请输入相关内容" name="inputinfo">
                            </div>
                                <a role="button" class="btn btn-primary mb-2" href="javascript:dopostupdate()">确认</a>
                            </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                            <form action="${pageContext.request.contextPath}/deleteUserByManager" method="post">
                                <div class="form-group row" style="margin-top: 5vh;">
                                    <label for="inputstudentid" class="col-sm-2 col-form-label">学生id</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="inputstudentid" name="id" required/>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary mb-2">删除</button>
                            </form>
                        </div>
                    </div>
                </c:if>
            </div>



            <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                <c:if test="${fn:length(requestScope.teachers)==0}">
                    啊嘞，还没有教师加入！
                </c:if>
                <c:if test="${fn:length(requestScope.teachers)!=0}">
                <ul class="nav nav-tabs" id="teacherTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <a class="nav-link active" id="teacher-home-tab" data-toggle="tab" href="#teacher-home" role="tab" aria-controls="home" aria-selected="true">教师信息</a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a class="nav-link" id="teacher-profile-tab" data-toggle="tab" href="#teacher-profile" role="tab" aria-controls="profile" aria-selected="false">信息修改</a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a class="nav-link" id="teacher-contact-tab" data-toggle="tab" href="#teacher-contact" role="tab" aria-controls="contact" aria-selected="false">信息删除</a>
                    </li>
                </ul>
                <div class="tab-content" id="teacherTabContent">
                    <div class="tab-pane fade show active" id="teacher-home" role="tabpanel" aria-labelledby="home-tab">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">教师序号</th>
                                <th scope="col">教师id</th>
                                <th scope="col">教师用户名</th>
                                <th scope="col">工号</th>
                                <th scope="col">学院</th>
                                <th scope="col">联系方式</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${requestScope.teachers}" var="teacher" varStatus="teacherstatus">
                                <tr>
                                    <th scope="row">${teacherstatus.index+1}</th>
                                    <td>${teacher.id}</td>
                                    <td>${teacher.username}</td>
                                    <td>${teacher.staffid}</td>
                                    <td>${teacher.college}</td>
                                    <td>${teacher.phone}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane fade" id="teacher-profile" role="tabpanel" aria-labelledby="profile-tab">
                        <div class="form-group" style="margin-top: 5vh;">
                            <label for="inputteacherid" class="float-left">教师id</label>
                            <input type="text" class="form-control" id="inputteacherid" placeholder="请输入教师id">
                        </div>
                        <div class="form-inline">
                            <div class="form-row">
                                <div class="form-group mb-2">
                                    <select class="custom-select mr-sm-2" id="inputteacherselect" name="property">
                                        <option  value="password">密码</option>
                                        <option value="staffid">工号</option>
                                        <option value="username">用户名</option>
                                        <option value="college">学院</option>
                                        <option value="phone">联系方式</option>
                                    </select>
                                </div>
                                <div class="form-group mx-sm-3 mb-2">
                                    <input type="text" class="form-control" id="inputteacherinfo" placeholder="请输入相关内容" name="inputinfo" required>
                                </div>
                                <a role="button" class="btn btn-primary mb-2" href="javascript:dopostupdateTeacher()">确认</a>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="teacher-contact" role="tabpanel" aria-labelledby="contact-tab">
                        <form action="${pageContext.request.contextPath}/deleteUserByManager" method="post">
                            <div class="form-group row" style="margin-top: 5vh;">
                                <label for="inputstaff-id" class="col-sm-2 col-form-label">教师id</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputstaff-id" name="id"  required/>
                                </div>
                            </div>
                            <div class="form-group row" style="margin-top: 5vh;">
                                <label for="inputteacher-id" class="col-sm-2 col-form-label">社会实践接管教师id</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputteacher-id" name="teacherid"  required/>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary mb-2">删除</button>
                        </form>
                    </div>
                </div>
                </c:if>
            </div>

            <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                <ul class="nav nav-tabs" id="manageTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <a class="nav-link active" id="manage-home-tab" data-toggle="tab" href="#manage-home" role="tab" aria-controls="home" aria-selected="true">管理员信息</a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a class="nav-link" id="manage-profile-tab" data-toggle="tab" href="#manage-profile" role="tab" aria-controls="profile" aria-selected="false">信息删除</a>
                    </li>
<%--                    <li class="nav-item" role="presentation">--%>
<%--                        <a class="nav-link" id="manage-contact-tab" data-toggle="tab" href="#manage-contact" role="tab" aria-controls="contact" aria-selected="false">Contact</a>--%>
<%--                    </li>--%>
                </ul>
                <div class="tab-content" id="manageTabContent">
                    <div class="tab-pane fade show active" id="manage-home" role="tabpanel" aria-labelledby="home-tab">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">管理员序号</th>
                                <th scope="col">管理员id</th>
                                <th scope="col">管理员用户名</th>
                                <th scope="col">管理员工号</th>
                                <th scope="col">学院</th>
                                <th scope="col">联系方式</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${requestScope.managers}" var="manager" varStatus="managestatus">
                            <tr>
                                <th scope="row">${managestatus.index+1}</th>
                                <td>${manager.id}</td>
                                <td>${manager.username}</td>
                                <td>${manager.staffid}</td>
                                <td>${manager.college}</td>
                                <td>${manager.phone}</td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="tab-pane fade" id="manage-profile" role="tabpanel" aria-labelledby="profile-tab">
                        <form action="${pageContext.request.contextPath}/deleteUserByManager" method="post">
                            <div class="form-group row" style="margin-top: 5vh;">
                                <label for="inputmanage-id" class="col-sm-2 col-form-label">管理员id</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputmanage-id" name="id" required/>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary mb-2">删除</button>
                        </form>
                    </div>
<%--                    <div class="tab-pane fade" id="manage-contact" role="tabpanel" aria-labelledby="contact-tab">...</div>--%>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="foot.jsp" />
<script type="text/javascript">
    var dom = document.getElementById("container2");
    var dom1 = document.getElementById("container1");
    let studentslength=document.getElementById("studentslength");
    let teacherslength=document.getElementById("teacherslength");
    var myChart = echarts.init(dom);
    var myChart1 = echarts.init(dom1);
    var app = {};
    let userdata=[
        { value:3, name: '学生' },
        { value:4, name: '教师' },
        { value:1, name: '管理员' },
    ];
    userdata[0].value=studentslength.value;
    userdata[1].value=teacherslength.value;
    var option;
    option = {
        title: {
            text: '用户分布概况',
            subtext: '仅作展示',
            left: 'center'
        },
        tooltip: {
            trigger: 'item'
        },
        legend: {
            orient: 'vertical',
            left: 'left'
        },
        series: [
            {
                name: 'Access From',
                type: 'pie',
                radius: '50%',
                data:userdata,
                emphasis: {
                    itemStyle: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    var option1;
    option1 = {
        xAxis: {
            type: 'category',
            data: ['学生', '教师', '管理员']
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                data: [studentslength, teacherslength, 1],
                type: 'bar'
            }
        ]
    };
    if (option1 && typeof option1 === 'object') {
        myChart1.setOption(option1);
    }

    if (option && typeof option === 'object') {
        myChart.setOption(option);
    }
    //学生向后端发送请求。
    function dopostupdate() {
        let id=document.getElementById("inputid").value;
       if(!id.trim())
       {
          alert("id不能为空!");
       }
       else
       {
           let name=document.getElementById("inputselect").value;
           let info=document.getElementById("inputinfo").value;
           let useform=document.createElement("form");
           useform.method="post";
           useform.action="${pageContext.request.contextPath}/updateuserbymanager";
           let idinput=document.createElement("input");
           idinput.setAttribute("name","id");
           idinput.setAttribute("value",id);
           let nameinput=document.createElement("input");
           nameinput.setAttribute("name",name);
           nameinput.setAttribute("value",info);
           useform.appendChild(idinput);
           useform.appendChild(nameinput);
           document.body.appendChild(useform);
           useform.submit();
           document.body.removeChild(useform);
       }

    }
    //教师向后端发请求
    function dopostupdateTeacher() {
        let id=document.getElementById("inputteacherid").value;
        if(!id.trim() )
        {
            alert("请输入id!");
        }
        else
        {
            let name=document.getElementById("inputteacherselect").value;
            let info=document.getElementById("inputteacherinfo").value;
            let useform=document.createElement("form");
            useform.method="post";
            useform.action="${pageContext.request.contextPath}/updateuserbymanager";
            let idinput=document.createElement("input");
            idinput.setAttribute("name","id");
            idinput.setAttribute("value",id);
            let nameinput=document.createElement("input");
            nameinput.setAttribute("name",name);
            nameinput.setAttribute("value",info);
            useform.appendChild(idinput);
            useform.appendChild(nameinput);
            document.body.appendChild(useform);
            useform.submit();
            document.body.removeChild(useform);
        }
    }
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
    else if(flag=='8')
    {
        this.dialogtest("警告","手机号已被注册！","static/image/error.svg")
    }
     else if(flag=='9')
     {
         this.dialogtest("警告","未找到该用户！","static/image/error.svg")
     }
     else if(flag=='10')
     {
         this.dialogtest("警告","接管教师与原教师不能为同一人！","static/image/error.svg")
     }
     else if(flag=='11')
     {
         this.dialogtest("警告","接管用户不是教师！","static/image/error.svg")
     }
     else if(flag=='12')
     {
         this.dialogtest("警告","未找到接管用户！","static/image/error.svg")
     }

</script>
</body>
</html>
