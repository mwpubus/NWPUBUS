<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="utils.*" %>
    <%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.Connection"%>
    <%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <title>调度员界面（长安--友谊）</title>
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
<style>
.text1
{
	border-background: white;
	border: none;
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
						<li class="active">
							 <a href="AdminDDY.jsp">调度员信息</a>
						</li>
						<li>
							 <a href="AdminDriver.jsp">司机信息</a>
						</li>
						<li>
							  <div class="dropdown">
							  <a>其他</a>
							  <div class="dropdown-content">
							    <a href="AdminFeedback.jsp">用户反馈处理</a><br>
							    <a href="AdminGG.jsp">发布公告</a>
							  </div>
							</div>
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
							 <a href="#">调度员名单</a>
						</li>
						<li class="active">
							 <a href="AdminDDY.jsp">长安--友谊校区</a>
						</li>
						<li>
							 <a href="AdminDDYY-C.jsp">友谊--长安校区</a>
						</li>
					</ul>
				</div>
				<div class="col-md-10 column">
				<!-- 这是一个列表 -->
				<%
				DBHelper db = DBHelper.getInstance();
				Connection c = db.getConnection();
				String sql = "select * from vwork where place = '长安'";
				PreparedStatement ps = c.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				%>
											<table class="table table-hover table-striped" id="table1">
												<thead>
													<tr>
													    <th>
														调度员编号
														</th>
														<th>
														姓名
														</th>
														<th>
														工作时间
														</th>
														<th>
														操作
														</th>													
													</tr>
												</thead>
													<tbody>
													<%
													while(rs.next()) {
														String id = rs.getString("u_id");	
														String name = rs.getString("name");
														String time = rs.getString("time");
													%>
													<tr class="success">
														<td>
														<%=id %>
														</td>
														<td>
														<%=name %>
														</td>
														<td>
														<%=time %>
														</td>
														<td>
						<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModa5">删除</button><!-- 模态框（Modal） -->
   								<div class="modal fade" id="myModa5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  									 <div class="modal-dialog">
      									<div class="modal-content">
         									<div class="modal-header">
            									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">            </button>
            										<h4 class="modal-title" id="myModalLabe2">确认删除？ </h4>
        			 						</div>
         									<form class="form-horizontal" method="POST" action="DDYCancelServlet">
         									<div class="modal-body">
         									
         									<p>ID：<input type="text" class="text1" id="uid" 
													 name="uid" placeholder="" class="text1" readonly="true"></input> </p>
											<p>标题：<input type="text" class="text1" id="vname" 
													 name="vname" placeholder="" class="text1" readonly="true"></input> </p>
         									<p>时间：<input type="text"  id="time"
													 name="time" placeholder="" class="text1" readonly="true"></input> </p>
											<input type="hidden" id="place" name="place" value="长安" />
											</div>
         									
         									<div class="modal-footer">
            									<button type="button" class="btn btn-default" data-dismiss="modal" >关闭 </button>
            									<button type="submit" class="btn btn-primary" onclick="" > 确认</button>
            									
        				 					</div>
        				 					</form>

     									</div><!-- /.modal-content -->
   									</div>
   						<!-- /.modal-dialog --></div><!-- /.modal -->
        			 		<script>
        			 		$(function() { $('#myModal').modal2('hide')})
        			 		</script>
						</td>
													</tr>
													<%} %>
											</tbody>
										</table>
								</div>
						 </div>				
					</div>	
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nouislider.js"></script>
	<script src="toastr/toastr.js"></script>
<script type="text/javascript">
	$(function() {
		var uid, vname, time;
		$("#table1").on("click", "button", function(event) {
			uid = $(this).parent().parent().find("td").eq(0).text().replace(/\n/g,"").replace(/\s/g,"");
			vname = $(this).parent().parent().find("td").eq(1).text().replace(/\n/g,"").replace(/\s/g,"");
			time = $(this).parent().parent().find("td").eq(2).text().replace(/\n/g,"").replace(/\s/g,"");
			console.log(uid);
			console.log(vname);
			console.log(time);
		});
		$("#myModa5").on('show.bs.modal', function() {
			$(this).find("#uid").val(uid);
			$(this).find("#vname").val(vname);
			$(this).find("#time").val(time);
		});
		
	});
	</script>
</body>
</html>