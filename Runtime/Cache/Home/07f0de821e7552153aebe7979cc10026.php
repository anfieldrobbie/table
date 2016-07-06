<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>wm_list</title>
	<link rel="stylesheet" href="/Public/Home/css/common.css">
	<style>
  body{
    background-color: #eeeeee;
  }
  .right-icon{right: 10px;top: 27px;}
	</style>
</head>
<body>
<div class="title text-center"><a href="<?php echo U('user/member');?>" class="title-left"><img class="back-btn" src="/Public/Home/img/left.png" width="10" alt=""></a>外卖<a href="#" class="title-right"></a></div>
<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="hall_list relative">
<a href="<?php echo U('takeaway/detail',array('tid'=>$vo['tid']));?>">
    <div class="hall_list_l pull-left"><img src="<?php echo (get_cover($vo["pic"],path)); ?>" alt=""></div>
  <div class="hall_list_r pull-left"><p><?php echo ($vo["name"]); ?></p><p><?php echo (date('Y-m-d h:m:s',$vo["create_time"])); ?></p><p class="status orange"><?php echo (gettakeawaystatus($vo["takeaway_status"])); ?></p></div>
  <span class="pull-right absolute right-icon"><img src="/Public/Home/img/right.png" width="15" alt=""></span>
</a>
</div><?php endforeach; endif; else: echo "" ;endif; ?>

<script type="text/javascript" src="/Public/Home/js/zepto.min.js"></script>
<script type="text/javascript" src="/Public/Home/js/touch.js"></script>
<script type="text/javascript" src="/Public/Home/js/common.js"></script>
<script>
	$(function(){

	})
</script>
</body>
</html>