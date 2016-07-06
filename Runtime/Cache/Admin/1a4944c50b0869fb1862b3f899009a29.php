<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>系统管理平台</title>
    <link href="/Public/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/base.css" media="all">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/module.css">
    <link rel="stylesheet" type="text/css" href="/Public/Admin/css/style.css" media="all">
	<link rel="stylesheet" type="text/css" href="/Public/Admin/css/<?php echo (C("COLOR_STYLE")); ?>.css" media="all">
     <!--[if lt IE 9]>
    <script type="text/javascript" src="/Public/static/jquery-1.10.2.min.js"></script>
    <![endif]--><!--[if gte IE 9]><!-->
    <script type="text/javascript" src="/Public/static/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="/Public/Admin/js/jquery.mousewheel.js"></script>
    <!--<![endif]-->
    
	<link rel="stylesheet" href="/Public/Admin/css/bootstrap.min.css">
	<link rel="stylesheet" href="/Public/Admin/css/common.css">	

</head>
<body>
    <!-- 头部 -->
    <div class="header">
        <!-- Logo -->
        <span class="logo">系统控制台</span>
        <!-- /Logo -->

        <!-- 主导航 -->
        <ul class="main-nav">
            <?php if(is_array($__MENU__["main"])): $i = 0; $__LIST__ = $__MENU__["main"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li class="<?php echo ((isset($menu["class"]) && ($menu["class"] !== ""))?($menu["class"]):''); ?>"><a href="<?php echo (u($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
        <!-- /主导航 -->

        <!-- 用户栏 -->
        <div class="user-bar">
            <a href="javascript:;" class="user-entrance"><i class="icon-user"></i></a>
            <ul class="nav-list user-menu hidden">
                <li class="manager">你好，<em title="<?php echo session('user_auth.username');?>"><?php echo session('user_auth.username');?></em></li>
                <li><a href="<?php echo U('User/updatePassword');?>">修改密码</a></li>
                <li><a href="<?php echo U('User/updateNickname');?>">修改昵称</a></li>
                <li><a href="<?php echo U('Public/logout');?>">退出</a></li>
            </ul>
        </div>
    </div>
    <!-- /头部 -->

    <!-- 边栏 -->
    <div class="sidebar">
        <!-- 子导航 -->
        
            <div id="subnav" class="subnav">
                <?php if(!empty($_extra_menu)): ?>
                    <?php echo extra_menu($_extra_menu,$__MENU__); endif; ?>
                <?php if(is_array($__MENU__["child"])): $i = 0; $__LIST__ = $__MENU__["child"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub_menu): $mod = ($i % 2 );++$i;?><!-- 子导航 -->
                    <?php if(!empty($sub_menu)): if(!empty($key)): ?><h3><i class="icon icon-unfold"></i><?php echo ($key); ?></h3><?php endif; ?>
                        <ul class="side-sub-menu">
                            <?php if(is_array($sub_menu)): $i = 0; $__LIST__ = $sub_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li>
                                    <a class="item" href="<?php echo (u($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a>
                                </li><?php endforeach; endif; else: echo "" ;endif; ?>
                        </ul><?php endif; ?>
                    <!-- /子导航 --><?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
        
        <!-- /子导航 -->
    </div>
    <!-- /边栏 -->

    <!-- 内容区 -->
    <div id="main-content">
        <div id="top-alert" class="fixed alert alert-error" style="display: none;">
            <button class="close fixed" style="margin-top: 4px;">&times;</button>
            <div class="alert-content">这是内容</div>
        </div>
        <div id="main" class="main">
            
            <!-- nav -->
            <?php if(!empty($_show_nav)): ?><div class="breadcrumb">
                <span>您的位置:</span>
                <?php $i = '1'; ?>
                <?php if(is_array($_nav)): foreach($_nav as $k=>$v): if($i == count($_nav)): ?><span><?php echo ($v); ?></span>
                    <?php else: ?>
                    <span><a href="<?php echo ($k); ?>"><?php echo ($v); ?></a>&gt;</span><?php endif; ?>
                    <?php $i = $i+1; endforeach; endif; ?>
            </div><?php endif; ?>
            <!-- nav -->
            

            
<div style="padding: 20px;">
	 <h2>经营分析</h2>
	 <p><a href="<?php echo U('Count/index',array('day'=>1));?>" class="btn btn-default">今天</a> <a href="<?php echo U('Count/index',array('day'=>7));?>" class="btn btn-default">近7天</a> <a href="<?php echo U('Count/index',array('day'=>30));?>" class="btn btn-default">近30天</a> </p>
	 <div class="row">
	 	<div class="col-xs-3 panel panel-default" style="margin-left: 20px"><h2 class="text-center">13</h2><h4 class="text-center">访问数</h4>
	 	<p class="text-right">与前日相比<span class="label label-default">UP</span>20%</p></div>
	 	<div class="col-xs-3 panel panel-default" style="margin-left: 20px"><h2 class="text-center"><?php echo ($data["current"]["order_count"]); ?></h2><h4 class="text-center">总订单数</h4>
	 	<p class="text-right">与前日相比<span class="label label-default"><?php if($data["current"]["order_count"] >= $data["after"]["order_count"]): ?>UP<?php else: ?>DOWN<?php endif; ?></span><?php echo ($data["compare"]["order_count"]); ?>%</p></div>
	 	<div class="col-xs-3 panel panel-default" style="margin-left: 20px"><h2 class="text-center"><?php echo gmstrftime("%Mm:%Ss",$data["current"]["takeaway_time"]); ?></h2><h4 class="text-center">平均外卖订单接时间</h4>
	 	<p class="text-right">与前日相比<span class="label label-default"><?php if($data["current"]["takeaway_time"] >= $data["after"]["takeaway_time"]): ?>UP<?php else: ?>DOWN<?php endif; ?></span><?php echo ($data["compare"]["takeaway_time"]); ?>%</p></div>
	 </div>
	 <div class="row">
	 	<div class="col-xs-3 panel panel-default" style="margin-left: 20px"><h2 class="text-center">$<?php echo ($data["current"]["prices"]); ?></h2><h4 class="text-center">销售金额</h4>
	    <p class="text-right">与前日相比<span class="label label-default"><?php if($data["current"]["prices"] >= $data["after"]["prices"]): ?>UP<?php else: ?>DOWN<?php endif; ?></span><?php echo ($data["compare"]["prices"]); ?>%</p></div>
	 	<div class="col-xs-3 panel panel-default" style="margin-left: 20px"><h2 class="text-center">$<?php echo ($data["current"]["tip"]); ?></h2><h4 class="text-center">小费金额</h4>
	 		    <p class="text-right">与前日相比<span class="label label-default"><?php if($data["current"]["tip"] >= $data["after"]["tip"]): ?>UP<?php else: ?>DOWN<?php endif; ?></span><?php echo ($data["compare"]["tip"]); ?>%</p></div>
	 </div>
     <p style="padding:20px 0 "></p>
	 <div class="row">
	 	<!--<div class="col-xs-2 text-right">
	 	   <p style="padding: 15px 0"></p>
	 		<p><button class="btn btn-default">访问数</button></p>
	 		<p><button class="btn btn-default">总订单数</button></p>
	 		<p><button class="btn btn-default">外卖接单时间</button></p>
	 		<p><button class="btn btn-default">销售金额</button></p>
	 	</div>-->
	 	<div class="col-xs-10">
	 		<p><button class="btn btn-default dayChange" id="seven">近7天</button> <button id="mouth" class="btn btn-default dayChange">近30天</button></p>
	 		<div id="container" style="min-width: 310px; height: 300px; margin: 0 auto"></div>
	 	</div>
	 </div>
	 </div>

</div>

        </div>
        <div class="cont-ft">
            <div class="copyright">
              
             
            </div>
        </div>
    </div>
    <!-- /内容区 -->
    <script type="text/javascript">
    (function(){
        var ThinkPHP = window.Think = {
            "ROOT"   : "", //当前网站地址
            "APP"    : "/index.php?s=", //当前项目地址
            "PUBLIC" : "/Public", //项目公共目录地址
            "DEEP"   : "<?php echo C('URL_PATHINFO_DEPR');?>", //PATHINFO分割符
            "MODEL"  : ["<?php echo C('URL_MODEL');?>", "<?php echo C('URL_CASE_INSENSITIVE');?>", "<?php echo C('URL_HTML_SUFFIX');?>"],
            "VAR"    : ["<?php echo C('VAR_MODULE');?>", "<?php echo C('VAR_CONTROLLER');?>", "<?php echo C('VAR_ACTION');?>"]
        }
    })();
    </script>
    <script type="text/javascript" src="/Public/static/think.js"></script>
    <script type="text/javascript" src="/Public/Admin/js/common.js"></script>
    <script type="text/javascript">
        +function(){
            var $window = $(window), $subnav = $("#subnav"), url;
            $window.resize(function(){
                $("#main").css("min-height", $window.height() - 130);
            }).resize();

            /* 左边菜单高亮 */
            url = window.location.pathname + window.location.search;
            url = url.replace(/(\/(p)\/\d+)|(&p=\d+)|(\/(id)\/\d+)|(&id=\d+)|(\/(group)\/\d+)|(&group=\d+)/, "");
            $subnav.find("a[href='" + url + "']").parent().addClass("current");

            /* 左边菜单显示收起 */
            $("#subnav").on("click", "h3", function(){
                var $this = $(this);
                $this.find(".icon").toggleClass("icon-fold");
                $this.next().slideToggle("fast").siblings(".side-sub-menu:visible").
                      prev("h3").find("i").addClass("icon-fold").end().end().hide();
            });

            $("#subnav h3 a").click(function(e){e.stopPropagation()});

            /* 头部管理员菜单 */
            $(".user-bar").mouseenter(function(){
                var userMenu = $(this).children(".user-menu ");
                userMenu.removeClass("hidden");
                clearTimeout(userMenu.data("timeout"));
            }).mouseleave(function(){
                var userMenu = $(this).children(".user-menu");
                userMenu.data("timeout") && clearTimeout(userMenu.data("timeout"));
                userMenu.data("timeout", setTimeout(function(){userMenu.addClass("hidden")}, 100));
            });

	        /* 表单获取焦点变色 */
	        $("form").on("focus", "input", function(){
		        $(this).addClass('focus');
	        }).on("blur","input",function(){
				        $(this).removeClass('focus');
			        });
		    $("form").on("focus", "textarea", function(){
			    $(this).closest('label').addClass('focus');
		    }).on("blur","textarea",function(){
			    $(this).closest('label').removeClass('focus');
		    });

            // 导航栏超出窗口高度后的模拟滚动条
            var sHeight = $(".sidebar").height();
            var subHeight  = $(".subnav").height();
            var diff = subHeight - sHeight; //250
            var sub = $(".subnav");
            if(diff > 0){
                $(window).mousewheel(function(event, delta){
                    if(delta>0){
                        if(parseInt(sub.css('marginTop'))>-10){
                            sub.css('marginTop','0px');
                        }else{
                            sub.css('marginTop','+='+10);
                        }
                    }else{
                        if(parseInt(sub.css('marginTop'))<'-'+(diff-10)){
                            sub.css('marginTop','-'+(diff-10));
                        }else{
                            sub.css('marginTop','-='+10);
                        }
                    }
                });
            }
        }();
    </script>
    
	<script src="/Public/static/thinkbox/jquery.thinkbox.js"></script>
	<script src="/Public/Admin/js/bootstrap.min.js"></script>
	<script src="/Public/Admin/js/highcharts.js"></script>
	<script type="text/javascript">
	//搜索功能
	$("#search").click(function(){
		var url = $(this).attr('url');
        var query  = $('.search-form').find('input').serialize();
        query = query.replace(/(&|^)(\w*?\d*?\-*?_*?)*?=?((?=&)|(?=$))/g,'');
        query = query.replace(/^&/g,'');
        if( url.indexOf('?')>0 ){
            url += '&' + query;
        }else{
            url += '?' + query;
        }
		window.location.href = url;
	});
	//回车搜索
	$(".search-input").keyup(function(e){
		if(e.keyCode === 13){
			$("#search").click();
			return false;
		}
	});
    //导航高亮
    highlight_subnav('<?php echo U('User/index');?>');
	</script>
	<script>
$(function () {
	var timeEnd=Today()
    var timeSt;
    $(".dayChange").click(function(){
    	if($(this).text()=="近7天"){
    		 timeSt=getNewDate(new Date(),-7)
    		 console.log(timeSt+"到"+timeEnd)
    	}else if($(this).text()=="近30天"){
    		timeSt=getNewDate(new Date(),-30)
    		 console.log(timeSt+"到"+timeEnd)
    	}
    	postData(timeSt,timeEnd)
    })
    $("#seven").click()

   //传数据
   function postData(timeSt,timeEnd){
   	  $.post("<?php echo U('Count/orderChats');?>",{
		"timeSt":timeSt,
		"timeEnd":timeEnd
	},function(data){
		//data就是你传过来的记得把下面的假数据删了
	   var data={
		time:data.order.time,
		visit:data.order.visit,
		allOrder:data.order.allOrder,
		money:data.order.money
	    }
	   console.log(data);
		getData(data)
	})

   }



	function getData(data){
 $('#container').highcharts({
        title: {
            text: '数据统计',
            x: -20 //center
        },
        xAxis: {
            categories:data.time
        },
        yAxis: {
            title: {
                text: ''
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
           
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: '访问数',
            data: data.visit
        }, {
            name: '总订单数',
            data: data.allOrder
        }, {
            name: '销售金额',
            data: data.money
        }]
    });
	}
         
         //获取今天的日期
	     function Today() {
            var d = new Date();
            var mouth=d.getMonth() + 1;
            var day=d.getDate();
            if(mouth<10){
            	mouth="0"+mouth
            }
            if(day<10){
            	day="0"+day
            }
            var today = d.getFullYear() + "-" + mouth + "-" + day;
            return today;
        }
            //获取向前7天跟30天的日期
              function getNewDate(dd, num) {
                dd.setDate(dd.getDate() + num)
                var y = dd.getFullYear();
                if (dd.getMonth() >= 10) {
                    var m = dd.getMonth() + 1
                } else {
                    var m = "0" + (dd.getMonth() + 1)
                }
                if (dd.getDate() >= 10) {
                    var d = dd.getDate()
                } else {
                    var d = "0" + dd.getDate()
                }
                return y + "-" + m + "-" + d
            }
   
});
	</script>

</body>
</html>