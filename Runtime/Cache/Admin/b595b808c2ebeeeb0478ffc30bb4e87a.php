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
  	 <style>
        *{margin: 0;padding: 0}
        body,html{height: 100%;}
        .mask{width: 100%;height: 100%;background: rgba(0,0,0,.4);position: fixed;top: 0;left: 0;z-index: 11;display: none;}
        .tag-box1,.tag-box2,.tag-box3{width: 350px;height: 200px;background: white;border-radius: 5px;position: fixed;top: 200px;left: 50%;margin-left: -175px;z-index: 111;display: none;}
        .tag-box1 h2{padding: 15px 0 0;}
        .tag-body{padding:10px 15px;}
        .text-center{text-align: center;}
        .Btn{padding: 5px 10px;margin-right: 10px;}
        #text{width: 100%;height: 50px;resize: none;}
        #select{width: 100%;height: 40px;margin-bottom: 20px;}
    </style>
 <style>
        body{padding: 0}
    </style>

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
            

            
    <!-- 主体 -->
    <div id="indexMain" class="index-main">
       <!-- 插件块 -->
       <div class="container-span">
      <div style="padding: 20px;">
	 <h2>今日经营概况</h2>
	 <div class="row">
	 	<div class="col-xs-3 panel panel-default" style="margin-left: 20px"><h2 class="text-center">13</h2><h4 class="text-center">访问数</h4></div>
	 	<div class="col-xs-3 panel panel-default" style="margin-left: 20px"><h2 class="text-center"><?php echo $order["count"]+$takeaway["count"] ?></h2><h4 class="text-center">总订单数<div class="pull-left"><p><?php echo ($order["count"]); ?></p><p>堂食</p></div><div class="pull-right"><p><?php echo ($takeaway["count"]); ?></p><p>外卖</p></div></h4></div>
	 	<div class="col-xs-3 panel panel-default" id="star" style="margin-left: 20px"><h2 class="text-center">
	 		<?php if(is_array($shop['star'])): $i = 0; $__LIST__ = $shop['star'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><img src="/Public/Admin/images/star1.png" width="25" alt=""><?php endforeach; endif; else: echo "" ;endif; ?>
	 	</h2><h4 class="text-center">目前评分</h4></div>
	 </div>
	 <h2>餐厅实时概况 <span class="text-muted" style="font-size: 12px;"><?php echo Date("Y-m-d"); ?></span></h2>
	 <div class="row" id="gi">
	 	<?php if(is_array($order["list"])): $i = 0; $__LIST__ = $order["list"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="col-xs-3">
	 		<p>订单号：<?php echo ($vo["order_number"]); ?></p>
	 		<p>订单创建时间：<?php echo (date('Y-m-d h:m:s',$vo["create_time"])); ?></p>
	 		<p>餐桌状态：已下单</p>
	 		<div class="panel panel-default">
	 			<a id="action-problem" data-id="<?php echo ($vo["order_id"]); ?>" href="#" class="btn btn-info btn-sm pull-right">放进问题单</a>
	 			<p class="text-center" style="padding:30px 0 20px"><?php echo ($vo["name"]); ?></p>
	 			<div class="panel-footer"><?php echo ($vo["client_name"]); ?></div>
	 		</div>
	 		<div>操作: 
	 		<?php if($vo['status'] == 1): ?><a  href="<?php echo U('Order/changeStatus',array('status'=>2,'id'=>$vo['order_id']));?>" class="btn btn-default">出品</a><?php endif; ?>
	 		 <a href="<?php echo U('Order/detail',array('order_id'=>$vo['order_id']));?>" class="btn btn-default">查看订单</a></div>
	 	</div><?php endforeach; endif; else: echo "" ;endif; ?>
	 </div>

	 <h2>外卖订单快速处理</h2>
	 <div class="row">
	 	<div class="col-xs-6">
	 		<h3>等待商家确认</h3>
	 		<table class="table table-bordered">
      <thead>
        <tr>
          <th>用户名称</th>
          <th>时间</th>
          <th>订单操作</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
      	<?php if(is_array($takeaway["confirm"])): $i = 0; $__LIST__ = $takeaway["confirm"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
          <th scope="row"><?php echo ($vo["customer"]); ?></th>
          <td><?php echo (date('Y-m-d h:m:s',$vo["create_time"])); ?></td>
          <td><a href="<?php echo U('Takeaway/detail',array('tid'=>$vo['tid']));?>">查看订单</a></td>
          <td><a href="#" class="btn btn-default btn-order" data-id="<?php echo ($vo["tid"]); ?>">接单</a> <a data-id="<?php echo ($vo["tid"]); ?>" class="btn btn-default btn-order-cencel" href="#">拒单</a></td>
        </tr><?php endforeach; endif; else: echo "" ;endif; ?>
      </tbody>
    </table>
	 	</div>
	 	<div class="col-xs-6">
	 		<h3>等待用户取餐</h3>
	 		<table class="table table-bordered">
      <thead>
        <tr>
          <th>用户名称</th>
          <th>时间</th>
          <th>订单操作</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
      	<?php if(is_array($takeaway["untake"])): $i = 0; $__LIST__ = $takeaway["untake"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
          <th scope="row"><?php echo ($vo["customer"]); ?></th>
          <td><?php echo (date('Y-m-d h:m:s',$vo["create_time"])); ?></td>
          <td><a href="<?php echo U('Takeaway/detail',array('tid'=>$vo['tid']));?>">查看订单</a></td>
          <td><a href="<?php echo U('takeaway/changeStatus',array('takeaway_status'=>5,'tid'=>$vo['tid']));?>" class="btn btn-default">确认签收</a> <a class="btn btn-default" href="<?php echo U('takeaway/changeStatus',array('takeaway_status'=>3,'tid'=>$vo['tid']));?>">无人签收</a></td>
        </tr><?php endforeach; endif; else: echo "" ;endif; ?>
      </tbody>
    </table>
	 	</div>
	 </div>
	 <!--<div class="text-right"><nav>
	 <button class="btn btn-default">上一页</button><span class="page"> 1 </span><button class="btn btn-default">下一页</button>
  </div>-->
</div> 	
       </div>
    </div>
    <div class="mask"></div>
    
       <div class="tag-box1">
        <h2 class="text-center">是否确认拒单</h2>
        <div class="tag-body">
            <p style="margin-bottom:10px;">请输入拒单理由:</p>
            <form id="form3" action="">
                <textarea name="order_description"  cols="" rows=""></textarea>
                <input type="hidden" id="order_tid" name="tid" value="">
                <div><input id="order-btn-submit" class="Btn" type="button" value="确定"><input class="Btn"  type="button" value="取消" id="cancel1"></div>
            </form>

        </div>
    </div>
        <div class="mask"></div>
    
       <div class="tag-box3">
        <h2 class="text-center">是否确认加入问题单</h2>
        <div class="tag-body">
            <p style="margin-bottom:10px;">请输入理由:</p>
            <form id="form4" action="">
                <textarea name="description"  cols="" rows=""></textarea>
                <input type="hidden" id="order-problem-id" name="id" value="">
                <div><input id="problem-btn-submit" class="Btn" type="button" value="确定"><input class="Btn"  type="button" value="取消" id="cancel1"></div>
            </form>

        </div>
    </div>
    <div class="tag-box2">
       <div style="height:50px"></div>
        <div class="tag-body">
            <form action="">
                <select name="" id="select-time">
                    <option value="600">十分钟后</option>
                    <option value="1200">二十分钟后</option>
                    <option value="1800">三十分钟后</option>
                    <option value="2400">四十分钟后</option>
                    <option value="3000">五十分钟后</option>      
                </select>
                <div  style="margin-top:10px;"><input class=" Btn Btn-center" type="button" value="确认接单"><input class="Btn"  type="button" value="取消接单" id="cancel2"></div>
            </form>

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
    
<script type="text/javascript">
    /* 插件块关闭操作 */
    $(".title-opt .wm-slide").each(function(){
        $(this).click(function(){
            $(this).closest(".columns-mod").find(".bd").toggle();
            $(this).find("i").toggleClass("mod-up");
        });
    });
</script>
		    <script>
    $(document).ready(function(){
        $(".btn-order-cencel").click(function(){
            $(".mask,.tag-box1").show();
            $("#order_tid").val($(this).attr("data-id"));
        })
        $(".btn-order").click(function(){
            $(".mask,.tag-box2").show();
            $('.Btn-center').attr("data-id",$(this).attr("data-id"));
        });
        $("#cancel1").click(function(){
             $(".mask,.tag-box1").hide()
        })
        $("#cancel2").click(function(){
             $(".mask,.tag-box2").hide();
        })
        $("#action-problem").click(function(){
             $(".mask,.tag-box3").show();
             $('#order-problem-id').val($(this).attr("data-id"));
        });
        $('.Btn-center').click(function(){
           $.post("<?php echo U('takeaway/takes');?>",{"id":$(this).attr("data-id"),"time":$("#select-time").val()},function(data){
            		window.location.reload();
            
            });
        });
        $("#order-btn-submit").click(function(){
             $.post("<?php echo U('takeaway/cancel');?>",$("#form3").serialize(),function(data){
            		window.location.reload();
            });
        });
         $("#problem-btn-submit").click(function(){
             $.post("<?php echo U('order/cancel');?>",$("#form4").serialize(),function(data){
            		window.location.reload();
            });
        });
    });
    </script>

</body>
</html>