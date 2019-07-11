<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <title>司机页面</title>
   <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
   <script src="//cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
   <script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 这是一个导航栏 -->
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-5 column">
					<ul class="breadcrumb">
						<li>
							 <a href="Driver.jsp">预约信息</a>
						</li>
					
						<li>
							 <a href="UserFeedback2.jsp">用户反馈</a>
						</li>
					</ul>
				</div>
				<div class="col-md-3 column">
					<P>欢迎&nbsp&nbsp<a><%=request.getSession().getAttribute("id")%></a>&nbsp&nbsp&nbsp&nbsp<a href="Login.jsp">退出登陆</a></P>
				</div>
				<div class="col-md-4 column">
					<iframe scrolling="no" src="https://tianqiapi.com/api.php?style=tu&skin=pitaya" frameborder="0" width="300" height="25" allowtransparency="true"></iframe>
				<body onload="startTime()">
	
				<div id="txt"></div>
	
				</body>
				</div>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="tabbable col-md-12 column" id="tabs-207109">
			<div class="row clearfix">
				<div class="col-md-8 column">
					<h3>
						司机请假
					</h3>
				</div>
				<div class="col-md-4 column">
					 
				</div>
			</div>
			<div class="form-group">
      			请输入请假信息：
      		</div>
         	<div class="form-group">
      			<textarea class="form-control" id=qj cols="70" placeholder="在这里输入请假信息"  rows="10"   style="OVERFLOW:   hidden"></textarea>
   			</div>
   		</div>
   	</div>
   	<div class="row clearfix">
		<div class="tabbable col-md-12 column" id="tabs-207109">
			<button type="submit" class="btn btn-block btn-primary" onclick="">提交</button>
   		</div>
   	</div>
</div>
<!-- 显示当前时间 -->
<script>
function startTime(){
	var today=new Date();
	var h=today.getHours();
	var m=today.getMinutes();
	var s=today.getSeconds();// 在小于10的数字钱前加一个‘0’
	m=checkTime(m);
	s=checkTime(s);
	document.getElementById('txt').innerHTML=h+":"+m+":"+s;
	t=setTimeout(function(){startTime()},500);
}
function checkTime(i){
	if (i<10){
		i="0" + i;
	}
	return i;
}
</script>

</body>
</html>