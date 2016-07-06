<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>take_order_detail2</title>
	<link rel="stylesheet" href="/Public/Home/css/common.css">
	<style>
    .f_name{
    	border-bottom: 1px solid #ccc;
    }
    .gi img{margin-right: 5px;}
    .take_food{padding: 10px; border-bottom: 1px solid #ccc;}
    .take_food img{float: left; margin-right:10px; margin-top: -2px;}
        .btn_group{
    	border-top: 1px solid #ccc;
    	height: 44px;
    	margin: 0 -10px
    }
    .btn_group button{
    	width: 50%;
    	height: 100%;
    	border:0;
    	background: transparent;
    	box-sizing: border-box;
    }
    .tag{ display: inline-block;height: 25px; margin-right:2px;line-height: 25px;padding: 0 5px; font-size: 12px; border-radius: 4px;}
    .ban_num{color: #999; right: 3px;}
    .cart_footer>a{right: 0;top: 0}
    .cart_footer_left{width: 100%}
        .f_name{
    	border-bottom: 1px solid #ccc;
    }
    .gi img{margin-right: 5px;}
    .take_food{padding: 10px; border-bottom: 1px solid #ccc;}
    .take_food img{float: left; margin-right:10px; margin-top: -2px;}
        .order_mask{
    	width: 100%;
    	background: rgba(0,0,0,.5);
    	position: absolute;
    	top: 0;
    	left: 0;
    	z-index: 1111;
    	display: none;
    }
    .btn_group{height: 44px;margin:0 -10px; border-top: 1px solid #ccc;}
    .tip_input img{margin-right: 10px;}
    .btn_group button{    	width: 100%;
    	height: 100%;
    	border:0;
    	background: transparent;
    	box-sizing: border-box;}
	</style>
</head>
<body>
<div class="title text-center"><a href="<?php echo U('order/index');?>" class="title-left"><img class="back-btn" src="/Public/Home/img/left.png" width="10" alt=""></a>订单详情<a href="tel:<?php echo ($data["contract_tel"]); ?>" class="title-right"><img class="back-btn" src="/Public/Home/img/phone.png" width="20" alt=""></a></div>
<div class="h-box relative">
<div class="f_name text-center">
	<p style="font-size: 16px; color: #333"><?php echo ($data["name"]); ?></p>
	<p style="font-size: 12px; color: #ffac40" class="gi">
		<?php if($data["status"] == 2): if($data["pay_status"] == 0): ?>等待支付
		<?php else: ?>
		<?php echo (getorderstatus($data["status"])); endif; ?>
		<?php else: ?>
		<?php echo (getorderstatus($data["status"])); endif; ?>
	</p>
</div>
<div class="take_food">
	<img src="/Public/Home/img/tig.png" width="20" alt="">
	<?php echo ($data["order_description"]); ?>
</div>
<?php if(is_array($goods)): $i = 0; $__LIST__ = $goods;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="order_t">
	<div class="hei"><div class="pull-left"><?php echo ($vo["goods_name"]); ?></div><div class="pull-right"><?php echo ($vo["goods_prices"]); ?></div><div class="pull-right red" style="margin-right: 50px;"><?php echo ($vo["num"]); ?></div></div>
	<div class="sao"><?php echo ($vo["burdening"]); ?></div>
</div><?php endforeach; endif; else: echo "" ;endif; ?>
<div class="total_order relative">
	<div class="total_order_into"><span class="pull-left">订单号:<?php echo ($data["order_num"]); ?></span><span class="pull-right"><?php echo (date('Y-m-d h:m:s',$data["create_time"])); ?></span></div>	
	<!--<div class="total_order_into"><span class="pull-left">Subtotal</span><span class="pull-right">$35.00</span></div>	
	<div class="total_order_into"><span class="pull-left">Subtotal</span><span class="pull-right">$35.00</span></div>	
	<div class="total_order_into"><span class="pull-left">Tax</span><span class="pull-right">$35.00</span></div>	
	<div class="total_order_into"><span class="pull-left">Service Tip</span><span class="pull-right">$35.00</span></div>	-->
	<div class="total_order_into"><span class="pull-left">Total</span><span class="pull-right">$<?php echo ($data["prices"]); ?></span></div>
</div>
</div>
<?php if($data["status"] == 2): if($data["pay_status"] == 1): ?><a href="<?php echo U('order/changestatus',array('id'=>$data['order_id'],'status'=>4,'table_id'=>$data['table_id']));?>" class="absolute order_detail_footer" id="cancel-order">确认订单</a>
<?php else: ?>
<a href="<?php echo U('pay/index',array('id'=>$data['order_id'],'order_type'=>1));?>" class="absolute order_detail_footer" >立即支付</a><?php endif; endif; ?>
<?php if($data["status"] == 1): ?><a href="<?php echo U('order/changestatus',array('id'=>$data['order_id'],'status'=>3,'table_id'=>$data['table_id']));?>" class="absolute order_detail_footer" id="cancel-order">取消订单</a><?php endif; ?>
<?php if($data["status"] == 4): ?><a href="javascript:;" class="absolute order_detail_footer" id="eval">立即评价</a><?php endif; ?>
<div class="order_mask"></div>
<form id="form1" action="" method="post">
<div class="tip_box">
	<div class="tip_input">
		<img src="/Public/Home/img/star1.png" width="30" alt=""><img src="/Public/Home/img/star1.png" width="30" alt=""><img src="/Public/Home/img/star1.png" width="30" alt=""><img src="/Public/Home/img/star4.png" width="30" alt=""><img src="/Public/Home/img/star4.png" width="30" alt="">
		<input name="eval" type="hidden" class="starNum" value="3">
		<input name="shop_id" type="hidden" value="<?php echo ($data["id"]); ?>">
		<input name="order_id" type="hidden" value="<?php echo ($data['order_id']); ?>">
	</div>
	<div class="btn_group">
		<button type="button" id="btn-submit" class="pull-left red">OK</button>
	</div>
</div>	
</form>	
<script type="text/javascript" src="/Public/Home/js/zepto.min.js"></script>
<script type="text/javascript" src="/Public/Home/js/touch.js"></script>
<script>
	$(function(){
       $('.h-box').css('height',($(window).height()-88))
       $('.order_mask').height($(document).height())
       $('#eval').tap(function(){
       	$('.order_mask,.tip_box').show()
       })
       $('.order_mask').tap(function(){
       	$('.order_mask,.tip_box').hide()
       })
       $(".tip_input img").click(function(){
        var index=$(this).index()+1;
        for(var i=0;i<index;i++){
            $(".tip_input img").eq(i).addClass("hasStar")
            $(".tip_input img").eq(i).attr("src","/Public/Home/img/star1.png")
        }
        for(var i=index;i<5;i++){
             $(".tip_input img").eq(i).removeClass("hasStar")
            $(".tip_input img").eq(i).attr("src","/Public/Home/img/star4.png")
        }
        var l=$(".hasStar").length;
        $(".starNum").attr("value",l);
    })
       $("#btn-submit").click(function(){
       	   $.post("<?php echo U('order/evaluate');?>",$('#form1').serialize(),function(data){
       	   	   alert(data.info);
       	   	   window.location.href = "<?php echo U('order/index');?>"
       	   })
       })
	})
</script>
</body>
</html>