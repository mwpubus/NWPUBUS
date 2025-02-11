<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="utils.*"%>
 <%@page import="java.sql.ResultSet"%>
 <%@page import="java.sql.DriverManager"%>
 <%@page import="java.sql.Connection"%>
 <%@page import="java.sql.Statement"%>
 <%@page import="java.sql.PreparedStatement"%>
 <%@page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <title>今日已安排司机界面</title>
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
				<body onload="startTime()">
	
				<div id="txt"></div>
	
				</body>
				</div>
			</div>
		</div>
		
		<div class="col-md-2 column">
		<br><br>
					<ul class="nav nav-stacked nav-pills">
						<li class="disabled">
							 <a href="#">司机名单</a>
						</li>
						<li class="active">
							 <a href="AdminDriver.jsp">今日司机安排</a>
						</li>
						<li>
							 <a href="AdminDriverNo.jsp">今日空闲司机</a>
						</li>
						<li>
							 <a href="AdminDriverTO.jsp">明日司机安排</a>
						</li>
							<li>
							 <a href="AdminDriverTONo.jsp">明日空闲司机</a>
						</li>
						
						<li>
							 <a href="AdminDriverQJ.jsp">司机请假处理</a>
						</li>
						
					
					</ul>
				</div>
				<% 
				DBHelper db =DBHelper.getInstance();
				Connection c = db.getConnection();
				String sql = "select license,name,time,start from tbus where (delay = '正常工作' or delay = '替班' or delay = '加班') order by start,time";
				
				PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			
				
				ResultSet rs = ps.executeQuery();
				
				%>
				<div class="col-md-10 column">
				<!-- 这是一个列表 -->
											<table class="table table-hover table-striped">
												<thead>
													<tr>
													    <th>
														校车编号
														</th>
														<th>
														姓名
														</th>
														<th>
														出发时间
														</th>
														<th>
														起点
														</th>													
													</tr>
												</thead>
													<tbody>
													<tr class="success">
														<td>
														data
														</td>
														<td>
														name
														</td>
														<td>
														time
														</td>
														<td>
														start		
							  							</td>
													</tr>
													<%
					
							 
         					 while (rs.next()) {
         						
         						
       													 %>
        											 <tr>
          												 <td><%=rs.getString(1)%></td>
          												 <td><%=rs.getString(2)%></td>
            											 <td><%=rs.getString(3)%></td>
            											 <td><%=rs.getString(4)+"校区"%></td>
            								
														
														
         											 </tr>
         													<%
           														  }
         													%>
											</tbody>
										</table>
								</div>
						 </div>				
					</div>	
</body>
</html>