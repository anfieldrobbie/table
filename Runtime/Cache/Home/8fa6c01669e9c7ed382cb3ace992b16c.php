<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>food_into</title>
	<link rel="stylesheet" href="/Public/Home/css/common.css">
	<style>
	.foodImg{height: 130px;}
	.foodImg img{height: 100%;width: 100%}
	.foods_num{ top: 5px;left:26px;display: block; width: 16px; height: 16px; border-radius: 50%;background: #ff4040;color: white; text-align: center;line-height: 16px; font-size: 12px; }
	.food_option{padding: 10px; border-bottom: 1px solid #ccc;}
	.food_option p{line-height: 20px;}
	.font-sm{margin:6px 0;}
	.cz_box{top: 36px}
	.food_t{margin-bottom: 0;}
	</style>
</head>
<body>
<div class="title text-center"><a href="javascript:history.go(-1)" class="title-left"><img class="back-btn" src="/Public/Home/img/left.png" width="10" alt=""></a>菜品详情<a href="#" class="title-right"><img class="more" src="/Public/Home/img/more.png" width="15" alt=""></a></div>
  <div class="foodImg">
  	   <img src="<?php echo (get_cover($data["detail_pic"],path)); ?>" alt="">
  </div>
 <div class="food_option relative">
 	<div class="black"><?php echo ($data["name"]); ?></div>
 	<p class="font-sm">销售量:12份</p>
 	<div class="red"><?php echo ($data["prices"]); ?>
 	<div class="cz_box pull-right absolute">
			<a href="javascript:;" class="reduce"><img src="/Public/Home/img/reduce.png" width="25" alt=""></a>
			<span class="key">0</span>
			<a href="javascript:;" class="add"><img src="/Public/Home/img/add.png" width="25" alt=""></a>
		</div>
 	</div>
 </div>
 <div class="food_option black">
 	<div>菜品详情描述</div>
 	<p class="food_t"><?php echo ($data["description"]); ?></p>
 </div> 
 <div class="food_option black">
 	<div>可供选配料搭配（五选二）</div>
 	<p class="food_t"><?php echo ($data["burdening"]); ?></p>
 </div>
<div class="cart_footer absolute">
	<div class="cart_footer_left pull-left relative"><img src="/Public/Home/img/car.png" style="margin: 10px 12px" width="24" alt="">
	<span class="foods_num absolute">4</span>
     <span class="total absolute">总计：$ <span class="total_num">84.00</span></span>
	</div>
	    <?php if($type == 1): ?><a href="<?php echo U('cart/index',array('cart_type'=>1,'shop_id'=>$shop_id));?>" class="cart_footer_right pull-left text-center">点餐完成</a>
    <?php else: ?>
    <a href="<?php echo U('cart/index',array('cart_type'=>2,'shop_id'=>$shop_id));?>" class="cart_footer_right pull-left text-center">点餐完成</a><?php endif; ?>
</div>


<script type="text/javascript" src="/Public/Home/js/zepto.min.js"></script>
<script type="text/javascript" src="/Public/Home/js/touch.js"></script>
<script type="text/javascript" src="/Public/Home/js/xhr.js"></script>
<script type="text/javascript">
getCount()
	$(function(){
    $('.reduce').tap(function(){
        var num=parseInt($(this).siblings('.key').text())
        num>0?$(this).siblings('.key').text(num-1):$(this).siblings('.key').text(0)
        simpleCall(
           "<?php echo U('cart/remove');?>",
          {
            cart_type:<?php echo ($type); ?>,
            id:<?php echo ($data["id"]); ?>,
            shop_id:<?php echo ($shop_id); ?>
           },function(data){
               getCount()
          });
    })
    $('.add').tap(function(){
      var num=parseInt($(this).siblings('.key').text())
      $(this).siblings('.key').text(num+1)
          simpleCall(
           "<?php echo U('cart/add');?>",
          {
            cart_type:<?php echo ($type); ?>,
            id:<?php echo ($data["id"]); ?>,
            shop_id:<?php echo ($shop_id); ?>
           },function(data){
               getCount()
          });
	})
    })
	function getCount(){
       simpleCall(
            "<?php echo U('cart/count');?>",
            {
              feed_type:<?php echo ($type); ?>,
              shop_id:<?php echo ($shop_id); ?>
            },function(data){
              $(".foods_num").html(data.num);
              $(".total_num").html(data.total_prices);
       }); 
}
</script>
</body>
</html>