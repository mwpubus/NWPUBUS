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
 <title>教师预约(长安--友谊)界面</title>
   <link href="css/bootstrap.min.css" rel="stylesheet">
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
<style>
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
				<div class="col-md-8 column">
					<ul class="breadcrumb">
						<li>
							 <a href="Teacher.jsp">预约</a>
						</li>
						<li>
							 <a href="TeacherCancel.jsp">已预约</a>
						</li>
						<li>
							 <a href="UserFeedback.jsp">用户反馈</a>
						</li>
					</ul>
					
					
					
					<!-- 这里显示距离最近一班车出发所大概剩余的时间 -->
					
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

				
				<div class="container">
					<div class="row clearfix">
						<div class="col-md-12 column">
							<div class="row clearfix">
								<div class="col-md-4 column">
									<div class="btn-group">
									<a href="Teacher.jsp" class="buttonYJ">长安--友谊</a>
									<a href="TeacherY-C.jsp" class="buttonYJ">友谊--长安</a>
									</div>
								</div>
								<div class="col-md-4 column">
								<br>								
								<a>当前路线：长安校区--友谊校区</a>
								</div>
								<div class="col-md-4 column">
								<!-- 这是一个查询块 -->
										<form class="navbar-form navbar-left" role="search">
											<div class="form-group">
												<input class="form-control" type="text" />
											</div> <button type="submit" class="btn btn-default" value="输入？?或？？查询">查询</button>
										</form>
								</div>
							</div>
						</div>
					</div>
				</div>


			<!-- 这是一个日期选项卡 -->
			<div class="tabbable" id="tabs-207109">
				<ul class="nav nav-tabs">
					<li>
						 <a href="#panel-1" data-toggle="tab" >
						  <span id="one">
			                   <script type="text/javascript">
			                     var date = new Date();
			                     document.write((date.getMonth() + 1) + "月" + date.getDate() + "日" + " 星期" + "日一二三四五六日一二三四五六".charAt(date.getDay()));
			                   </script>
			             </span>
			             </a>
					</li>
					<li>
						 <a href="#panel-2" data-toggle="tab">
						  <span id="two">
			                   <script type="text/javascript">
			                     var date = new Date();
			                     document.write((date.getMonth() + 1) + "月" + (date.getDate()+ 1) + "日" + " 星期" + "日一二三四五六日一二三四五六".charAt((date.getDay()+1)));
			                   </script>
			             </span>
						 </a>
					</li>
					<li>
						 <a href="#panel-3" data-toggle="tab">
						  <span id="three">
			                   <script type="text/javascript">
			                     var date = new Date();
			                     document.write((date.getMonth() + 1) + "月" + (date.getDate()+ 2) + "日" + " 星期" + "日一二三四五六日一二三四五六".charAt((date.getDay()+2)));
			                   </script>
			             </span>
						 </a>
					</li>
					<li>
						 <a href="#panel-4" data-toggle="tab">
						 <span id="four">
			                   <script type="text/javascript">
			                     var date = new Date();
			                     document.write((date.getMonth() + 1) + "月" + (date.getDate()+ 3) + "日" + " 星期" + "日一二三四五六日一二三四五六".charAt((date.getDay()+3)));
			                   </script>
			             </span>
						 </a>
					</li>
					<li>
						 <a href="#panel-5" data-toggle="tab">
						  <span id="five">
			                   <script type="text/javascript">
			                     var date = new Date();
			                     document.write((date.getMonth() + 1) + "月" + (date.getDate()+ 4) + "日" + " 星期" + "日一二三四五六日一二三四五六".charAt((date.getDay()+4)));
			                   </script>
			             </span>
						 </a>
					</li>
					<li>
						 <a href="#panel-6" data-toggle="tab">
						  <span id="six">
			                   <script type="text/javascript">
			                     var date = new Date();
			                     document.write((date.getMonth() + 1) + "月" + (date.getDate()+ 5) + "日" + " 星期" + "日一二三四五六日一二三四五六".charAt((date.getDay()+5)));
			                   </script>
			             </span>
						 </a>
					</li>
					<li>
						 <a href="#panel-7" data-toggle="tab">
						  <span id="seven">
			                   <script type="text/javascript">
			                     var date = new Date();
			                     document.write((date.getMonth() + 1) + "月" + (date.getDate()+ 6) + "日" + " 星期" + "日一二三四五六日一二三四五六".charAt((date.getDay()+6)));
			                   </script>
			             </span>
						 </a>
					</li>
				</ul>
				<!--第一个子页面 -->
				<% 
				DBHelper db =DBHelper.getInstance();
				Connection c = db.getConnection();
				String sql = "select license,time,remain from tbus where (day=?) and (start='长安') and (delay='正常工作')order by time ";
				
				PreparedStatement ps = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
				Date date = new Date();
				String xingqi ="星期"+"日一二三四五六日一二三四五六".charAt(date.getDay());
				ps.setString(1, xingqi);
				
				ResultSet rs = ps.executeQuery();
				
				%>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-1">
							<!-- 这是一个列表 -->
								<div class="container">
									<div class="row clearfix">
										<div class="col-md-12 column">
											<table class="table table-hover table-striped">
												<thead>
													<tr>
													    <th>
														校车序号
														</th>
														<th>
														发车时间
														</th>
														<th>
														已预约人数
														</th>
														<th>
														状态（能否乘坐？）
														</th>
														<th>
														操作
														</th>
													</tr>
													
												</thead>
												
													<tbody>
													<tr class="success">
													
														<td>
														id
														</td>
														<td>
														time
														</td>
														<td>
														number
														</td>
														<td>
														Approved
														</td>
														<td>

   						<script>
  			 			$(function () { $('#myModal').modal2('hide')});</script>					
  							</td>
  							
						</tr>
						 <%String status = "";
					
							 
         					 while (rs.next()) {
         						
         						if(Integer.parseInt(rs.getString(3))>=40)
    							{
    								status="待审核";
    							}
    							else
    							{
    								status="可预约";
    							}
       													 %>
        											 <tr>
          												 <td><%=rs.getString(1)%></td>
          												 <td><%=xingqi+rs.getString(2)%></td>
            											 <td><%=rs.getString(3)+"/40"%></td>
            											 <td><%=status%></td>
            											<td>
						<!-- 这是一个模态框 ，用来确认操作 -->
							<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModa1">预约</button><!-- 模态框（Modal） -->
   								<div class="modal fade" id="myModa1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  									 <div class="modal-dialog">
      									<div class="modal-content">
         									<div class="modal-header">
            									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">            </button>
            										<h4 class="modal-title" id="myModalLabe2">操作确认  请确认您要预约的校车信息： </h4>
        			 						</div>
         									<form class="form-horizontal" method="POST"
										action="OrderServlet">
         									<div class="modal-body">
         									
         									<p>校车序号：<input  type="" class="text1" id="license" 
													 name="license" placeholder="" class="text1" readonly="true"></input> </p>	
											<p>发车时间：<input  type="" class="text1" id="ltime" 
													 name="ltime" placeholder="" class="text1" readonly="true"></input> </p>
         									<p>预约人数：<input  type=""  id="lnum"
													 name="lnum" placeholder="" class="text1" readonly="true"></input> </p>
         									<p>路&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp线：<input  type="text" id="lplace" name = "lplace" class="text1" readonly="true" value="长安校区--友谊校区"></input> </p>


										
         									
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
  			 			$(function () { $('#myModal').modal2('hide')});</script>					
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
					
						</div>
					<!-- 第二个子页面 -->	
					<% 
				DBHelper db1 =DBHelper.getInstance();
				Connection c1 = db1.getConnection();
				String sql1 = "select license,time,remain from tobus where (day=?) and (start='长安') and (delay='正常工作')order by time ";
				PreparedStatement ps1 = c1.prepareStatement(sql1,Statement.RETURN_GENERATED_KEYS);
				Date date1 = new Date();
				String xingqi1 ="星期"+"日一二三四五六日一二三四五六".charAt(date1.getDay()+1);
				ps1.setString(1, xingqi1);
				ResultSet rs1 = ps1.executeQuery();				
				%>		
					<div class="tab-pane" id="panel-2">
							<!-- 这是一个列表 -->
								<div class="container">
									<div class="row clearfix">
										<div class="col-md-12 column">
											<table class="table table-hover table-striped">
												<thead>
													<tr>
														<th>
														校车序号
														</th>
														<th>
														发车时间
														</th>
														<th>
														已预约人数
														</th>
														<th>
														状态（能否乘坐？）
														</th>
														<th>
														操作
														</th>
													</tr>
												</thead>
												
													<tbody>
													<tr class="success">
														<td>
														id
														</td>
														<td>
														time
														</td>
														<td>
														number
														</td>
														<td>
														Approved
														</td>
														<td>

   						<script>
  			 			$(function () { $('#myModal').modal2('hide')});</script>					
  							</td>
						</tr>
									 <%String status1 = "";
							
         					 while (rs1.next()) {
         						if(Integer.parseInt(rs1.getString(3))>=40)
    							{
    								status1="待审核";
    							}
    							else
    							{
    								status1="可预约";
    							}
       													 %>
        											 <tr>
          												 <td><%=rs1.getString(1)%></td>
          												 <td><%=xingqi1+rs1.getString(2)%></td>
            											 <td><%=rs1.getString(3)+"/40"%></td>
            											 <td><%=status1%></td>
            											<td>
						<!-- 这是一个模态框 ，用来确认操作 -->
							<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModa2">预约</button><!-- 模态框（Modal） -->
   								<div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  									 <div class="modal-dialog">
      									<div class="modal-content">
         									<div class="modal-header">
            									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">            </button>
            										<h4 class="modal-title" id="myModalLabe2">操作确认  请确认您要预约的校车信息： </h4>
        			 						</div>
         									<form class="form-horizontal" method="POST"
										action="OrderServlet">
         									<div class="modal-body">
         									
         									
         									<p>校车序号：<input  type="" class="text1" id="license" 
													 name="license" placeholder="" class="text1" readonly="true"></input> </p>
											<p>发车时间：<input  type="" class="text1" id="ltime" 
													 name="ltime" placeholder="" class="text1" readonly="true"></input> </p>
         									<p>预约人数：<input  type=""  id="lnum"
													 name="lnum" placeholder="" class="text1" readonly="true"></input> </p>
         									<p>路&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp线：<input  type="text" id="lplace" name="lplace" class="text1" readonly="true" value="长安校区--友谊校区"></input> </p>


										
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
  			 			$(function () { $('#myModal').modal2('hide')});</script>					
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
					
						</div>
						<!--第三个子页面  -->
							<% 
				DBHelper db2 =DBHelper.getInstance();
				Connection c2 = db2.getConnection();
				String sql2 = "select license,time,remain from dwork where (day=?) and (start='长安') and (delay='正常工作')order by time ";
				PreparedStatement ps2 = c2.prepareStatement(sql2,Statement.RETURN_GENERATED_KEYS);
				Date date2 = new Date();
				String xingqi2 ="星期"+"日一二三四五六日一二三四五六".charAt(date2.getDay()+2);
				ps2.setString(1, xingqi2);
				ResultSet rs2 = ps2.executeQuery();				
				%>		
					<div class="tab-pane" id="panel-3">
						
						
						<!-- 这是一个列表 -->
							<div class="container">
								<div class="row clearfix">
									<div class="col-md-12 column">
										<table class="table table-hover table-striped">
											<thead>
													<tr>
														<th>
														校车序号
														</th>
														<th>
														发车时间
														</th>
														<th>
														已预约人数
														</th>
														<th>
														状态（能否乘坐？）
														</th>
														<th>
														操作
														</th>
													</tr>
												</thead>
												
													<tbody>
													<tr class="success">
														<td>
														id
														</td>
														<td>
														time
														</td>
														<td>
														number
														</td>
														<td>
														Approved
														</td>
													<td>
	
   						<script>
   						$(function () { $('#myModal').modal2('hide')});</script>				
  							</td>
						</tr>
					<%String status2 = "";
							
         					 while (rs2.next()) {
         						if(Integer.parseInt(rs2.getString(3))>=40)
    							{
    								status2="待审核";
    							}
    							else
    							{
    								status2="可预约";
    							}
       													 %>
        											 <tr>
          												<td><%=rs2.getString(1)%></td>
          												 <td><%=xingqi2+rs2.getString(2)%></td>
            											 <td><%=rs2.getString(3)+"/40"%></td>
            											 <td><%=status2%></td>
            											<td>
						<!-- 这是一个模态框 ，用来确认操作 -->
							<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModa3">预约</button><!-- 模态框（Modal） -->
   								<div class="modal fade" id="myModa3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   								<div class="modal-dialog">
      									<div class="modal-content">
         									<div class="modal-header">
            									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">            </button>
            										<h4 class="modal-title" id="myModalLabe2">操作确认  请确认您要预约的校车信息： </h4>
        			 						</div>
  									 <form class="form-horizontal" method="POST"
										action="OrderServlet">
         									<div class="modal-body">
         									
         									<p>校车序号：<input  type="" class="text1" id="license" 
													 name="license" placeholder="" class="text1" readonly="true"></input> </p>	
											<p>发车时间：<input  type="" class="text1" id="ltime" 
													 name="ltime" placeholder="" class="text1" readonly="true"></input> </p>
         									<p>预约人数：<input  type=""  id="lnum"
													 name="lnum" placeholder="" class="text1" readonly="true"></input> </p>
         									<p>路&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp线：<input  type="text" id="lplace" name="lplace" class="text1" readonly="true" value="长安校区--友谊校区"></input> </p>


											
										
										
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
  			 			$(function () { $('#myModal').modal2('hide')});</script>					
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
					
						</div>
				<!-- 第四个子页面 -->
				<% 
				DBHelper db3 =DBHelper.getInstance();
				Connection c3 = db3.getConnection();
				String sql3 = "select license,time,remain from dwork where (day=?) and (start='长安') and (delay='正常工作')order by time ";
				PreparedStatement ps3 = c3.prepareStatement(sql3,Statement.RETURN_GENERATED_KEYS);
				Date date3 = new Date();
				String xingqi3 ="星期"+"日一二三四五六日一二三四五六".charAt(date3.getDay()+3);
				ps3.setString(1, xingqi3);
				ResultSet rs3 = ps3.executeQuery();				
				%>		
					<div class="tab-pane" id="panel-4">
						
						
						<!-- 这是一个列表 -->
							<div class="container">
								<div class="row clearfix">
									<div class="col-md-12 column">
										<table class="table table-hover table-striped">
											<thead>
													<tr>
														<th>
														校车序号
														</th>
														<th>
														发车时间
														</th>
														<th>
														已预约人数
														</th>
														<th>
														状态（能否乘坐？）
														</th>
														<th>
														操作
														</th>
													</tr>
												</thead>
												
													<tbody>
													<tr class="success">
														<td>
														id
														</td>
														<td>
														time
														</td>
														<td>
														number
														</td>
														<td>
			 										    Approved
														</td>
													<td>
		
   						<script>
  			 			$(function () { $('#myModal').modal2('hide')});</script>					
  							</td>
						</tr>
					<%String status3 = "";
							
         					 while (rs3.next()) {
         						if(Integer.parseInt(rs3.getString(3))>=40)
    							{
    								status3="待审核";
    							}
    							else
    							{
    								status3="可预约";
    							}
       													 %>
        											 <tr>
          												 <td><%=rs3.getString(1)%></td>
          												 <td><%=xingqi3+rs3.getString(2)%></td>
            											 <td><%=rs3.getString(3)+"/40"%></td>
            											 <td><%=status3%></td>
            											<td>
						<!-- 这是一个模态框 ，用来确认操作 -->
							<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModa4">预约</button><!-- 模态框（Modal） -->
   								<div class="modal fade" id="myModa4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  									 <div class="modal-dialog">
      									<div class="modal-content">
         									<div class="modal-header">
            									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">            </button>
            										<h4 class="modal-title" id="myModalLabe2">操作确认  请确认您要预约的校车信息： </h4>
        			 						</div>
         									<form class="form-horizontal" method="POST"
										action="OrderServlet">
         									<div class="modal-body">
         									
         									<p>校车序号：<input  type="" class="text1" id="license" 
													 name="license" placeholder="" class="text1" readonly="true"></input> </p>	
											<p>发车时间：<input  type="" class="text1" id="ltime" 
													 name="ltime" placeholder="" class="text1" readonly="true"></input> </p>
         									<p>预约人数：<input  type=""  id="lnum"
													 name="lnum" placeholder="" class="text1" readonly="true"></input> </p>
         									<p>路&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp线：<input  type="text" id="lplace" name="lplace" class="text1" readonly="true" value="长安校区--友谊校区"></input> </p>


										
										
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
  			 			$(function () { $('#myModal').modal2('hide')});</script>					
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
					
						</div>
					<!-- 第五个子页面 -->
					<% 
				DBHelper db4 =DBHelper.getInstance();
				Connection c4 = db4.getConnection();
				String sql4 = "select license,time,remain from dwork where (day=?) and (start='长安') and (delay='正常工作')order by time ";
				PreparedStatement ps4 = c4.prepareStatement(sql4,Statement.RETURN_GENERATED_KEYS);
				Date date4 = new Date();
				String xingqi4 ="星期"+"日一二三四五六日一二三四五六".charAt(date4.getDay()+4);
				ps4.setString(1, xingqi4);
				ResultSet rs4 = ps4.executeQuery();				
				%>		
					<div class="tab-pane" id="panel-5">
						
						
						<!-- 这是一个列表 -->
							<div class="container">
								<div class="row clearfix">
									<div class="col-md-12 column">
										<table class="table table-hover table-striped">
											<thead>
													<tr>
														<th>
														校车序号
														</th>
														<th>
														发车时间
														</th>
														<th>
														已预约人数
														</th>
														<th>
														状态（能否乘坐？）
														</th>
														<th>
														操作
														</th>
													</tr>
												</thead>
											
													<tbody>
													<tr class="success">
														<td>
														id
														</td>
														<td>
														time
														</td>
														<td>
														number
														</td>
														<td>
														Approved
														</td>
													<td>
	
   						<script>
   						$(function () { $('#myModal').modal2('hide')});</script>				
  							</td>
						</tr>
					<%String status4 = "";
							
         					 while (rs4.next()) {
         						if(Integer.parseInt(rs4.getString(3))>=40)
    							{
    								status4="待审核";
    							}
    							else
    							{
    								status4="可预约";
    							}
       													 %>
        											 <tr>
          												 <td><%=rs4.getString(1)%></td>
          												 <td><%=xingqi4+rs4.getString(2)%></td>
            											 <td><%=rs4.getString(3)+"/40"%></td>
            											 <td><%=status4%></td>
            										<td>
						<!-- 这是一个模态框 ，用来确认操作 -->
							<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModa5">预约</button><!-- 模态框（Modal） -->
   								<div class="modal fade" id="myModa5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  									 <div class="modal-dialog">
      									<div class="modal-content">
         									<div class="modal-header">
            									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">            </button>
            										<h4 class="modal-title" id="myModalLabe2">操作确认  请确认您要预约的校车信息： </h4>
        			 						</div>
         									<form class="form-horizontal" method="POST"
										action="OrderServlet">
         									<div class="modal-body">
         									
         									<p>校车序号：<input  type="" class="text1" id="license" 
													 name="license" placeholder="" class="text1" readonly="true"></input> </p>
											<p>发车时间：<input  type="" class="text1" id="ltime" 
													 name="ltime" placeholder="" class="text1" readonly="true"></input> </p>
         									<p>预约人数：<input  type=""  id="lnum"
													 name="lnum" placeholder="" class="text1" readonly="true"></input> </p>
         									<p>路&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp线：<input  type="text" id="lplace" name="lplace" class="text1" readonly="true" value="长安校区--友谊校区"></input> </p>


									
										
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
  			 			$(function () { $('#myModal').modal2('hide')});</script>					
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
					
						</div>
						<!-- 第六个子页面 -->
						<% 
				DBHelper db5 =DBHelper.getInstance();
				Connection c5 = db5.getConnection();
				String sql5 = "select license,time,remain from dwork where (day=?) and (start='长安') and (delay='正常工作')order by time ";
				PreparedStatement ps5 = c5.prepareStatement(sql5,Statement.RETURN_GENERATED_KEYS);
				Date date5 = new Date();
				String xingqi5 ="星期"+"日一二三四五六日一二三四五六".charAt(date5.getDay()+5);
				ps5.setString(1, xingqi5);
				ResultSet rs5 = ps5.executeQuery();				
				%>		
					<div class="tab-pane" id="panel-6">
						
						
						<!-- 这是一个列表 -->
							<div class="container">
								<div class="row clearfix">
									<div class="col-md-12 column">
										<table class="table table-hover table-striped">
											<thead>
													<tr>
														<th>
														校车序号
														</th>
														<th>
														发车时间
														</th>
														<th>
														已预约人数
														</th>
														<th>
														状态（能否乘坐？）
														</th>
														<th>
														操作
														</th>
													</tr>
												</thead>
												
													<tbody>
													<tr class="success">
														<td>
														id
														</td>
														<td>
														time
														</td>
														<td>
														number
														</td>
														<td>
														Approved
														</td>
													<td>
				
   						<script>
  			 			$(function () { $('#myModal').modal2('hide')});</script>					
  							</td>
						</tr>
					<%String status5 = "";
							
         					 while (rs5.next()) {
         						if(Integer.parseInt(rs5.getString(3))>=40)
    							{
    								status5="待审核";
    							}
    							else
    							{
    								status5="可预约";
    							}
       													 %>
        											 <tr>
          												 <td><%=rs5.getString(1)%></td>
          												 <td><%=xingqi5+rs5.getString(2)%></td>
            											 <td><%=rs5.getString(3)+"/40"%></td>
            											 <td><%=status5%></td>
            											<td>
						<!-- 这是一个模态框 ，用来确认操作 -->
							<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModa6">预约</button><!-- 模态框（Modal） -->
   								<div class="modal fade" id="myModa6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  									 <div class="modal-dialog">
      									<div class="modal-content">
         									<div class="modal-header">
            									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">            </button>
            										<h4 class="modal-title" id="myModalLabe2">操作确认  请确认您要预约的校车信息： </h4>
        			 						</div>
         									<form class="form-horizontal" method="POST"
										action="OrderServlet">
         									<div class="modal-body">
         									
         									<p>校车序号：<input  type="" class="text1" id="license" 
													 name="license" placeholder="" class="text1" readonly="true"></input> </p>	
											<p>发车时间：<input  type="" class="text1" id="ltime" 
													 name="ltime" placeholder="" class="text1" readonly="true"></input> </p>
         									<p>预约人数：<input  type=""  id="lnum"
													 name="lnum" placeholder="" class="text1" readonly="true"></input> </p>
         									<p>路&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp线：<input  type="text" id="lplace" name="lplace" class="text1" readonly="true" value="长安校区--友谊校区"></input> </p>


										
										
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
  			 			$(function () { $('#myModal').modal2('hide')});</script>					
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
					
						</div>
						<!-- 第七个页面 -->
						<% 
				DBHelper db6 =DBHelper.getInstance();
				Connection c6 = db6.getConnection();
				String sql6 = "select license,time,remain from dwork where (day=?) and (start='长安') and (delay='正常工作')order by time ";
				PreparedStatement ps6 = c6.prepareStatement(sql6,Statement.RETURN_GENERATED_KEYS);
				Date date6 = new Date();
				String xingqi6 ="星期"+"日一二三四五六日一二三四五六".charAt(date6.getDay()+6);
				ps6.setString(1, xingqi6);
				ResultSet rs6 = ps6.executeQuery();				
				%>	
					<div class="tab-pane" id="panel-7">
						
						
						<!-- 这是一个列表 -->
							<div class="container">
								<div class="row clearfix">
									<div class="col-md-12 column">
										<table class="table table-hover table-striped">
											<thead>
												<tr>
														<th>
														校车序号
														</th>
														<th>
														发车时间
														</th>
														<th>
														已预约人数
														</th>
														<th>
														状态（能否乘坐？）
														</th>
														<th>
														操作
														</th>
													</tr>
											</thead>
											
												<tbody>
												<tr class="success">
													<td>
														id
														</td>
														<td>
														time
														</td>
														<td>
														number
														</td>
														<td>
														Approved
														</td>
													<td>
					
   						<script>
  			 			$(function () { $('#myModal').modal2('hide')}));</script>					
  							</td>
						</tr>
					<%String status6 = "";
							
         					 while (rs6.next()) {
         						if(Integer.parseInt(rs6.getString(3))>=40)
    							{
    								status6="待审核";
    							}
    							else
    							{
    								status6="可预约";
    							}
       													 %>
        											 <tr>
          												 <td><%=rs6.getString(1)%></td>
          												 <td><%=xingqi6+rs6.getString(2)%></td>
            											 <td><%=rs6.getString(3)+"/40"%></td>
            											 <td><%=status6%></td>
            											<td>
						<!-- 这是一个模态框 ，用来确认操作 -->
							<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModa7">预约</button><!-- 模态框（Modal） -->
   								<div class="modal fade" id="myModa7" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  									 <div class="modal-dialog">
      									<div class="modal-content">
         									<div class="modal-header">
            									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">            </button>
            										<h4 class="modal-title" id="myModalLabe2">操作确认  请确认您要预约的校车信息： </h4>
        			 						</div>
         									<form class="form-horizontal" method="POST"
										action="OrderServlet">
         									<div class="modal-body">
         									
         									<p>校车序号：<input  type="" class="text1" id="license" 
													 name="license" placeholder="" class="text1" readonly="true"></input> </p>	
											<p>发车时间：<input  type="" class="text1" id="ltime" 
													 name="ltime" placeholder="" class="text1" readonly="true"></input> </p>
         									<p>预约人数：<input  type=""  id="lnum"
													 name="lnum" placeholder="" class="text1" readonly="true"></input> </p>
         									<p>路&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp线：<input  type="text" id="lplace" name="lplace" class="text1" readonly="true" value="长安校区--友谊校区"></input> </p>


									
										
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
  			 			$(function () { $('#myModal').modal2('hide')});</script>					
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
					
						</div>
					
				</div>
					<!-- 这是一个提示信息 -->
				<div class="alert alert-success alert-dismissable">
				 	<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
				 		<strong>提示!<br></strong> 预约需要排队，请您耐心等待，感谢配合。<br>有问题请在用户反馈界面与我们交流，我们将会及时回复，谢谢合作。<br> <a href="Teacher.jsp" class="alert-link">返回</a>
				</div>
</div>
</div>
</div>
</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nouislider.js"></script>
	<script src="toastr/toastr.js"></script>
	<script type="text/javascript">

		$(function() {
			var license,ltime,lnum;
			
			$("#panel-1").on(
					"click",
					"button",
					function(event) {
						license  = $(this).parent().parent().find("td").eq(0)
				           .text();
				ltime =$(this).parent().parent().find("td").eq(1)
					    .text();
				lnum = $(this).parent().parent().find("td").eq(
						2).text();

				console.log(license);
				console.log(ltime);
				console.log(lnum);
						
					});
			$('#deleteModal').on('show.bs.modal',function(){
				$(this).find("a").attr("href","DeleteLibrarian?lNo="+lno);
			});
			$("#changepasswordModal").on('show.bs.modal', function() {
				$(this).find("#lNo").val(lno);
				$(this).find("#lpassword").val(lpassword);
			})
			$("#myModa1").on('show.bs.modal', function() {
				$(this).find("#license").val(license);
				$(this).find("#ltime").val(ltime);
				$(this).find("#lnum").val(lnum);
			})
			
		})

	</script>
	
	<script type="text/javascript">

		$(function() {
			var license,ltime,lnum;
			$("#panel-2").on(
					"click",
					"button",
					function(event) {
						license  = $(this).parent().parent().find("td").eq(0)
				           .text();
				ltime = $(this).parent().parent().find("td").eq(1)
					    .text();
				lnum = $(this).parent().parent().find("td").eq(
						2).text();
				console.log(license);
				console.log(ltime);
				console.log(lnum);
						
					});
			$('#deleteModal').on('show.bs.modal',function(){
				$(this).find("a").attr("href","DeleteLibrarian?lNo="+lno);
			});
			$("#changepasswordModal").on('show.bs.modal', function() {
				$(this).find("#lNo").val(lno);
				$(this).find("#lpassword").val(lpassword);
			})
			$("#myModa2").on('show.bs.modal', function() {
				$(this).find("#license").val(license);
				$(this).find("#ltime").val(ltime);
				$(this).find("#lnum").val(lnum);
			})
			
		})

	</script>
	
	<script type="text/javascript">

		$(function() {
			var license,ltime,lnum;
			$("#panel-3").on(
					"click",
					"button",
					function(event) {
						license  = $(this).parent().parent().find("td").eq(0)
				           .text();
				ltime = $(this).parent().parent().find("td").eq(1)
					    .text();
				lnum = $(this).parent().parent().find("td").eq(
						2).text();
				console.log(license);
				console.log(ltime);
				console.log(lnum);
						
					});
			$('#deleteModal').on('show.bs.modal',function(){
				$(this).find("a").attr("href","DeleteLibrarian?lNo="+lno);
			});
			$("#changepasswordModal").on('show.bs.modal', function() {
				$(this).find("#lNo").val(lno);
				$(this).find("#lpassword").val(lpassword);
			})
			$("#myModa3").on('show.bs.modal', function() {
				$(this).find("#license").val(license);
				$(this).find("#ltime").val(ltime);
				$(this).find("#lnum").val(lnum);
			})
			
		})

	</script>
	
	<script type="text/javascript">

		$(function() {
			var license,ltime,lnum;
			$("#panel-4").on(
					"click",
					"button",
					function(event) {
						license  = $(this).parent().parent().find("td").eq(0)
				           .text();
				ltime = $(this).parent().parent().find("td").eq(1)
					    .text();
				lnum = $(this).parent().parent().find("td").eq(
						2).text();
				console.log(license);
				console.log(ltime);
				console.log(lnum);
						
					});
			$('#deleteModal').on('show.bs.modal',function(){
				$(this).find("a").attr("href","DeleteLibrarian?lNo="+lno);
			});
			$("#changepasswordModal").on('show.bs.modal', function() {
				$(this).find("#lNo").val(lno);
				$(this).find("#lpassword").val(lpassword);
			})
			$("#myModa4").on('show.bs.modal', function() {
				$(this).find("#license").val(license);
				$(this).find("#ltime").val(ltime);
				$(this).find("#lnum").val(lnum);
			})
			
		})

	</script>
	
	<script type="text/javascript">

		$(function() {
			var license,ltime,lnum;
			$("#panel-5").on(
					"click",
					"button",
					function(event) {
						license  = $(this).parent().parent().find("td").eq(0)
				           .text();
				ltime =$(this).parent().parent().find("td").eq(1)
					    .text();
				lnum = $(this).parent().parent().find("td").eq(
						2).text();
				console.log(license);
				console.log(ltime);
				console.log(lnum);
						
					});
			$('#deleteModal').on('show.bs.modal',function(){
				$(this).find("a").attr("href","DeleteLibrarian?lNo="+lno);
			});
			$("#changepasswordModal").on('show.bs.modal', function() {
				$(this).find("#lNo").val(lno);
				$(this).find("#lpassword").val(lpassword);
			})
			$("#myModa5").on('show.bs.modal', function() {
				$(this).find("#license").val(license);
				$(this).find("#ltime").val(ltime);
				$(this).find("#lnum").val(lnum);
			})
			
		})

	</script>
	
	<script type="text/javascript">

		$(function() {
			var license,ltime,lnum;
			$("#panel-6").on(
					"click",
					"button",
					function(event) {
						license  = $(this).parent().parent().find("td").eq(0)
						           .text();
						ltime =$(this).parent().parent().find("td").eq(1)
							    .text();
						lnum = $(this).parent().parent().find("td").eq(
								2).text();
						console.log(license);
						console.log(ltime);
						console.log(lnum);
						
					});
			$('#deleteModal').on('show.bs.modal',function(){
				$(this).find("a").attr("href","DeleteLibrarian?lNo="+lno);
			});
			$("#changepasswordModal").on('show.bs.modal', function() {
				$(this).find("#lNo").val(lno);
				$(this).find("#lpassword").val(lpassword);
			})
			$("#myModa6").on('show.bs.modal', function() {
				$(this).find("#license").val(license);
				$(this).find("#ltime").val(ltime);
				$(this).find("#lnum").val(lnum);
			})
			
		})

	</script>
	
	<script type="text/javascript">

		$(function() {
			var license,ltime,lnum;
			$("#panel-7").on(
					"click",
					"button",
					function(event) {
						license  = $(this).parent().parent().find("td").eq(0)
				           .text();
				ltime = $(this).parent().parent().find("td").eq(1)
					    .text();
				lnum = $(this).parent().parent().find("td").eq(
						2).text();

				console.log(license);
				console.log(ltime);
				console.log(lnum);
						
					});
			$('#deleteModal').on('show.bs.modal',function(){
				$(this).find("a").attr("href","DeleteLibrarian?lNo="+lno);
			});
			$("#changepasswordModal").on('show.bs.modal', function() {
				$(this).find("#lNo").val(lno);
				$(this).find("#lpassword").val(lpassword);
			})
			$("#myModa7").on('show.bs.modal', function() {
				$(this).find("#license").val(license);
				$(this).find("#ltime").val(ltime);
				$(this).find("#lnum").val(lnum);
			})
			
		})

	</script>
	
	
</body>
</html>