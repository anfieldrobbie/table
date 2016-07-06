<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="<?php echo ($data["name"]); ?> - <?php echo ($data["address"]); ?>" />
	<title>table</title>
	<link rel="stylesheet" href="/Public/Home/css/common.css">
	<style>
	.footer_btn a{ color: white; }
	.tip-box{top: 50px; display: none; z-index: 1111;}
	.mask_in{display: none; z-index: 1111;}
	</style>
</head>
<body>
<div class="title text-center"><a href="<?php echo U('index/index');?>" class="title-left"><img class="back-btn" src="/Public/Home/img/left.png" width="10" alt=""></a><?php echo ($data["name"]); ?><a href="#" class="title-right"><img class="more" src="/Public/Home/img/more.png" width="15" alt=""></a></div>
<div class="body-box max-g">
  <div class="restaurant_img">
  	   <img src="<?php echo (get_cover($data["detail_pic"],path)); ?>" width="100%" alt="">
  </div>
  <p class="line_g"></p>
  <div class="info_list">营业时间：<?php echo ($data["time"]); ?></div>
  <div class="info_list">优惠信息：<?php echo ($data["discount"]); ?></div>
  <div class="info_list">商家电话：<span class="green"><?php echo ($data["contract_tel"]); ?></span></div>
  <div class="info_list">推荐停车场：<?php echo ($data["carpark"]); ?></div>
  <div class="info_list">餐厅位置：<?php echo ($data["address"]); ?></div>
</div>
<div class="footer_btn"><a class="a_block" href="#">进入菜单</a></div>
<div class="mask"></div>
<div class="mask2"></div>
<div class="mask_in">
    <a href="<?php echo U('goods/index',array('feed_type'=>2,'shop_id'=>$data['id']));?>" class="pull-left"><img src="/Public/Home/img/wm.png" width="80" alt=""><p class="text-center gi">外卖</p></a>
	<a href="<?php echo U('goods/index',array('feed_type'=>1,'shop_id'=>$data['id']));?>" class="pull-right"><img src="/Public/Home/img/ct.png" width="80" alt=""><p class="text-center gi">餐厅</p></a>
</div>
<div class="tip-box">
		<p class="ding"></p>
		<a href="#" id="coll" class="coll block">
			<img src="/Public/Home/img/collection.png" height="16" alt=""> 收藏
		</a>
		<a href="#" class="share block -mob-share-open">
			<img src="/Public/Home/img/share.png" height="16" alt=""> 分享
		</a>
</div>
<div class="-mob-share-ui" style="display: none">
    <ul class="-mob-share-list">
        <li class="-mob-share-weibo"><p>新浪微博</p></li>
        <li class="-mob-share-tencentweibo"><p>腾讯微博</p></li>
        <li class="-mob-share-qzone"><p>QQ空间</p></li>
        <li class="-mob-share-qq"><p>QQ好友</p></li>
        <li class="-mob-share-renren"><p>人人网</p></li>
        <li class="-mob-share-kaixin"><p>开心网</p></li>
        <li class="-mob-share-douban"><p>豆瓣</p></li>
        <li class="-mob-share-facebook"><p>Facebook</p></li>
        <li class="-mob-share-twitter"><p>Twitter</p></li>
    </ul>
    <div class="-mob-share-close">取消</div>
</div>
<div class="-mob-share-ui-bg"></div>
<script id="-mob-share" src="http://f1.webshare.mob.com/code/mob-share.js?appkey=13949da52c640"></script>
<script type="text/javascript" src="/Public/Home/js/zepto.min.js"></script>
<script type="text/javascript" src="/Public/Home/js/touch.js"></script>
<script type="text/javascript" src="/Public/Home/js/common.js"></script>
<script type="text/javascript">
	$(function(){
		$('.title-right').tap(function(){
			$('.mask2,.tip-box').show();
		})
		$('.mask2').tap(function(){
			$('.mask2,.tip-box').hide()
		})

		//收藏点击
		$('#coll').tap(function(){
			if($(this).hasClass("coll")){
				$(this).find('img').attr("src","/Public/Home/img/star1.png");
				$(this).removeClass("coll");
				var shopid = "<?php echo ($data["id"]); ?>";
				$.post("<?php echo U('like/add');?>",{id:shopid},function(data){
					
				})
			}else{
				$(this).find('img').attr("src","/Public/Home/img/collection.png")
				$(this).addClass("coll")
			}
			
		})
	})
</script>
</body>
</html>