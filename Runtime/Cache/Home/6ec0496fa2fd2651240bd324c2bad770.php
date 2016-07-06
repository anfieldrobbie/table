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

<div class="title text-center">发现<a href="<?php echo U('find/lists');?>" class="title-right"><img class="back-btn" src="/Public/Home/img/find-icon.png" width="20" alt=""></a></div>
<div class="nav-box">
	<div class="nav <?php if($tabbar == 1): ?>active<?php endif; ?>"><a href="<?php echo U('Find/index');?>">热门</a></div>
	<div class="nav <?php if($tabbar == 2): ?>active<?php endif; ?>"><a href="javascript:getlocaltion()">距离近</a></div>
	<div class="nav <?php if($tabbar == 3): ?>active<?php endif; ?>"><a href="<?php echo U('Find/star');?>">评分</a></div>
</div>
<div class="food_box3">
   <div class="food_ul active">
   	<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="food_list">
   	   	<a href="<?php echo U('shop/index',array('id'=>$vo['id']));?>">
   	   		<div class="food_list_left pull-left">
			<div class="food_img" style="background-image: url(<?php echo (get_cover($vo['pic'],path)); ?>);"></div>
		</div>
		<div class="food_list_right pull-left">
			<div class="food_name"><?php echo ($vo["name"]); ?></div>
			<div class="star_group">
		    <?php if(is_array($vo["star"])): $i = 0; $__LIST__ = $vo["star"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo2): $mod = ($i % 2 );++$i;?><img src="/Public/Home/img/star1.png" width="15" alt=""><?php endforeach; endif; else: echo "" ;endif; ?>
			</div>
			<div class="room">西餐</div>

		</div>
   	   	</a>
   	   	    <?php if($vo["distance"] != 0): ?><div class="distance"><?php echo ($vo["distance"]); ?>m</div><?php endif; ?>
			<div class="collection"><img data-id="<?php echo ($vo["id"]); ?>"  <?php if($vo['like'] == 1): ?>src="/Public/Home/img/love1.png"<?php else: ?>src="/Public/Home/img/love2.png"<?php endif; ?> width="20" alt=""></div>
	</div><?php endforeach; endif; else: echo "" ;endif; ?>
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

<script>
	$(function(){
		$(document).on("click",".collection img",function(){
			if($(this).attr("src")=="/Public/Home/img/love2.png"){
				$(this).attr("src","/Public/Home/img/love1.png")
			}else{
				$(this).attr("src","/Public/Home/img/love2.png")
			}
				$.post("<?php echo U('like/add');?>",{id:$(this).attr("data-id")},function(data){
					
				})	
		})
	})
</script>
<script>
function getlocaltion(){
var position_option = {
              enableHighAccuracy: true,
              maximumAge: 30000,
              timeout: 20000
          };
navigator.geolocation.getCurrentPosition(getPositionSuccess, getPositionError, position_option);
}

function getPositionSuccess( position ){
	    var lng = position.coords.longitude;//经度
        var lat = position.coords.latitude;//纬度
        var local = {
        	"lng":lng,
        	"lat":lat
        }
        window.localStorage.setItem("local",JSON.stringify(local));
        SimpleCall(lng,lat);
            //alert('经度:'+lng+"纬度"+lat);
      if(typeof position.address !== "undefined"){
              var country = position.address.country;
              var province = position.address.region;
              var city = position.address.city;
              alert(' 您位于 ' + country + province + '省' + city +'市');
      }
}

function getPositionError(error) {
  switch (error.code) {
      case error.TIMEOUT:
          alert("连接超时，请重试");
          break;
      case error.PERMISSION_DENIED:
          alert("您拒绝了使用位置共享服务，查询已取消");
          break;
      case error.POSITION_UNAVAILABLE:
          alert("获取位置信息失败");
          break;
  }
}
function SimpleCall(lng,lat){

	 window.location.href = "index.php?s=/Home/Find/local/lng/"+lng+"/lat/"+lat;
}
</script>

</body>
</html>