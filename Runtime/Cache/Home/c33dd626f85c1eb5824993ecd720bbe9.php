<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>index</title>
	<link rel="stylesheet" href="/Public/Home/css/common.css">
	
	<style>
	</style>
</head>
<body>

<div class="user_head relative">
	<div class="user_img"><img src="/Public/Home/img/head.jpg" width="70" alt=""><p style="color: white"><?php echo ($data["username"]); ?></p></div>
	<div class="link_l absolute">
		<a class="link_a text-center" href="<?php echo U('order/index');?>" style="border-right: 1px solid rgba(255,255,255,.4)">餐厅</a><a class="link_a text-center" href="<?php echo U('takeaway/index');?>">外卖</a>
	</div>
</div>
<div class="option">
   <div class="a_line">
      <a href="<?php echo U('message/index');?>"><img src="/Public/Home/img/ka2.png" width="22" alt="">系统消息 </a>
   </div>
      <div class="a_line">
      <a href="<?php echo U('user/setting');?>"><img src="/Public/Home/img/ka4.png" width="22" alt="">设 置 </a>
   </div>
</div>

<div class="footer_nav_box">
	<div class="footer_nav">
		<a href="<?php echo U('index/index');?>">
		<?php if($toolbar == 1): ?><img src="/Public/Home/img/home2.png" height="20" alt="">
		<?php else: ?>
	   <img src="/Public/Home/img/home.png" height="20" alt=""><?php endif; ?>	
			<div class="nav_name" <?php if($toolbar == 1): ?>style="color: #ff4040"<?php endif; ?> >首页</div>
		</a>
	</div>
	<div class="footer_nav">
		<a href="<?php echo U('find/index');?>">
		    <?php if($toolbar == 2): ?><img src="/Public/Home/img/find.png" height="20" alt="">
		    <?php else: ?>
	        <img src="/Public/Home/img/find2.png" height="20" alt=""><?php endif; ?>	
			<div class="nav_name" <?php if($toolbar == 2): ?>style="color: #ff4040"<?php endif; ?>>发现</div>
		</a>
	</div>
	<div class="footer_nav">
		<a href="<?php echo U('user/member');?>">
			<?php if($toolbar == 3): ?><img src="/Public/Home/img/name.png" height="20" alt="">
		    <?php else: ?>
	        <img src="/Public/Home/img/user.png" height="20" alt=""><?php endif; ?>
			<div class="nav_name" <?php if($toolbar == 3): ?>style="color: #ff4040"<?php endif; ?>>我的</div>
		</a>
	</div>
</div>
<script type="text/javascript" src="/Public/Home/js/zepto.min.js"></script>
<script type="text/javascript" src="/Public/Home/js/touch.js"></script>
<script type="text/javascript" src="/Public/Home/js/common.js"></script>

</body>
</html>