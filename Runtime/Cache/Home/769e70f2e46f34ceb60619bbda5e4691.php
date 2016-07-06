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

<div class="title text-center"><a href="javascript:getlocaltion()" class="title-left"><img style="margin-top: 10px;" src="/Public/Home/img/map.png" width="17" alt=""></a>
<div class="search pull-left">
        <form action="<?php echo U('index/search');?>" method='post'>
	<img class="pull-left" style="margin:6px 12px" src="/Public/Home/img/search.png" width="16" alt="">
	<a href="<?php echo U('Find/lists');?>" class="pull-left" style="color:rgba(51, 51, 51, 0.6);height: 30px; line-height: 30px;">搜索餐厅名称或食品名称<a>
        </form>
</div>
<a href="#" class="title-right"><img class="btn-qr" src="/Public/Home/img/qr.png" width="20" alt=""></a></div>
<div class="food_box2">
 附近没有找到餐厅
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

<script src="/Public/Home/js/upload.js"></script> 
<input id="qrcode" style="display: none;" type="file" accept="image/*;capture=camera" class="input"> 
<script>
getlocaltion();
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

	$.post("<?php echo U('index/index');?>",{lng:lng,lat:lat},function(data){
                 if(data.length>0)
                 {
                     var str = "";
                     for(i in data)
                     {

                               str+='<div class="ct_list relative">'
                    +'<a href="/index.php?s=/Home/Shop/index/id/'+data[i].id+'">'
                    +'<img src="'+data[i].detail_pic+'" width="100%" height="100%" alt="">'
                        +'<div class="ct_xc absolute">'
                            +'<div class="ct_name">'+data[i].name+'</div>'
                            +'<div class="star_li">'+getStar(data[i].star)
                            +'<span class="score">'+data[i].star+'</span></div>'
                            +'<div class="ju absolute">'+data[i].distance+'m</div>'
                        +'</div></a>'
                    +'</div>';
                     }
                    $('.food_box2').html(str);
                 }

	});
}
function getStar(num)
{
	var str = "";
	for(var i=0;i<num;i++)
	{
	   str+='<img src="/Public/Home/img/star1.png" width="16" alt="">';	
	}
	return str;
}
$('.search-input').tap(function(){
	window.location.href = "<?php echo U('Find/lists');?>"
})
</script>	
<script> 
document.addEventListener('DOMContentLoaded', init, false); 
 
function init() { 
var u = new UploadPic(); 
u.init({ 
input: document.getElementById("qrcode"), 
callback: function (base64) { 
$.ajax({ 
url:"<?php echo U('File/Qcode');?>", 
data:{pic:base64,type:this.fileType}, 
type:'post', 
dataType:'json', 
success:function(data){ 
   window.location.href =  data.url;
} 
}) 
}, 
loading: function () { 

} 
}); 
} 
$('.btn-qr').tap(function(){
	document.getElementById("qrcode").click(); 
})
</script> 

</body>
</html>