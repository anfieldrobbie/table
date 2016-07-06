<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>set_up</title>
	<link rel="stylesheet" href="/Public/Home/css/common.css">
	<style>
  body{
    background-color: #eeeeee;
  }
  #yes-logout,#no-logout{
    border:0;
    background: transparent;
    width: 50%;
    height: 44px; 
    box-sizing: border-box;
    border-top: 1px solid #ccc;
  }
  .btn_group{margin:0 -10px;}
	</style>
</head>
<body>
<div class="title text-center"><a href="javascript:history.go(-1)" class="title-left"><img class="back-btn" src="/Public/Home/img/left.png" width="10" alt=""></a>设置</div>

<div class="body-box" style="background: white;padding-bottom: 0">
   <div class="a_line">
      <a href="<?php echo U('user/changepassword');?>">修改密码 <span class="right-icon"><img src="/Public/Home/img/right.png" width="10" alt=""></span></a>
   </div>
   <div class="a_line">
      <a href="<?php echo U('feedback/index');?>">用户反馈 <span class="right-icon"><img src="/Public/Home/img/right.png" width="10" alt=""></span></a>
   </div>
   <div class="a_line">
      <a href="<?php echo U('user/about');?>">关于go Tablers </a>
   </div>
   <div class="a_line">
      <a href="javascript:;" id="logout">退出当前帐号 </a>
   </div>
</div>


 <!-- 弹出框 -->
  <div class="mask"></div>
  <div class="tip_box giveUp" id="tag-box">
  <div class="black gu-title" id="tag-text"></div>
<div class="remarkBox">
</div>
  <div class="btn_group">
    <button class="pull-left red" id="yes-logout" style="border-right: 1px solid #ccc">Yes</button>
    <button class="pull-left red" id="no-logout">No</button>
  </div>
</div>
<!-- 弹出框 -->

<script type="text/javascript" src="/Public/Home/js/zepto.min.js"></script>
<script type="text/javascript" src="/Public/Home/js/touch.js"></script>
<script type="text/javascript" src="/Public/Home/js/xhr.js"></script>
<script>
  $(function(){
    /*点击退出帐号*/
    $("#logout").tap(function(){
      TagBox("you want to Log out?")
    })
    //no点击
    $("#no-logout").tap(function(){
      $("#tag-box,.mask").hide()
    })
    //yes点击
    $("#yes-logout").tap(function(){
       simpleCall("<?php echo U('login/loginout');?>",{},function(data){
       	     if(data.status==1)
      		 {
      		 	 setTimeout(function(){
      		 	  window.location.href="<?php echo U('login/index');?>";	
      		 	 },1000)  		 	
      		 }
      		 TagBox(data.info);
       })
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