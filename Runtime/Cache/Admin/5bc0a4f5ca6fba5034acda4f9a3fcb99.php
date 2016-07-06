<?php if (!defined('THINK_PATH')) exit();?><link rel="stylesheet" href="/Public/static/uploadify/Huploadify.css">
<link rel="stylesheet" href="/Addons/UploadImages/style/UploadImages.css"> 
<script src="/Public/static/uploadify/jquery.Huploadify.js"></script>
<div id="upload_picture_<?php echo ($name); ?>"></div>
    <input type="hidden" name="<?php echo ($name); ?>" value="<?php echo ($valStr); ?>" class="icon <?php echo ($name); ?>" />
    <div class="upload-img-box">
        <?php if(!empty($valArr)): if(is_array($valArr)): $i = 0; $__LIST__ = $valArr;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><div class="upload-pre-item">
                    <img src="<?php echo (get_cover($v,'path')); ?>" data-id="<?php echo ($v); ?>"/>
                    <span class='btn-close btn-close-<?php echo ($name); ?>' title='删除图片'></span>
                </div><?php endforeach; endif; else: echo "" ;endif; endif; ?>
    </div>
                            <script type="text/javascript">
    //上传图片
$(function(){
    var up = $('#upload_picture_<?php echo ($name); ?>').Huploadify({
		auto:true,
                buttonText      : "上传图片",
		fileTypeExts:'*.jpg; *.png; *.gif;*.JPG;*.GIF;*.PND;*.JPEG;',
		multi:true,
                fileObjName    : "download",
                width           : 120,
                removeTimeout   : 1,
		uploader:"<?php echo U('File/uploadPicture',array('session_id'=>session_id()));?>",
		onUploadComplete:function(file,data){
                    var data = $.parseJSON(data);
                    var src = '';
                    if(data.status){
                    src = data.url || '' + data.path;
                    upload_img = "<div class='upload-pre-item'><img src=" + src +" title='点击显示大图' data-id="+data.id+"> <span class='btn-close btn-close-<?php echo ($name); ?>' title='删除图片'></span></div>";
                    picsbox = $("#upload_picture_<?php echo ($name); ?>").siblings('.upload-img-box');
                    picsbox.append(upload_img)
                    picArr = [];
                    for (var i = 0; i < picsbox.children().length ; i++) {
                    picArr.push(picsbox.children('.upload-pre-item:eq('+i+')').find('img').attr('data-id'));
                    };
                    picStr = picArr.join(',');
                    $('.icon.<?php echo ($name); ?>').val(picStr);
                    } else {
                    updateAlert(data.info);
                    setTimeout(function(){
                    $('#top-alert').find('button').click();
                    $(that).removeClass('disabled').prop('disabled',false);
                    },1500);
                    }
		},
});
           $('.btn-close-<?php echo ($name); ?>').click(function(event) {
           
            event.preventDefault();
            $(this).parent().remove();
            picsbox = $("#upload_picture_<?php echo ($name); ?>").siblings('.upload-img-box');
            picArr = [];
            for (var i = 0; i < picsbox.children().length ; i++) {
                picArr.push(picsbox.children('.upload-pre-item:eq('+i+')').find('img').attr('data-id'));
            };
            picStr = picArr.join(',');
            $('.icon.<?php echo ($name); ?>').val(picStr);
        });
        });
</script>