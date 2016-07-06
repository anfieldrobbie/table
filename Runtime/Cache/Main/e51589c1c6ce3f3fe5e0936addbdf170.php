<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en" class="app">
<head>
  <meta charset="utf-8" />
  <title>Web Application</title>
  <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" /> 
  <link rel="stylesheet" href="/Public/Main/css/bootstrap.css" type="text/css" />
  <link rel="stylesheet" href="/Public/Main/css/animate.css" type="text/css" />
  <link rel="stylesheet" href="/Public/Main/css/font-awesome.min.css" type="text/css" />
  <link rel="stylesheet" href="/Public/Main/css/font.css" type="text/css" />
  <link rel="stylesheet" href="/Public/Main/js/calendar/bootstrap_calendar.css" type="text/css" />
  <link rel="stylesheet" href="/Public/Main/css/app.css" type="text/css" />
  
  <!--[if lt IE 9]>
    <script src="js/ie/html5shiv.js"></script>
    <script src="js/ie/respond.min.js"></script>
    <script src="js/ie/excanvas.js"></script>
  <![endif]-->
</head>
<body>
  <section class="vbox">
    <header class="bg-dark dk header navbar navbar-fixed-top-xs">
      <div class="navbar-header aside-md">
        <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen,open" data-target="#nav,html">
          <i class="fa fa-bars"></i>
        </a>
        <a href="#" class="navbar-brand" data-toggle="fullscreen"><img src="/Public/Main/images/logo.png" class="m-r-sm">主后台</a>
        <a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".nav-user">
          <i class="fa fa-cog"></i>
        </a>
      </div>
      <ul class="nav navbar-nav hidden-xs">
<!--
        <li>
          <div class="m-t m-l">
            <a href="price.html" class="dropdown-toggle btn btn-xs btn-primary" title="Upgrade"><i class="fa fa-long-arrow-up"></i></a>
          </div>
        </li>-->
      </ul>      
      <ul class="nav navbar-nav navbar-right hidden-xs nav-user">
        <!--<li class="hidden-xs">
          <a href="#" class="dropdown-toggle dk" data-toggle="dropdown">
            <i class="fa fa-bell"></i>
            <span class="badge badge-sm up bg-danger m-l-n-sm count">2</span>
          </a>
          <section class="dropdown-menu aside-xl">
            <section class="panel bg-white">
              <header class="panel-heading b-light bg-light">
                <strong>You have <span class="count">2</span> notifications</strong>
              </header>
              <div class="list-group list-group-alt animated fadeInRight">
                <a href="#" class="media list-group-item">
                  <span class="pull-left thumb-sm">
                    <img src="/Public/Main/images/avatar.jpg" alt="John said" class="img-circle">
                  </span>
                  <span class="media-body block m-b-none">
                    Use awesome animate.css<br>
                    <small class="text-muted">10 minutes ago</small>
                  </span>
                </a>
                <a href="#" class="media list-group-item">
                  <span class="media-body block m-b-none">
                    1.0 initial released<br>
                    <small class="text-muted">1 hour ago</small>
                  </span>
                </a>
              </div>
              <footer class="panel-footer text-sm">
                <a href="#" class="pull-right"><i class="fa fa-cog"></i></a>
                <a href="#notes" data-toggle="class:show animated fadeInRight">See all the notifications</a>
              </footer>
            </section>
          </section>
        </li>-->
        <!--<li class="dropdown hidden-xs">
          <a href="#" class="dropdown-toggle dker" data-toggle="dropdown"><i class="fa fa-fw fa-search"></i></a>
          <section class="dropdown-menu aside-xl animated fadeInUp">
            <section class="panel bg-white">
              <form role="search">
                <div class="form-group wrapper m-b-none">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search">
                    <span class="input-group-btn">
                      <button type="submit" class="btn btn-info btn-icon"><i class="fa fa-search"></i></button>
                    </span>
                  </div>
                </div>
              </form>
            </section>
          </section>
        </li>-->
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <span class="thumb-sm avatar pull-left">
              <img src="/Public/Main/images/avatar.jpg">
            </span>
            管理员 <b class="caret"></b>
          </a>
          <ul class="dropdown-menu animated fadeInRight">
            <span class="arrow top"></span>
            <li>
              <a href="<?php echo U('Public/logout');?>" >Logout</a>
            </li>
          </ul>
        </li>
      </ul>      
    </header>
    <section>
      <section class="hbox stretch">
        <!-- .aside -->
        <aside class="bg-dark lter aside-md hidden-print" id="nav">          
          <section class="vbox">
            <section class="w-f scrollable">
              <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="5px" data-color="#333333">
                
                <!-- nav -->
                <nav class="nav-primary hidden-xs">
                  <ul class="nav">
                    <li  class="active">
                      <a href="<?php echo U('index/index');?>"   class="active">
                        <i class="fa fa-dashboard icon">
                          <b class="bg-danger"></b>
                        </i>
                        <span>仪表盘</span>
                      </a>
                    </li>
                    <li >
                      <a href="#layout"  >
                        <i class="fa fa-columns icon">
                          <b class="bg-warning"></b>
                        </i>
                        <span class="pull-right">
                          <i class="fa fa-angle-down text"></i>
                          <i class="fa fa-angle-up text-active"></i>
                        </span>
                        <span>用户管理	</span>
                      </a>
                      <ul class="nav lt">
                        <li >
                          <a href="<?php echo U('Member/index');?>" >                                                        
                            <i class="fa fa-angle-right"></i>
                            <span>用户列表</span>
                          </a>
                        </li>
                        <li >
                          <a href="<?php echo U('Feedback/index');?>" >                                                        
                            <i class="fa fa-angle-right"></i>
                            <span>用户反馈</span>
                          </a>
                        </li>
                      </ul>
                    </li>
                    <li >
                      <a href="#uikit"  >
                        <i class="fa fa-flask icon">
                          <b class="bg-success"></b>
                        </i>
                        <span class="pull-right">
                          <i class="fa fa-angle-down text"></i>
                          <i class="fa fa-angle-up text-active"></i>
                        </span>
                        <span>商户管理</span>
                      </a>
                      <ul class="nav lt">
                        <li >
                          <a href="<?php echo U('Shop/index');?>" >                                                        
                            <i class="fa fa-angle-right"></i>
                            <span>商户列表</span>
                          </a>
                        </li>
                      </ul>
                    </li>
                    <li >
                      <a href="#pages"  >
                        <i class="fa fa-file-text icon">
                          <b class="bg-primary"></b>
                        </i>
                        <span class="pull-right">
                          <i class="fa fa-angle-down text"></i>
                          <i class="fa fa-angle-up text-active"></i>
                        </span>
                        <span>财务管理</span>
                      </a>
                      <ul class="nav lt">
                    <li >
                      <a href="notebook.html"  >
                        <i class="fa fa-pencil icon">
                          <b class="bg-info"></b>
                        </i>
                        <span>消费记录</span>
                      </a>
                    </li>
                    <li >
                      <a href="notebook.html"  >
                        <i class="fa fa-pencil icon">
                          <b class="bg-info"></b>
                        </i>
                        <span>提现管理</span>
                      </a>
                    </li>
                  </ul>
                </nav>
                <!-- / nav -->
              </div>
            </section>
            
            <footer class="footer lt hidden-xs b-t b-dark">
              <div id="chat" class="dropup">
                <section class="dropdown-menu on aside-md m-l-n">
                  <section class="panel bg-white">
                    <header class="panel-heading b-b b-light">Active chats</header>
                    <div class="panel-body animated fadeInRight">
                      <p class="text-sm">No active chats.</p>
                      <p><a href="#" class="btn btn-sm btn-default">Start a chat</a></p>
                    </div>
                  </section>
                </section>
              </div>
              <div id="invite" class="dropup">                
                <section class="dropdown-menu on aside-md m-l-n">
                  <section class="panel bg-white">
                    <header class="panel-heading b-b b-light">
                      John <i class="fa fa-circle text-success"></i>
                    </header>
                    <div class="panel-body animated fadeInRight">
                      <p class="text-sm">No contacts in your lists.</p>
                      <p><a href="#" class="btn btn-sm btn-facebook"><i class="fa fa-fw fa-facebook"></i> Invite from Facebook</a></p>
                    </div>
                  </section>
                </section>
              </div>
              <a href="#nav" data-toggle="class:nav-xs" class="pull-right btn btn-sm btn-dark btn-icon">
                <i class="fa fa-angle-left text"></i>
                <i class="fa fa-angle-right text-active"></i>
              </a>
              <div class="btn-group hidden-nav-xs">
                <button type="button" title="Chats" class="btn btn-icon btn-sm btn-dark" data-toggle="dropdown" data-target="#chat"><i class="fa fa-comment-o"></i></button>
                <button type="button" title="Contacts" class="btn btn-icon btn-sm btn-dark" data-toggle="dropdown" data-target="#invite"><i class="fa fa-facebook"></i></button>
              </div>
            </footer>
          </section>
        </aside>
        <!-- /.aside -->
        <section id="content">
          <section class="vbox">          
            <section class="scrollable padder">
             
	            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                <li><a href="index.html"><i class="fa fa-home"></i>仪表盘</a></li>
                <li><a href="#">首页</a></li>
              </ul>
   <div class="m-b-md">
                <h3 class="m-b-none">仪表盘</h3>
                <small>欢迎使用 餐饮管理系统</small>
              </div>
    <section class="panel panel-default">
                <div class="row m-l-none m-r-none bg-light lter">
                  <div class="col-sm-6 col-md-3 padder-v b-r b-light">
                    <span class="fa-stack fa-2x pull-left m-r-sm">
                      <i class="fa fa-circle fa-stack-2x text-info"></i>
                      <i class="fa fa-male fa-stack-1x text-white"></i>
                    </span>
                    <a class="clear" href="#">
                      <span class="h3 block m-t-xs"><strong><?php echo ($data["user"]); ?></strong></span>
                      <small class="text-muted text-uc">注册人数</small>
                    </a>
                  </div>
                  <div class="col-sm-6 col-md-3 padder-v b-r b-light lt">
                    <span class="fa-stack fa-2x pull-left m-r-sm">
                      <i class="fa fa-circle fa-stack-2x text-warning"></i>
                      <i class="fa fa-bug fa-stack-1x text-white"></i>
                      <span class="easypiechart pos-abt easyPieChart" data-percent="<?php echo ($data["order"]); ?>" data-line-width="4" data-track-color="#fff" data-scale-color="false" data-size="<?php echo ($data["order"]); ?>" data-line-cap="butt" data-animate="2000" data-target="#bugs" data-update="3000" style="width: 50px; height: 50px; line-height: 50px;"><canvas width="50" height="50"></canvas></span>
                    </span>
                    <a class="clear" href="#">
                      <span class="h3 block m-t-xs"><strong id="bugs"><?php echo ($data["order"]); ?></strong></span>
                      <small class="text-muted text-uc">完成堂食订单数</small>
                    </a>
                  </div>
                  <div class="col-sm-6 col-md-3 padder-v b-r b-light">                     
                    <span class="fa-stack fa-2x pull-left m-r-sm">
                      <i class="fa fa-circle fa-stack-2x text-danger"></i>
                      <i class="fa fa-fire-extinguisher fa-stack-1x text-white"></i>
                      <span class="easypiechart pos-abt easyPieChart" data-percent="1" data-line-width="4" data-track-color="#f5f5f5" data-scale-color="false" data-size="1" data-line-cap="butt" data-animate="3000" data-target="#firers" data-update="5000" style="width: 50px; height: 50px; line-height: 50px;"><canvas width="50" height="50"></canvas></span>
                    </span>
                    <a class="clear" href="#">
                      <span class="h3 block m-t-xs"><strong id="firers"><?php echo ($data["takeaway"]); ?></strong></span>
                      <small class="text-muted text-uc">完成外卖订单数</small>
                    </a>
                  </div>
                  <div class="col-sm-6 col-md-3 padder-v b-r b-light lt">
                    <span class="fa-stack fa-2x pull-left m-r-sm">
                      <i class="fa fa-circle fa-stack-2x icon-muted"></i>
                      <i class="fa fa-clock-o fa-stack-1x text-white"></i>
                    </span>
                    <a class="clear" href="#">
                      <span class="h3 block m-t-xs"><strong><?php echo date("Y-m-d") ?></strong></span>
                      <small class="text-muted text-uc">当前时间</small>
                    </a>
                  </div>
                </div>
              </section>

            </section>
          </section>
          <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen" data-target="#nav"></a>
        </section>
        <aside class="bg-light lter b-l aside-md hide" id="notes">
          <div class="wrapper">Notification</div>
        </aside>
      </section>
    </section>
  </section>
  <script src="/Public/Main/js/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="/Public/Main/js/bootstrap.js"></script>
  <!-- App -->
  <script src="/Public/Main/js/app.js"></script>
  <script src="/Public/Main/js/app.plugin.js"></script>
  <script src="/Public/Main/js/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="/Public/Main/js/charts/easypiechart/jquery.easy-pie-chart.js"></script>
  <script src="/Public/Main/js/charts/sparkline/jquery.sparkline.min.js"></script>
  <script src="/Public/Main/js/charts/flot/jquery.flot.min.js"></script>
  <script src="/Public/Main/js/charts/flot/jquery.flot.tooltip.min.js"></script>
  <script src="/Public/Main/js/charts/flot/jquery.flot.resize.js"></script>
  <script src="/Public/Main/js/charts/flot/jquery.flot.grow.js"></script>
  <script src="/Public/Main/js/charts/flot/demo.js"></script>

  <script src="/Public/Main/js/calendar/bootstrap_calendar.js"></script>
  <script src="/Public/Main/js/calendar/demo.js"></script>

  <script src="/Public/Main/js/sortable/jquery.sortable.js"></script>
  
</body>
</html>