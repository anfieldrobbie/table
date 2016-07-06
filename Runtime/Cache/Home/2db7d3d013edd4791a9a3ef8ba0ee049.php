<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>feedback</title>
	<link rel="stylesheet" href="/Public/Home/css/common.css">
	<style>
  body{
    background-color: #eeeeee;
  }
	</style>
</head>
<body>
<div class="title text-center"><a href="javascript:history.go(-1)" class="title-left"><img class="back-btn" src="/Public/Home/img/left.png" width="10" alt=""></a>和我们聊聊<a href="javascript:;" id="sub-btn" class="title-right"><img class="back-btn" src="/Public/Home/img/gou.png" width="18" alt=""></a></div>
<div class="body-box">
    <form id="form1" action="<?php echo U('Feedback/add');?>" method="post">
  <textarea name="description" id="fb_text" placeholder="欢迎提出您的意见"></textarea>
  <input type='hidden' name='create_time' value='<?php echo time(); ?>'>
    <span class="ban_num"><label class="now_num">0</label>/200</span>
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
<script type="text/javascript" src="/Public/Home/js/common.js"></script>
<script>
	$(function(){
    /*键入是计算字符长度*/
		$('#fb_text').keyup(function(){
            var len=getByteLen($(this).val())
            if(len<200){
            	$('.now_num').text(len)
            }else{
            	$('.now_num').text(200)
            }    
		})

    /*点击提交*/
    $("#sub-btn").tap(function(){
      if(!$("#fb_text").val()){
        TagBox("Feedback can’t be empty")
        return false
      }else if(getByteLen($("#fb_text").val())>200){
        TagBox("Feedback words can not be more than 200")
        return false
      }else{
        //格式正确跳转
        $('#form1').submit();
      }
    })

  //获取字符串长度（汉字算两个字符，字母数字算一个）
    function getByteLen(val) {
      var len = 0;
      for (var i = 0; i < val.length; i++) {
        var a = val.charAt(i);
        if (a.match(/[^\x00-\xff]/ig) != null) {
          len += 2;
        }
        else {
          len += 1;
        }
      }
      return len;
    }

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