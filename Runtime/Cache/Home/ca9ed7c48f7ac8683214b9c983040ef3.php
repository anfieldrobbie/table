<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>register</title>
	<link rel="stylesheet" href="/Public/Home/css/common.css">
	<style>
      body{
      	background: url(/Public/Home/img/login_bg.jpg) no-repeat;
      	background-size: cover;
      }
	</style>
</head>
<body>
<div class="back"><a href="javascript:history.go(-1)">返回</a></div>
  <div class="login text-center"><img src="/Public/Home/img/logo.png" width="70" alt=""></div>
  <form action="" id="form-login">
  <div class="form-box">
        <div class="login-input"><span class="icon" style="top:12px"><img src="/Public/Home/img/head.png" width="25" alt=""></span>
      <input name="username" type="text" id="name" class='input_text' placeholder="Name">
    </div>
    <div class="login-input"><span  class="icon"><img src="/Public/Home/img/name.png" width="25" alt=""></span>
     <input name="mobile" type="text" id="phone" class='input_text' placeholder="Telphone">
  </div>
          <div class="login-input"><span class="icon"><img src="/Public/Home/img/psw.png" width="25" alt=""></span>
      <input name="password" type="password" id="psw" class='input_text' placeholder="Password">
    </div>
    <div class="login-input" style="position: relative;"><span class="icon" style="top:12px;"><img src="/Public/Home/img/pao.png" width="25" alt=""></span>
                <input name="verify" type="text" id="yzm" class='input_text' placeholder="请输入验证码">
                <input type="button" id="yzm-btn" value="获取验证码">
            </div>
   <div class="form-btn"><input type="button" id="sub-btn"></div>
  	</div>
  </form>
  <div class="bottom-text text-center"><img src="/Public/Home/img/bottom.png" width="90%" alt=""></div>

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
<script>
  $(function(){
  /*正则*/
   var phone_reg=/^1\d{10}$/
   var email_reg=/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/
   var psw_reg=/^[0-9A-Za-z]{6,}$/
   var psw_reg2=/^[a-zA-z0-9\u4E00-\u9FA5]*$/
    
    /*表单提交*/
    $("#sub-btn").tap(function(){
      if(!$("#name").val()){
        TagBox("Please enter your name")
        return false
      }else if(!$("#phone").val()){
        TagBox("Please enter your Telphone")
        return false
      }else if(!phone_reg.test($("#phone").val())){
        TagBox("Please enter a valid phone number")
        return false
      }else if(!$("#psw").val()){
         TagBox("Please enter password")
         return false
      }
//    else if(!psw_reg2.test($("#psw").val())){
//       TagBox("Password can't contain space or special characters")
//       return false
//    }else if(!psw.test($("#psw").val())){
//       TagBox("Password needs to be at least 6 characters")
//       return false
//    }else if(!$("#yzm").val()){
//       TagBox("Verification Code incorrect. Please try again")
//       return false  
//    }
    else{
         simpleCall("<?php echo U('Login/reg');?>",$('#form-login').serialize(),function(data){
      		 if(data.status==1)
      		 {
      		 	 setTimeout(function(){
      		 	  window.location.href="<?php echo U('login/index');?>";	
      		 	 },1000)  		 	
      		 }
      		TagBox(data.info);
      	})
      }
    })

         /*获取验证码*/
            $("#yzm-btn").tap(function () {
                if (!$("#phone").val()) {
                    TagBox("Please enter your Telphone")
                    return false
                } else if (!phone_reg.test($("#phone").val())) {
                    TagBox("Please enter a valid phone number")
                    return false
                }
                $(this).css({
                    "border": "1px solid green",
                    "color":"green"
                })
                $.post("<?php echo U('Login/verify');?>",{"number":$("#phone").val()},function(data){
//              	 if(data.status===1)
//              	 {
//              	 	alert("距离上次获取验证码时间过短");
//              	 }
                })
                $(this).val("重新获取(120)s")
                var time = 120
                setInterval(function () {
                    time > 0 ? time-- : time = 0
                    $("#yzm-ban").attr("value","重新获取(" + time + ")s")
                }, 1000)
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