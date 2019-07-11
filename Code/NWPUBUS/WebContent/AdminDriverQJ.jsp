<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@page import="java.util.Date"%>
<%@ page import="utils.*"%>
<%@ page import="entity.*"%>
<%@ page import="dao.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <title>司机请假处理界面</title>
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

.text1
{
	border-background: white;
	border: none;
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
		
		<div class="col-md-2 column">
		<br><br>
					<ul class="nav nav-stacked nav-pills">
						<li class="disabled">
							 <a href="#">司机名单</a>
						</li>
					<li >
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
						
						<li class="active">
							 <a href="AdminDriverQJ.jsp">司机请假处理</a>
						</li>
						
					</ul>
				</div>
				<div class="col-md-10 column">
				<% 
				DBHelper db =DBHelper.getInstance();
				Connection c = db.getConnection();
				String sql = "select * from askleave order by time desc";
				PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		
				ResultSet rs = ps.executeQuery();
				
				%>
				<!-- 这是一个列表 -->
											<table class="table table-hover table-striped" >
												<thead>
													<tr>
													     <th>
														司机姓名
														</th>
														<th>
														申请时间
														</th>
														<th>
														请假原因
														</th>
														<th>
														请求时间
														</th>
														<th>
														操作
														</th>													
													</tr>
												</thead>
													<tbody id = "driverlist">
													<tr class="success" >
														<td>
														name
														</td>
														<td>
														day
														</td>
														<td>
											            reason
														</td>
															<td>
														time
														</td>
															<td>
														operate
														</td>
														
													</tr>
																									<%
							
         					 while (rs.next()) {
         					
       													 %>
       													  <tr >
          												 <td><%=rs.getString(1)%></td>
          												 <td><%=rs.getString(2)%></td>
            											 <td><%=rs.getString(3)%></td>
            											 <td><%=rs.getString(4)%></td>
            											 <td>
															<!-- 这是一个模态框 ，用来确认操作 -->
																<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModa1">同意</button><!-- 模态框（Modal） -->
									   						<div class="modal fade" id="myModa1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									  									 <div class="modal-dialog">
									      									<div class="modal-content">
									         									<div class="modal-header">
									            									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×            </button>
									            										<h4 class="modal-title" id="myModalLabe2">操作确认 </h4>
									        			 						</div>
									        			 						<form id="xxxFrom" class="form-horizontal" method="POST" action="DealQJServlet">
									        			 						
									        			 						
									         									<div class="modal-body"> 
									         									<p>司机姓名：<input  type="text" id="name" name="name" readonly="true" value="" class="text1"></input> </p>
									         									<p>请假原因：<input  type="text" id="reason" name="reason" readonly="true" value="" class="text1"></input> </p>  
									         									<p>请假时间：<input  type="text" id="day" name="day" readonly="true" value="" class="text1"></input> </p> 
									         									<p>空闲司机：<div><select class="form-control" onchange="selectOnchang(this)" id = "NewD" name = "NewD" >
									         									<%
									         									String name = rs.getString(1);
									        			 						String sql1 = "select name from tobus where  (delay = '空闲') and name in (select name from bbus where dispatch = (select dispatch from bbus where name = ?))order by name";
									        			 						PreparedStatement ps1 = c.prepareStatement(sql1,Statement.RETURN_GENERATED_KEYS);
									        			 				        ps1.setString(1, name);
									        			 						ResultSet rs1 = ps1.executeQuery();
									        			 						while(rs1.next()){ 
									        			 							
									        			 						%>
																                					
																               					    <option><%=rs1.getString(1)%></option>
																               					    <%} %>
																            					    </select></div>
																							
																				        	     
									         									 </div>
									         									<div class="modal-footer">
									            									<button type="button" class="btn btn-default" data-dismiss="modal" >取消</button>
									            									<button type="submit" class="btn btn-primary" onclick="" >确认</button>
									        				 					</div>
									        				 					</form>
									     									</div><!-- /.modal-content -->
									   									</div>
									   									</div>
									   						<script>
									  			 			$(function () { $('#myModa1').modal2('hide')});</script>
									  			 			<button class="btn btn-default btn-xs" type="button" onclick="window.location.href='RefuseQJServlet?name=<%=name%>'">拒绝</button>					
							  							</td>
													</tr>
													<%
           														  }
         													%>
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
			var name,reason,day;
			$("#driverlist").on(
					"click",
					"button",
					function(event) {
						name  = $(this).parent().parent().find("td").eq(0)
						           .text();
						reason = $(this).parent().parent().find("td").eq(2)
							    .text();
						day = $(this).parent().parent().find("td").eq(
								1).text();
					
						console.log(name);
						console.log(reason);
						console.log(day);
					
						
					});

			$("#myModa1").on('show.bs.modal', function() {
				$(this).find("#name").val(name);
				$(this).find("#reason").val(reason);
				$(this).find("#day").val(day);
			
			})
			
		})

	</script>
	<script>
function sendmail() {
	document.forms.xxxFrom.action="RefuseQJServlet";
	document.forms.xxxFrom.submit();
}
</script>
</body>
</html>