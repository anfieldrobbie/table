<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>index_search</title>
	<link rel="stylesheet" href="/Public/Home/css/common.css">
	<style>
  body{
    background-color: #eeeeee;
  }
  .result_ul_address a{
  	display: block;
    width: 100%;
    height: 54px;
    line-height: 24px;
    color: #666;
    /* text-indent: 3px; */
    border-bottom: 1px solid #ccc;
    background: white;
    padding: 5px;
  }
	</style>
</head>
<body>
<div class="title text-center"><a href="javascript:history.go(-1)" class="title-left"><img class="back-btn" src="/Public/Home/img/close.png" width="15" alt=""></a><img src="/Public/Home/img/table.png" width="60"><a href="#" class="title-right"><img class="back-btn" src="/Public/Home/img/right2.png" width="18" alt=""></a></div>
<div class="input-group">
	<form action="<?php echo U('Index/search');?>" method="post">
	<div class="input-t" style="margin-bottom: 5px">
		<img src="/Public/Home/img/search.png" width="16" alt="">
		<input data-list="hot" name="name" type="text" class="mine_text" value="">
	</div>
	<div class="input-t">
		<img src="/Public/Home/img/map2.png" width="16" alt="">
		<input data-list="address" name="address" type="text" class="mine_text" value="">
	</div>
    <button type="hidden" style="opacity: 0;"></button>
	</form>
</div>
<div id="hot" class="result" style="display: none;">
	<p>热门推荐</p>
	<div class="result_ul">
		<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><a href="<?php echo U('shop/index',array('id'=>$vo['id']));?>"><?php echo ($vo["name"]); ?></a><?php endforeach; endif; else: echo "" ;endif; ?>
	</div>
</div>
<div id="address" class="result" style="display: none;">
	<p>当前地址</p>
	<div class="result_ul_address">
	<a href="#">获取不到当前地址</a>
	</div>
</div>
<div class="result">
	<p>历史记录</p>
        <form id="form1"  action="<?php echo U('Index/search');?>" method="post">
	<div class="result_ul" id="history">
            <?php if(is_array($history)): $i = 0; $__LIST__ = $history;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><a href="#"><?php echo ($vo["goods_name"]); ?></a><?php endforeach; endif; else: echo "" ;endif; ?>
	</div>
            <input type="hidden" name="name" value="">
        </form>
</div>
<script type="text/javascript" src="/Public/Home/js/zepto.min.js"></script>
<script type="text/javascript" src="/Public/Home/js/touch.js"></script>
<script type="text/javascript" src="/Public/Home/js/xhr.js"></script>
<script>
$("input[name=name]").tap(function(){
	$("#hot").show();
	$('#address').hide();
})
$("input[name=address]").tap(function(){
	$("#hot").hide();
	$('#address').show();
	getlocaltion();
})
$("#history>a").tap(function(){
    $("#form1").find("input[name=name]").val($(this).html());
    $("#form1").submit();
});
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
    $.post("<?php echo U('Find/Get_Address_From_Google_Maps');?>",{lng:lng,lat:lat},function(data){
    	if(data.status===1)
    	{
    		 $('#address').find("a").html(data.data.formatted_address);
    	}
    	else
    	{
    		 $('#address').find("a").html("获取不到当前地址");
    	}
   
    });
}	
</script>
</body>
</html>