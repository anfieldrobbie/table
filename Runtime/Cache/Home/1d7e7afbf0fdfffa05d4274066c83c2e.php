<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>change_psw</title>
	<link rel="stylesheet" href="/Public/Home/css/common.css">
	<style>
  body{
    background-color: #eeeeee;
  }
	</style>
</head>
<body>
<div class="title text-center"><a href="javascript:history.go(-1)" class="title-left"><img class="back-btn" src="/Public/Home/img/left.png" width="10" alt=""></a>修改密码<a href="javascript:;" class="title-right" id="sub-btn"><img class="back-btn" src="/Public/Home/img/gou.png" width="18" alt=""></a></div>
<div class="body-box" style="background: white;padding-bottom: 0">
<form id="form1" action="" method="post">
  <div class="input_line">
    <input name="old" type="text" placeholder="输入旧密码" id="old_psw">
  </div>
    <div class="input_line">
    <input name="password" type="text" placeholder="输入新密码    6-20位数字、字母组合" id="new_psw">
  </div>
    <div class="input_line" style="border:0">
    <input name="repassword" type="text" placeholder="确认新密码" id="new_psw2">
  </div>
</form>  
</div>

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
<script>
  $(function(){
   //正则
   var psw_reg=/^[0-9A-Za-z]{6,}$/
   var psw_reg2=/^[a-zA-z0-9\u4E00-\u9FA5]*$/

    /*点击提交*/
    $("#sub-btn").tap(function(){
      if(!$("#old_psw").val()){
        TagBox("Old password can’t be empty")
        return false
      }else if(!$("#new_psw").val()){
        TagBox("New password can’t be empty")
        return false
      }else if(!psw_reg2.test($("#new_psw").val())){
        TagBox("password can‘t contain space or special characters")
        return false
      }else if(!psw_reg.test($("#new_psw").val())){
        TagBox("password needs to be at least 6 characters")
        return false
      }else if(!$("#new_psw2").val()){
        TagBox("Confirm password can’t be empty")
        return false
      }else if($("#new_psw").val()!=$("#new_psw2").val()){
        TagBox("Passwords do not match")
        return false
      }else{
        //
        $.post("<?php echo U('Login/submitPassword');?>",$("#form1").serialize(),function(data){
        	  if(data.status===1)
        	  {
        	  	TagBox(data.info);
        	  	window.location.href = "<?php echo U('User/member');?>";
        	  }
        	  else
        	  {
        	  	  TagBox(data.info);
        	  }
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