<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="dao.*, entity.*" %>
    <%@ page import="java.util.ArrayList, java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <title>用户反馈信息界面</title>
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
<div class="tab-pane" id="panel">
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
		
			<!-- 这是一个列表 -->
			<table class="table table-hover table-striped" id="tablell">
				<thead>
					<tr>
						<th>
						反馈用户
						</th>
						<th>
						标题
						</th>
						<th>
						反馈时间
						</th>
						<th>
						操作
						</th>													
					</tr>
				</thead>
				<tbody>
				<%
				FeedBackDAO fbd = new FeedBackDAO();
				List<FeedBack> lists = new ArrayList<>(fbd.getFeedBacks());
				for(FeedBack fb : lists) {
				%>
					<tr class="success">
						<td>
						<%=fb.getUid() %>
						</td>
						<td>
						<a href="AdminFeedback2.jsp?uid=<%=fb.getUid()%>&title=<%=fb.getTitle() %>&time=<%=fb.getTime() %>">
						<%=fb.getTitle() %>
						</a>
						</td>
						<td>
						<%=fb.getTime() %>
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
         									<form class="form-horizontal" method="POST"
										action="FeedbkCancel">
         									<div class="modal-body">
         									
         									<p>ID：<input type="text" class="text1" id="uid" 
													 name="uid" placeholder="" class="text1" readonly="true"></input> </p>
											<p>标题：<input type="text" class="text1" id="title" 
													 name="title" placeholder="" class="text1" readonly="true"></input> </p>
         									<p>时间：<input type="text"  id="time"
													 name="time" placeholder="" class="text1" readonly="true"></input> </p>
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
		var uid, title, time;
		$("#tablell").on("click", "button", function(event) {
			uid = $(this).parent().parent().find("td").eq(0).text().replace(/\n/g,"").replace(/\s/g,"");
			title = $(this).parent().parent().find("td").eq(1).text().replace(/\n/g,"").replace(/\s/g,"");
			time = $(this).parent().parent().find("td").eq(2).text().replace(/\n/g,"").replace(/\s/g,"");
			console.log(uid);
			console.log(title);
			console.log(time);
		});
		$("#myModa5").on('show.bs.modal', function() {
			$(this).find("#uid").val(uid);
			$(this).find("#title").val(title);
			$(this).find("#time").val(time);
		});
		
	});
	</script>
</body>
</html>