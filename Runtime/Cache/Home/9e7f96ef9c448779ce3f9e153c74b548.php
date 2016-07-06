<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>order</title>
	<link rel="stylesheet" href="/Public/Home/css/swiper.min.css">
	<link rel="stylesheet" href="/Public/Home/css/common.css">
	<style>
	body{background: #eee;}
	.foods_num{ top: 5px;left:26px;display: block; width: 16px; height: 16px; border-radius: 50%;background: #ff4040;color: white; text-align: center;line-height: 16px; font-size: 12px; }
	    .swiper-container {
        width: 100%;
        height: 40px;
        background: white;
        border-bottom: 1px solid #ccc;
    }
        .swiper-slide {
        color: #333;
        box-sizing: border-box;
        text-align: center;
        width: 60px!important;
        font-size: 14px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
    }
    .swiper-slide.active{color: #ff4040;}
    .active .swiper_active{bottom: 4px;left: 15%;width: 70%; height: 2px; background: #ff4040; }
    .foodOption b{font-weight: normal;}
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
    .order_box{position: fixed;width: 100%;height: 300px;left:0;bottom: 44px;z-index: 11111;display: none;}
    .order-top{height: 40px;line-height: 40px;padding: 0 10px;background: #ececee;border-bottom: 1px solid #e7e7e7;color: #666666;}
    .order-top a{color: #666;font-size: 14px;}
	</style>
</head>
<body>
<div class="title text-center"><a href="<?php echo U('shop/index',array('id'=>$shop_id));?>"  class="title-left"><img class="back-btn" src="/Public/Home/img/left.png" width="10" alt=""></a>点餐<a href="#" class="title-right"><img class="more" src="/Public/Home/img/more.png" width="15" alt=""></a></div>
<div class="swiper-container">
        <div class="swiper-wrapper">
   <?php echo ($cart_type); ?>
            <?php if(is_array($category)): $i = 0; $__LIST__ = $category;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="swiper-slide relative <?php if($cid == $vo['id']){echo 'active';} ?>"><a href="<?php echo U('Goods/index',array('feed_type'=>$type,'shop_id'=>$shop_id,'type'=>$vo['id']));?>"><?php echo ($vo["name"]); ?></a><span class="swiper_active absolute"></span></div><?php endforeach; endif; else: echo "" ;endif; ?> 
        </div>
    </div>
 
 <div id="foodAll">
 	<div class="foodBox">
         <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="foodBoxL pull-left relative">
 		<a class="a_block" href="<?php echo U('Goods/detail',array('id'=>$vo['id'],'cart_type'=>$type,'shop_id'=>$shop_id));?>"><img src="<?php echo (get_cover($vo['pic'],path)); ?>" width="100%" height="150" alt=""></a>
 		<div class="foodOption">
 			<p class="black font-sm"><?php echo ($vo["name"]); ?></p>
 			<p><span class="red">$<b class="now_m"><?php echo ($vo["prices"]); ?></b></span>&nbsp;&nbsp;<span>$<b class="last_m font-sm"><?php echo ($vo["o_prices"]); ?></b></span></p>
 			<div data-id='<?php echo ($vo["id"]); ?>' data-burde="<?php echo ($vo["burdening"]); ?>" class="add_btn has-box absolute"><img src="/Public/Home/img/add.png" width="25" alt=""></div>
 		</div>
 	</div><?php endforeach; endif; else: echo "" ;endif; ?>    
 </div>
 
 
<div class="cart_footer absolute">
	<div class="cart_footer_left pull-left relative"><img id="orderCar" src="/Public/Home/img/car.png" style="margin: 10px 12px" width="24" alt="">
            <span class="foods_num absolute"></span>
     <span class="total absolute">总计：$ <span class="total_num"></span></span>
	</div>
    <?php if($type == 1): ?><a href="<?php echo U('cart/index',array('cart_type'=>1,'shop_id'=>$shop_id));?>" class="cart_footer_right pull-left text-center absolute">点餐完成</a>
    <?php else: ?>
    <a href="<?php echo U('cart/index',array('cart_type'=>2,'shop_id'=>$shop_id));?>" class="cart_footer_right pull-left text-center absolute">点餐完成</a><?php endif; ?>
</div>
<div class="mask"></div>
<div class="tip_box giveUp">
	<div class="black gu-title">Do you want to give up your order?</div>
<div class="remarkBox relative">
</div>

	<div class="btn_group">
		<button class="pull-left red" id="cancel2" style="border-right: 1px solid #ccc">Cancel</button>
		<button class="pull-left red ok-btn" id="out">OK</button>
	</div>
</div>
<div class="tip_box ctBox">
<form id='form1' method="post">
	<p class="black">可供选择配料 (<span id="burdeningmax">五</span>选<span id="bselectmax">二</span>)</p>
<div class="tag-box"><img src="/Public/Home/img/tig.png" width="25" alt="">


</div>
<input type='hidden' name='burdening' value=''>
<input type='hidden' name='id' value=''>
<input type='hidden' name='cart_type' value='<?php echo ($type); ?>'>
<input type='hidden' name='shop_id' value='<?php echo ($shop_id); ?>'>
<input type='hidden' id="select-max" value="1">
<div class="font-sm black remark_l">备注</div>
<div class="remarkBox relative">
	<textarea name="note" id="remark_t" cols="30" rows="10" placeholder=""></textarea>
	<span class="ban_num"><label class="now_num">0</label>/100</span>
</div>

	<div class="btn_group">
		<button class="pull-left red" id="cancel" style="border-right: 1px solid #ccc">Cancel</button>
		<button type='button'  class="pull-left red ok-btn">OK</button>
	</div>
</form>
</div>
<!--购物车点击-->
<div class="order_box">
  <div class="order-top">
    购物车
    <a href="javascript:;" class="pull-right clear-btn"><img class="pull-left" src="/Public/Home/img/lj.png" height="14" alt="" style="margin-right: 5px;margin-top: 13px;">清空</a>
  </div>
  <div class="notMsg text-center"></div>
  <div id="cartlist">
  	
  </div>
</div>
<script type="text/javascript" src="/Public/Home/js/zepto.min.js"></script>
<script type="text/javascript" src="/Public/Home/js/touch.js"></script>
<script type="text/javascript" src="/Public/Home/js/swiper.min.js"></script>
<script type="text/javascript" src="/Public/Home/js/xhr.js"></script>
<script type="text/javascript" src="/Public/Home/js/cart.js"></script>
<script>
getCount();
$(".add_btn").click(function(){
       simpleCall(
            "<?php echo U('cart/add');?>",
            {
              type:1,
              id:$(this).attr("data-id"),
              shop_id:<?php echo ($shop_id); ?>
            },function(data){         
             $("input[name=id]").val(data.id);
             $('.mask,.ctBox').show();
             var burde = data.burdening.split(",");
             var arr = [];
             for(var i=0;i<burde.length;i++)
             {
             	if(i<data.burdening_max-1)
             	{
             	   $(".tag-box").append("<span class='tag active'>"+burde[i]+"</span>")		
             	   arr.push(burde[i]);
             	}
             	else
             	{
             		 $(".tag-box").append("<span class='tag'>"+burde[i]+"</span>")
             	}
          
             }
              $("input[name=burdening]").val(arr.join(","));
               /*弹窗*/
             var giveH=parseInt($('.ctBox').height())/2;
             $('.ctBox').css('margin-top',-giveH);
			 $('#burdeningmax').html(burde.length);
			 $('#bselectmax').html(data.burdening_max);
        });
});
$('.ok-btn').tap(function(){
       var formData = $("#form1").serialize();
       console.log(formData);
        simpleCall(
            "<?php echo U('cart/add');?>",
             formData,
             function(data){
             alert(data.info);
             getCount();
             $('.mask,.ctBox').hide();   
        });
    	
});
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
$("#orderCar").tap(function(){
	var type = "<?php echo ($type); ?>";
	var id = "<?php echo ($shop_id); ?>";
	$.post("<?php echo U('cart/getlist');?>",{cart_type:type,shop_id:id},function(data){
     var str = "";
     for(var i in data)
     {
    str+='<div class="order_list relative">'
    +data[i].goods_name+'<span class="remark absolute"><img src="/Public/Home/img/remark.png" width="20" alt=""></span>'
    +'<span class="momey absolute">$<b id="momey">'+data[i].goods_prices+'</b></span>'
    +'<div class="cz_box pull-right absolute">'
    +'<a data-id="'+data[i].goods_id+'" href="javascript:;" class="reduce btn-reduce"><img src="/Public/Home/img/reduce.png" width="25" alt=""></a>'
    +'<span class="key">'+data[i].num+'</span>'
    +'<a href="javascript:;" class="add btn-add" data-id="'+data[i].goods_id+'"><img src="/Public/Home/img/add.png" width="25" alt=""></a>'
    +'</div>'
    +'</div>'
    }
    $("#cartlist").html(str);
	});
});
    //点击清空
     $(".clear-btn").click(function(){
     	var type = "<?php echo ($type); ?>";
	    var id = "<?php echo ($shop_id); ?>";
      $(".order_list").remove()
      $(".total_num").text("0")
      $.post("<?php echo U('cart/clear');?>",{cart_type:type,shop_id:id},function(data){
      	   if(data.status===1)
      	   {
      	   	window.location.reload(); 
      	   }
      });
     })
     $(document).on("click",".btn-add",function(){     
     	   var num=parseInt($(this).siblings('.key').text())
      $(this).siblings('.key').text(num+1)
      total()
           simpleCall(
            "<?php echo U('cart/add');?>",
           {
             cart_type:<?php echo ($type); ?>,
             id:$(this).attr("data-id"),
             shop_id:<?php echo ($shop_id); ?>
           },function(data){
    
          });
          });
    $(document).on("click",".btn-reduce",function(){   
    	    var num=parseInt($(this).siblings('.key').text())
        num>0?$(this).siblings('.key').text(num-1):$(this).siblings('.key').text(0)
        total()
           simpleCall(
            "<?php echo U('cart/remove');?>",
           {
             cart_type:<?php echo ($type); ?>,
             id:$(this).attr("data-id"),
             shop_id:<?php echo ($shop_id); ?>
           },function(data){
    
          });
          });	
     function total(){
        var total=0.00
         $('.order_list').each(function(){
          var one_momey=parseFloat($(this).find('#momey').text())
          var num=parseFloat($(this).find(".key").text())
          var t=parseFloat(one_momey*num);
          total+=t
       })
        $(".total_num").text(total)
    }
    $(document).on("tap",".tag",function(){
    	    var arr = [];
    		if($(this).hasClass("active"))
    		{
    			$(this).removeClass("active");
    		}
    		else
    		{
			    if($('.tag.active').length>$('#bselectmax').html()-1)
				{
				  return false;
				}
    			$(this).addClass("active");
    		}
    	$('.tag-box>.tag').each(function(){
    		if($(this).hasClass("active"))
    		{
    			arr.push($(this).html());
    		}
    	})
    	 $("input[name=burdening]").val(arr.join(","));
    })
</script>
</body>
</html>