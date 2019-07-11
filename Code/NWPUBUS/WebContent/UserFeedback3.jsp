<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <title>反馈界面</title>
   <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
   <script src="//cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
   <script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
   <style>
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
							<a href="Driver.jsp">预约信息</a>
						</li>
					
						<li>
							<a href="UserFeedback3.jsp">用户反馈</a>
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
		<form class="form-horizontal" role="form" action="FeedBackServlet" method="post">
			<div class="form-group">
				<div class="col-md-8 column">
					<h3>
						用户反馈
					</h3>
				</div>
				<div class="col-md-4 column">
					 
				</div>
			</div>
			<div class="form-group">
							<label for="usertype" class="col-md-3 control-label">反馈原因</label>
							<div class="col-md-9">
                                      <select class="form-control" onchange="selectOnchang(this)" name = "title">
                					<option>界面美化</option>
               					    <option>系统反应</option>
                					<option>操作优化</option>
            					    </select>
							</div>
			</div>
			
			<div class="form-group">
      			<label for="usertype" class="col-sm-3 control-label">详细描述</label>
         		<div class="col-md-9 column">
      				<textarea class="form-control" id="content" cols="70" placeholder="在这里输入请假信息"  name="content" rows="10" 
      				style="OVERFLOW:   hidden" onblur="checkInput(this.value)"></textarea>
      			</div>
   			</div>
   			<div class="form-group">
							<div class="col-md-3"></div>
							<div class="col-md-9">
								
								<div id="msg" style="color:red;"></div>
							</div>
			</div>
			<div class="form-group">
				<div class="col-md-3 column"></div>
				<div class="col-md-9 column">
					<button type="submit" class="btn btn-block btn-primary" onclick="">提交</button>
   				</div>
   			</div>
   		</form>
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

<script type="text/javascript">
        function checkInput(obj){
            var input = obj;
        	var checkInputResult = document.getElementById("msg");  
            if(input.trim().length==0){
                  checkInputResult.innerHTML = "输入不能为空";  
                  obj.focus();
            }else{
            	checkInputResult.innerHTML = "";  
            }
        }
</script>

</body>
</html>