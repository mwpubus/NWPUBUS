<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="dao.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <title>用户反馈信息界面2</title>
   <link href="css/bootstrap.min.css" rel="stylesheet">
   <link href="css/lanren.css" rel="stylesheet">
   <script src="js/jquery.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
   
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
<style>
.buttonXK{
	border-radius: 8px;
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}

.buttonXK1 {
    background-color: white; 
    color: black; 
    border: 2px solid #4CAF50;
}

.buttonXK1:hover {
    background-color: #4CAF50;
    color: white;
}
.buttonXK2 {
    background-color: white; 
    color: black; 
    border: 2px solid #008CBA;
}

.buttonXK2:hover {
    background-color: #008CBA;
    color: white;
}

.buttonYJ {
	border-radius: 25px;
    background-color: blue;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 10px;
    margin: 4px 2px;
    cursor: pointer;
}
.text1
{
	border-background: white;
	border: none;
}
.dropdown {
  position: relative;
  display: inline-block;
  z-index:9999
}
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  padding: 12px 16px;
  z-index:9999
}
.dropdown:hover .dropdown-content {
  display: block;
  z-index:9999
}
p{
	font-family: georgia, serif;
	color: #140B0B;
	font-size: 18px;
	font-weight: bold;
	text-align: center;
	letter-spacing: 0pt;
	word-spacing: 0pt;
}
</style>
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
							 <a href="Admin.jsp">发车安排</a>
						</li>
						<li>
							 <a href="AdminDDY.jsp">调度员信息</a>
						</li>
						<li>
							 <a href="AdminDriver.jsp">司机信息</a>
						</li>
						<li>
							 <a href="AdminFeedback.jsp">用户反馈处理</a>
						</li>
					</ul>
				</div>
				<div class="col-md-3 column">
				<P>欢迎&nbsp&nbsp<a><%=request.getSession().getAttribute("id")%></a>&nbsp&nbsp&nbsp&nbsp<a href="Login.jsp">退出登陆<a></P>
				
				</div>
				<div class="col-md-4 column">
					<iframe scrolling="no" src="https://tianqiapi.com/api.php?style=tu&skin=pitaya" frameborder="0" width="300" height="25" allowtransparency="true"></iframe>
				<a>	
				<div id="txt" ><script>window.onload = startTime();</script></div>
				</a>
				</div>
			</div>
		</div>
		<%
	FeedBackDAO fbd = new FeedBackDAO();
	String uid = request.getParameter("uid");
	String title = request.getParameter("title");
	String time = request.getParameter("time");
	String content = fbd.getContent(uid, title, time);
	%>
		<div class="col-md-12 column">
		<dl class="dl-horizontal">
				<dt>
					标题
				</dt>
				<dd>
					<input  type="text" id="ltime" readonly="true" value=<%=uid %> class="text1"></input>
				</dd>
				<br><br>
				<dt>
					用户
				</dt>
				<dd>
					<input  type="text" id="ltime" readonly="true" value=<%=title %> class="text1"></input>
				</dd>
				<br><br>
				<dt>
					时间
				</dt>
				<dd>
					<input  type="text" id="ltime" readonly="true" value=<%=time %> class="text1"></input>
				</dd>
				<br><br>
				<dt>
					具体原因
				</dt>
				<dd>
				   <textarea  class="textarea" rows="8" cols="100" name="uCode" id="ltime" readonly="true" ><%=content %></textarea>
					
				</dd>
				<br><br>
				<dd>
					
					<div class="col-md-12 column">
						<div class="col-md-9 column">
						</div>
						<div class="col-md-3 column">
					<a class="buttonXK buttonXK2" href="AdminFeedback.jsp">返回</a>
						</div>
					</div>
				</dd>
			</dl>
		



</div>
</div>						
</body>
</html>