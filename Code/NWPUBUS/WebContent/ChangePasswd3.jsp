<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <title>找回密码</title>
   <link href="//cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
   <script src="//cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
   <script src="//cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-10 column">
					<img src="photos/aheadFix.png" class="img-responsive" alt="Cinque Terre" width="1000" height="200"/>
				</div>
				<div class="col-md-2 column">
					 <button type="button" class="btn btn-primary btn-block">中文/English</button>
				</div>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-8 column">
					<div class="carousel slide" id="carousel-694237">
						<ol class="carousel-indicators">
							<li class="active" data-slide-to="0" data-target="#carousel-694237">
							</li>
							<li data-slide-to="1" data-target="#carousel-694237">
							</li>
							<li data-slide-to="2" data-target="#carousel-694237">
							</li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img alt="" src="photos/1.jpeg" />
								<div class="carousel-caption">
									<h4>
										First Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="photos/2.jpeg" />
								<div class="carousel-caption">
									<h4>
										Second Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="photos/3.jpg" />
								<div class="carousel-caption">
									<h4>
										Third Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
						</div> <a class="left carousel-control" href="#carousel-694237" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-694237" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
				</div>
				<div class="col-md-4 column">
					<form class="form-horizontal" role="form" action="ChangePasswdServlet" method="post">
						<div class="form-group">
							 <label for="inputSNumber" class="col-md-3 control-label">学号/工号</label>
							<div class="col-md-9">
								<input class="form-control" id="inputSNumber" name="inputid" type="text" value="<%=request.getAttribute("inputid")%>"/>
							</div>
						</div>
						<div class="form-group">
							 <label for="inputPassword3" class="col-md-3 control-label">密码</label>
							<div class="col-md-9">
								<input class="form-control" id="password" type="password" name = "Password" value="<%=request.getAttribute("Password")%>"
								onblur="checkUserUpassword(this.value)"/>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword4" class="col-md-3 control-label">确认密码</label>
							<div class="col-md-9">
								<input class="form-control" id="passwordConfirm" type="password" value="<%=request.getAttribute("passwordConfirm")%>"
								name ="passwordConfirm" onblur="checkUserUrpassword(this.value)"/>
							</div>
						</div>
						<div class="form-group">
							 <label for="inputVertify" class="col-md-3 control-label">验证码</label>
							<div class="col-md-9">
								<input class="form-control" id="inputVertify" type="text" name ="vertify"/>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-3"></div>
							<div class="col-md-9">
							<div><span id="checkUserNameResult" style="color: red "></span>  </div>
							<div id="msg" style="color:red;"></div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-3 column"></div>
							<div class="col-md-4 column">
								<button type="button" onclick="sendmail()" class="btn btn-block btn-primary popover-show">
									发送邮箱验证码
								</button>
							</div>
							<div class="col-md-1 column"></div>
							<div class="col-md-4 column">
								<button type="submit" onclick="docheck()" class="btn btn-block btn-primary popover-show">
									提交
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<p>
				<strong>西北工业大学, Inc.</strong>
				<br>友谊西路<br>
  				<abbr title="Phone">电话:</abbr> (123) 456-7890</address><address>
  				<a href="mailto:#">NorthWesternPolytechnicnicalUniversity@npu.edu.com</a></address>
			</p>
			<p class="text-muted">Copyright © 2018 Northwestern Polytechnical University All Rights Reserved</p>
		</div>
	</div>
</div>

<script type="text/javascript">
	//生成验证码的方法
	function createCode(length) {
		var code = "";
		var codeLength = parseInt(length); //验证码的长度
		var checkCode = document.getElementById("checkCode");
		//所有候选组成验证码的字符，当然也可以用中文的
		var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
			'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
			'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); 
		//循环组成验证码的字符串
		for (var i = 0; i < codeLength; i++){
			//获取随机验证码下标
			var charNum = Math.floor(Math.random() * 62);
			//组合成指定字符验证码
			code += codeChars[charNum];
		}
		if (checkCode){
			//为验证码区域添加样式名
			checkCode.className = "code";
			//将生成验证码赋值到显示区
			checkCode.innerHTML = code;
		}
	}
							
	function sendEmail(){
		var sendAddress=document.document.getElementById("inputEmail");
		//var vertify=createCode(4);  
		location="mailto:fengxq87@126.com?cc=fengxq87@21cn.com&subject=主题&body=邮件内容";
	}								

	//检查验证码是否正确
	function validateCode(){
		//获取显示区生成的验证码
		var checkCode = document.getElementById("checkCode").innerHTML;
		//获取输入的验证码
		var inputCode = document.getElementById("inputCode").value;
		//console.log(checkCode);
		//console.log(inputCode);
		if (inputCode.length <= 0){
			alert("请输入验证码！");
		}
		else if (inputCode.toUpperCase() != checkCode.toUpperCase()){
			alert("验证码输入有误！");
			createCode(4);
		}
		else {
			alert("验证码正确！");
		}        
	} 
</script>
<script>
function test(){
    var password = document.getElementById("password");
    var passwordConfirm = document.getElementById("passwordConfirm");
    if(password.value != passwordConfirm.value)
    	document.getElementById("msg").innerHTML="对不起，您2次输入的密码不一致";
    else
    	document.forms[0].submit();
}
</script>
<script type="text/javascript">
function checkUserUid(obj){
  	var username = obj;
	var checkUserNameResult = document.getElementById("msg");  
	if(username.trim().length==0){
		checkUserNameResult.innerHTML = "学工号不能为空";  
		obj.focus();
	} else {
		checkUserNameResult.innerHTML = "";  
	}
}
</script>
<script type="text/javascript">
function checkUserUpassword(obj){
	var username = obj;
	var checkUserNameResult = document.getElementById("msg");  
	if(username.trim().length==0){
		checkUserNameResult.innerHTML = "密码不能为空";  
		obj.focus();
	} else {
		checkUserNameResult.innerHTML = "";  
	}
}
</script>
<script type="text/javascript">
function checkUserUrpassword(obj){
	var username = obj;
	var checkUserNameResult = document.getElementById("msg");  
	if(username.trim().length==0){
		checkUserNameResult.innerHTML = "请再次输入密码";  
		obj.focus();
	} else {
		var password = document.getElementById("password");
		var passwordConfirm = document.getElementById("passwordConfirm");
		if(password.value != passwordConfirm.value)
			document.getElementById("msg").innerHTML="对不起，您2次输入的密码不一致";
	}
}
</script>
<script>
function sendmail() {
	document.forms.xxxFrom.action="SendVerification";
	document.forms.xxxFrom.submit();
}
</script>


</body>
</html>