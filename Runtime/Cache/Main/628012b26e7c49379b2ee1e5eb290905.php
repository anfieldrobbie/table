<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en" class="bg-dark">
<head>
  <meta charset="utf-8" />
  <title>Web Application</title>
  <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" /> 
  <link rel="stylesheet" href="/Public/Main/css/bootstrap.css" type="text/css" />
  <link rel="stylesheet" href="/Public/Main/css/animate.css" type="text/css" />
  <link rel="stylesheet" href="/Public/Main/css/font-awesome.min.css" type="text/css" />
  <link rel="stylesheet" href="/Public/Main/css/font.css" type="text/css" />
    <link rel="stylesheet" href="/Public/Main/css/app.css" type="text/css" />
  <!--[if lt IE 9]>
    <script src="/Public/Main/js/ie/html5shiv.js"></script>
    <script src="/Public/Main/js/ie/respond.min.js"></script>
    <script src="/Public/Main/js/ie/excanvas.js"></script>
  <![endif]-->
</head>
<body>
  <section id="content" class="m-t-lg wrapper-md animated fadeInUp">    
    <div class="container aside-xxl">
      <a class="navbar-brand block" href="index.html">主后台</a>
      <section class="panel panel-default bg-white m-t-lg">
        <header class="panel-heading text-center">
          <strong>Sign in</strong>
        </header>
        <form action="<?php echo U('Public/login');?>" class="panel-body wrapper-lg" method="post">
          <div class="form-group">
            <label class="control-label">用户名</label>
            <input name="username" type="text" placeholder="UserName" class="form-control input-lg">
          </div>
          <div class="form-group">
            <label class="control-label">密码</label>
            <input name="password" type="password" id="inputPassword" placeholder="Password" class="form-control input-lg">
          </div>
            <div class="form-group">
           <label class="control-label">验证码</label>
            <input name="verify" type="text"  placeholder="Verify" class="form-control input-lg">
          </div>
          <div class="form-group">
          <img  class="reloadverify verifyimg" src="<?php echo U('Public/verify');?>" placeholder="请填写验证码" autocomplete="off">
          </div>
          <button type="submit" class="btn btn-primary">Sign in</button>
          <div class="line line-dashed"></div>
        </form>
      </section>
    </div>
  </section>
  <!-- footer -->
  <footer id="footer">
    <div class="text-center padder">
      <p>
        <small>Web app framework base on Bootstrap<br>&copy; 2013</small>
      </p>
    </div>
  </footer>
  <!-- / footer -->
  <script src="/Public/Main/js/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="/Public/Main/js/bootstrap.js"></script>
  <!-- App -->
  <script src="/Public/Main/js/app.js"></script>
  <script src="/Public/Main/js/app.plugin.js"></script>
  <script src="/Public/Main/js/slimscroll/jquery.slimscroll.min.js"></script>
  <script>
  $(function(){
  	
   $(".reloadverify").click(function(){
   	            var verifyimg = $(".verifyimg").attr("src");
                if( verifyimg.indexOf('?')>0){
                    $(".verifyimg").attr("src", verifyimg+'&random='+Math.random());
                }else{
                    $(".verifyimg").attr("src", verifyimg.replace(/\?.*$/,'')+'?'+Math.random());
                }
  }); 	
  	
  	
  })

  </script>
</body>
</html>