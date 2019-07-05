<!doctype html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="IE=edge,chrome=1" />
<meta name="renderer" content="webkit" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="cas" />
<title>西北工业大学-翱翔门户</title>

<!-- icon -->
<link rel="shortcut icon" href="/cas/assets/favicon.ico"/> <!-- -->
<link href="assets/deps/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="assets/deps/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- 主样式CSS -->
<link rel="stylesheet" type="text/css" href="css/login.css">



<!-- JavaScript -->
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/slide.js" type="text/javascript"></script>
<script src="assets/deps/bootstrap-3.3.5-dist/js/bootstrap.min.js" type="text/javascript"></script>

</head>
<body>
	<!-- header -->
	<div class="app-header">
		<div class="app-logo">
			<img src="images/default/login/app-logo.png" width="50%">
			<a href="#" class="hide en">EN</a>
			<a href="#" class="hide ch active">中</a>
		</div>
	</div>
	<div class="header">
		<div class="header-bot-box">
			<div class="header-bot">
				<div class="login-logo">
					<table>
						<tr>
							<td valign="bottom">
								<img src="images/default/login/logo.png">
							</td>
						</tr>
					</table>
				</div>
				
			</div>
		</div>
	</div>

	<!-- 轮转banner -->
	<div class="slides">
		<div class="slideInner">
			
				
				
					<a href="#"
						style="background: url(https://portalfiles.nwpu.edu.cn/resources/attachment/4/1557136971674_f481141c-bed0-8899-33bd-0e2f538cd4f1.jpg) no-repeat;">
						<div class="moveElem img1" rel="150,easeInOutExpo"></div>
					</a>
				
			
			
				
				
					<a href="#"
						style="background: url(https://portalfiles.nwpu.edu.cn/resources/attachment/4/1557137354325_8bd60c2c-68e9-703d-9cec-e81d225ea5e6.jpg) no-repeat">
						<div class="moveElem img2" rel="0,easeInOutExpo"></div>
					</a>
				
			
			
				
				
					<a href="#"
						style="background: url(https://portalfiles.nwpu.edu.cn/resources/attachment/4/1557136847257_945219fb-453c-b8d2-eabb-4792c7a38d1e.jpg) no-repeat;">
						<div class="moveElem img3" rel="300,easeInOutExpo"></div>
					</a>
				
			
		</div>
		<div class="nav">
			<a class="prev" href="javascript:;"></a> <a class="next"
				href="javascript:;"></a>
		</div>

		<div class="banner"></div>
		<div class="login">
			<div class="login-box">
				<div class="login-bag">
					<a href="#" class="change-ewm-btn" style="display:none"></a>
					<a href="#" class="change-acount-btn" style="display:none"></a>

					<div class="acount-box">
						<p class="login-bag-title">使用用户名密码登录</p>
						<form id="form1" class="fm-v clearfix" action="/cas/login?service=https%3A%2F%2Fecampus.nwpu.edu.cn%2Fc%2Fportal%2Flogin%3Fredirect%3D%252Fc" method="post">
							<div class="input-box">
								<input type="text" name="username" id="username" placeholder="请输入您的学/工号" class="login-username">
								<div class="hide error-box" style="right:-62px">
									<span class="fa fa-minus-circle"></span> 帐号不存在
								</div>
							</div>
							<div class="input-box">
								<input type="password" name="password" id="password" placeholder="请输入您的密码" class="login-password">
								<div class="hide error-box" style="right:-48px"><span class="fa fa-minus-circle"></span> 密码错误</div>
							</div>
							<div class="input-box login-yzm-box" id="imageCode">
								<img src="/cas/codeimage" class="login-yzm-box-img" onclick="this.src='/cas/codeimage?'+Math.floor(Math.random()*100)">
								<input type="text" name="imageCodeName" id="imageCodeName" placeholder="请输入验证码" class="login-yzm">
								<div class="hide error-box" style="right:-62px"><span class="fa fa-minus-circle"></span> 验证码错误</div>
								<input id="errors" name="errors" type="hidden" value="0"/>
							</div>

							<div class="login-submit-box">
								<button type="submit" class="submit_button" onclick="return checkInput();">登 录</button>
								<!-- <span>帐号不存在!10分钟后自动解锁。</span>-->
								<div class="clear-2"></div>
								<div class="other-login-type">
									<div class="pull-left" style="line-height:40px;">使用其它认证</div>
									<div class="pull-right">
										<img id="qqLoginButton" src="images/default/login/qq-icon.png" style="cursor:pointer">&nbsp;&nbsp;
										<img id="wxLoginButton" src="images/default/login/wx-icon.png" style="cursor:pointer">
									</div>
								</div>

								<p class="login-submit-box-forget">
									<a href="https://uis.nwpu.edu.cn/uid/activate?request_locale=zh_CN">账号激活</a>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="https://uis.nwpu.edu.cn/uid/forget?request_locale=zh_CN">忘记密码？</a>
								</p>

								<div class="errorInfo text-center" id="errorInfo">
									
									
								</div>
							</div>

							<input type="hidden" name="lt" value="_c76E689F1-9D92-DCDC-08C6-21A580EF3201_k7F81E9DA-F63E-92A3-3269-C6329CE508CB"/>
							<input type="hidden" name="_eventId" value="submit" />
						</form>
					</div>
					<div class="ewm-box">
						<img src="images/default/login/erweima.jpg">
					</div>

				</div>
			</div>
		</div>
	</div>



	<!-- footer -->
	<div class="app-footer">
		CopyRight ©2018 西北工业大学<br>联系电话：029-88888888
	</div>


	<div class="footer">
		<div class="grid">
			<div class="pull-left">
				<!-- <a href="#"><span class="yyjr-icon"></span> 应用接入列表</a>
				<a href="#"><span class="xnwz-icon"></span> 校内常用网站</a>
				<a href="#"><span class="gzh-icon"></span> 公众号与APP</a> -->
				<a href="accountActivate.jsp" target="_blank"><span class="yyjr-icon"></span> 账号激活攻略</a>
				<a href="findpassword.jsp" target="_blank"><span class="xnwz-icon"></span> 密码找回攻略</a>
			</div>
			<div class="pull-right">
				建议浏览器：
				<a><img src="images/default/login/ie-icon.png" title="IE"></a>&nbsp;&nbsp;
				<a><img src="images/default/login/chrome-icon.png" title="Chrome"></a>&nbsp;&nbsp;
				<a><img src="images/default/login/firefox-icon.png" title="FireFox"></a>&nbsp;&nbsp;
				<a><img src="images/default/login/360-icon.png" title="360浏览器"></a>&nbsp;&nbsp;
				<a><img src="images/default/login/sogou-icon.png" title="SouGou"></a>
			</div>
			<div class="clear-1"></div>

			<div style="color:#a0a0a0">信息中心服务电话：88491717&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电邮：help@nwpu.edu.cn&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QQ群：540478672
				<br>
				Copyright © 2018 Northwestern Polytechnical University All Rights Reserved</div>


		</div>
	</div>


<script type="text/javascript">
(function(window, $, undefined) {
	/*
	 * tab切换插件
	 * 用例：$('*').createTab();
	 */
	$.fn.createTab = function(opt) {
		var def = {
			activeEvt: 'mouseover',
			activeCls: 'cur'
		}
		$.extend(def, opt);
		this.each(function() {
			var $this = $(this);
			var timer;
			$this.find('ul.title li').mouseover(def.activeEvt, function() {
				var index = $(this).index(),
					that = $(this);
				timer = setTimeout(function() {
					that.addClass('cur').siblings().removeClass('cur');
					$this.find('div.list').animate({
						marginLeft: -860 * index
					}, 'slow');
				}, 500);
			}).mouseout(function() {
				clearTimeout(timer);
			})
		});
	}

})(window, jQuery);
$(function() {
	$(".jyTable").createTab();
	/* $('.bs-example-modal-lg').modal({}); */
	$(".change-ewm-btn").click(function() {
		$(".acount-box").hide();
		$(this).hide();
		$(".ewm-box").show();
		$(".change-acount-btn").show();
	});
	$(".change-acount-btn").click(function() {
		$(".acount-box").show();
		$(".ewm-box").hide();
		$(this).hide();
		$(".change-ewm-btn").show();
	});
})
</script>

<script>
	$('#username').focus();
	if ($('#username').val() != "") {
		$('#password').focus();
	}

	var errors = 0;
	var errorTimes = -1;

	function checkInput() {
		var username = document.getElementById("username");
		var password = document.getElementById("password");
		var yzm = document.getElementById("imageCodeName");
		if (username.value==""||username==null) {
			//alert("请输入登录名！");
			document.getElementById('errorInfo').innerHTML='<span>账号不存在！</span>';
			return false;
		}

		if (password.value==""||password==null) {
			//alert("请输入密码！");
			document.getElementById('errorInfo').innerHTML='<span>密码错误！</span>';
			return false;
		}
		
		if (errorTimes == -1 || errors < errorTimes) { 
				
		} else if (yzm.value==""||yzm==null) {
			//alert("请输入验证码！");
			document.getElementById('errorInfo').innerHTML='<span>验证码错误！</span>';
			return false;
		}	 

		return true;
	}
	function checkImageCodeDisplay() {
		if (errorTimes == -1 || errors < errorTimes) {
			document.getElementById("imageCode").style.display = "none";
		} else {
			document.getElementById("imageCode").style.display = "";
		}
	}
	checkImageCodeDisplay();
</script>


<script type="text/javascript">
  (function (window, $, undefined) {
    //
    // tab切换插件
    // 用例：$('*').createTab();
    //
    
    $.fn.createTab = function (opt) {
      var def = {
        activeEvt: 'mouseover',
        activeCls: 'cur'
      }
      $.extend(def, opt);
      this.each(function () {
        var $this = $(this);
        var timer;
        $this.find('ul.title li').mouseover(def.activeEvt,function(){
          var index = $(this).index(),
            that = $(this);
          timer = setTimeout(function(){
            that.addClass('cur').siblings().removeClass('cur');
            $this.find('div.list').animate({marginLeft:-860*index},'slow');
          },500);
        }).mouseout(function(){
          clearTimeout( timer );
        })
      });
    }
  })(window, jQuery);

  $(function() {
    var sw = $(document.body).width();
    var sh = $(document.body).height();
    var hh = $(".header").outerHeight();
    var bh = $(".slides").outerHeight();

    var k = 0.618;

    if (((sh - bh) * (1 - k)) > 115) {
      hh = (sh - bh) * (1 - k);
    } else {
      hh = 115;
    }
    $(".header").css("height", hh);
    //$(".login-logo").css("line-height",hh+"px");

    $(".jyTable").createTab();
    $('.bs-example-modal-lg').modal({});
    $(".change-ewm-btn").click(function() {
      $(".acount-box").hide();
      $(this).hide();
      $(".ewm-box").show();
      $(".change-acount-btn").show();
    });
    $(".change-acount-btn").click(function() {
      $(".acount-box").show();
      $(".ewm-box").hide();
      $(this).hide();
      $(".change-ewm-btn").show();
    });
  })

  $(window).resize(function() {
    var sw = $(document.body).width();
    var sh = $(document.body).height();
    var hh = $(".header").outerHeight();
    var fh = $(".footer").outerHeight();
    var bh = $(".slides").outerHeight();
    var k = 0.618;
    if (((sh - bh) * (1 - k)) > 115) {
      hh = (sh - bh) * (1 - k);
    } else {
      hh = 115;
    }
    $(".header").css("height", hh);
  });
</script>

<!-- 轮播功能 -->
<script type="text/javascript">
	$(document).ready(function() {
		// 超过1张背景图片时启用轮播功能
		if ($(".slideInner a").length > 1) {
			$(".slideInner").slide({
				slideContainer : $('.slideInner a'),
				effect : 'easeOutCirc',
				autoRunTime : 5000,
				slideSpeed : 1000,
				nav : true,
				autoRun : true,
				prevBtn : $('a.prev'),
				nextBtn : $('a.next')
			});
		}
	});
</script>

<!-- QQ、微信登录 -->
<script type="text/javascript">
$(function(){

	var wxAppid = "wx1579e5a7bba2da75";
	var wxBaseUrl = "https://open.weixin.qq.com/connect/qrconnect?appid="+wxAppid+"&response_type=code&scope=snsapi_login&state=&redirect_uri=";
	var wxCallbackUrl = "https://uis.nwpu.edu.cn/cas/wechatLogin?service=aHR0cHM6Ly9lY2FtcHVzLm53cHUuZWR1LmNuL2MvcG9ydGFsL2xvZ2luP3JlZGlyZWN0PSUyRmM%3D";
	var wxUrl = wxBaseUrl + encodeURIComponent(wxCallbackUrl);

	$("#wxLoginButton").click(function(e){
		e.preventDefault();

		window.location.href = wxUrl;
	});

	var qqClientId = "101503399";
	var qqBaseUrl = "https://graph.qq.com/oauth2.0/authorize?response_type=code&client_id="+qqClientId+"&state=qqlogin&redirect_uri=";
	var qqCallbackUrl = "https://uis.nwpu.edu.cn/cas/qqLogin?service=aHR0cHM6Ly9lY2FtcHVzLm53cHUuZWR1LmNuL2MvcG9ydGFsL2xvZ2luP3JlZGlyZWN0PSUyRmM%3D";
	var qqUrl = qqBaseUrl + encodeURIComponent(qqCallbackUrl);

	$("#qqLoginButton").click(function(e){
		e.preventDefault();

		window.location.href = qqUrl;
	});
});
</script>
</body>
</html>