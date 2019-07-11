<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="utils.*" %>
    <%@page import="java.util.Date" %>
    <%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.Connection"%>
    <%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <title>管理员预约状态查看界面（友谊--长安）</title>
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
				<P>欢迎&nbsp&nbsp<a>LYF</a>&nbsp&nbsp&nbsp&nbsp<a>退出登陆</a></P>
				
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
							 <a href="#">预约状态</a>
						</li>
						<li>
							 <a href="Admin.jsp">长安--友谊校区</a>
						</li>
						<li class="active">
							 <a href="AdminStatusY-C.jsp">友谊--长安校区</a>
						</li>
						<li class="disabled">
							 <a href="#">发车安排</a>
						</li>
						<li>
							 <a href="AdminCarEditC-Y.jsp">长安--友谊校区</a>
						</li>
						<li>
							 <a href="AdminCarEditY-C.jsp">友谊--长安校区</a>
						</li>
					</ul>
				</div>
				<div class="col-md-10 column">
				<!-- 这是一个列表 -->
				<%
				DBHelper db = DBHelper.getInstance();
				Connection c = db.getConnection();
				Date date = new Date();
				String xingqi ="星期"+"日一二三四五六日一二三四五六".charAt(date.getDay());
				String sql = "select count(*) from tbus where start = '友谊' and delay = '空闲' and day = ?";
				PreparedStatement ps = c.prepareStatement(sql);
				ps.setString(1, xingqi);
				ResultSet rs = ps.executeQuery();
				int kongxian = 0;
				if(rs.next()) {
					kongxian = rs.getInt(1);
				}
				sql = "select * from tbus where start = '友谊' and delay = '正常工作' and day = ? order by time";
				ps = c.prepareStatement(sql);
				ps.setString(1, xingqi);
				rs = ps.executeQuery();
				%>
											<table class="table table-hover table-striped">
												<thead>
													<tr>
													    <th>
														发车时间
														</th>
														<th>
														发车路线
														</th>
														<th>
														已预约人数
														</th>
														<th>
														发车数量
														</th>
														<th>
														空闲司机
														</th>
														
													</tr>
												</thead>
													<tbody>
													<%
													while(rs.next()) {
														String time = rs.getString("time");
														String sql2 = "select remain from tbus where time = ? and day = ? and start = '友谊'";
														PreparedStatement ps2 = c.prepareStatement(sql2);
														ps2.setString(1, time);
														ps2.setString(2, xingqi);
														ResultSet rs2 = ps2.executeQuery();
														int i = 0, remain = 0;
														while(rs2.next()) {
															i++;
															remain += rs2.getInt("remain");
														}
													%>
													<tr class="success">
														<td>
														<%=time %>
														</td>
														<td>
														友谊-->长安
														</td>
														<td>
														<%=remain %>
														</td>
														<td>
														<%=i %>		
							  							</td>
							  							<td>
														<%=kongxian %>				
							  							</td>
													</tr>
													<%} %>
											</tbody>
										</table>
								</div>
						 </div>				
					</div>	
</body>
</html>