<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>login</title>
	<link rel="stylesheet" href="/Public/Home/css/common.css">
	<style>
      body{
      	background: url(/Public/Home/img/login_bg.jpg) no-repeat;
      	background-size: cover;
      }
      .facebook a{
          color: #FFF;
          text-align: center;
      }
	</style>
</head>
<body>
  <div class="login text-center"><img src="/Public/Home/img/logo.png" width="70" alt=""></div>
  <form  action="<?php echo U('login/loginin');?>" id="form-login" method="post">
  	<div class="login-input"><span class="icon"><img src="/Public/Home/img/name.png" width="25" alt=""></span>
      <input value="13018473858" name="name" type="text" id="name" class='input_text' placeholder="Telphone/e-mail">
  	</div>
  	<div class="login-input"><span  class="icon"><img src="/Public/Home/img/psw.png" width="25" alt=""></span>
     <input value="123123" name="password" type="password" id="psw" class='input_text' placeholder="Password">
  	</div>
  	<div class="sub"><input type="button" value="Sign in" id="sign_in" class="sub-btn"></div>
  	<div class="text-center" style="margin-top: 15px;"><a href="<?php echo U('login/forget');?>"" style="color:white;font-size: 12px;">Forgot password?</a></div>
  	<p class="line"></p>
  	<div class="text-center" style="color: white;font-size: 12px"><a href="<?php echo U('login/register');?>" style="color: white">New here? Sign Up</a></div>
       	<div id="fb-btn" class="facebook login-input" style="text-align:center;line-height: 50px"><span class="icon"><img src="/Public/Home/img/f.png" width="14" alt=""></span><?php echo ($fb_url); ?></div>
  </form>

  <!-- 弹出框 -->
  <div class="mask"></div>			
  <div class="tip_box giveUp" id="tag-box">
	<div class="black gu-title" id="tag-text"></div>
<div class="remarkBox">
</div>
	<div class="btn_group">
		<button class="pull-left red" id="cancel-btn">I know</button>
	</div>
</div>
<!-- 弹出框 -->
  

 <script type="text/javascript" src="/Public/Home/js/zepto.min.js"></script>
<script type="text/javascript" src="/Public/Home/js/touch.js"></script>
<script type="text/javascript" src="/Public/Home/js/xhr.js"></script>
<!--<script>
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/zh_CN/sdk.js#xfbml=1&version=v2.6&appId=1131524456871118";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>	-->
<script>  
$(function(){
   /*正则*/
   var phone_reg=/^1\d{10}$/
 
  /*点击登录*/
  $('#sign_in').tap(function(){
      if(!$("#name").val()){
           TagBox("Please enter your account")
          return false
      }else if(!phone_reg.test($("#name").val())){
      	TagBox("Please enter a valid phone number")
      	return false
      }else if(!$("#psw").val()){
      	 TagBox("Please enter Password")
      	 return false
      }else{
      	//这里就是ajax提交的部分
      	simpleCall("<?php echo U('Login/loginin');?>",$('#form-login').serialize(),function(data){
      		 if(data.status==1)
      		 {
      		 	 setTimeout(function(){
      		 	  window.location.href="<?php echo U('Index/index');?>";	
      		 	 },1000)  		 	
      		 }
      		TagBox(data.info);
      	})
      }


  })

  //弹出框函数
  function TagBox(text){
      $("#tag-text").text(text)
      $("#tag-box,.mask").show()
      var h=$("#tag-box").height()/2
      $("#tag-box").css("margin-top",-h)
  }
  //弹出框关闭
  $("#cancel-btn").tap(function(){
  	$("#tag-box,.mask").hide()
  })
})
</script>
</body>
</html>