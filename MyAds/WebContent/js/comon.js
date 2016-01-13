$(document).ready(function(e) {
	$('.nav .storecate a.allcate').removeClass('on');
	$('.nav .storecate a.allcate').click(function(e) {
		$(this).toggleClass('on');
	});
	
	$('.btn_gotop').click(function(e) {
		$('html, body').animate({scrollTop : 0},800);
		return false;
	});
	
	
	//2015-12-03
	// Area(Add_slide) when click to browse img
	 $('body').delegate('.wrap_img','click',function(){
	  $('.btn_upload').click();
	 });

	 // Preview Image when we select image already
	 $('body').delegate('#btn_uploadimg','change',function(e){
	  var files = this.files;
	  num  = files.length;
	  $('.wrap_img').removeClass('one_imge two_images three_images four_images');
	   $('.wrap_img').addClass('myicon');
	  if(num==1){
	   $('.wrap_img').addClass('one_imge');
	   $('.wrap_img').removeClass('myicon');
	  }else if(num==2){
	   $('.wrap_img').addClass('two_images');
	   $('.wrap_img').removeClass('myicon');
	  }else if(num==3){
	   $('.wrap_img').addClass('three_images');
	   $('.wrap_img').removeClass('myicon');
	  }else if(num>=4){
	   $('.wrap_img').addClass('four_images');
	   $('.wrap_img').removeClass('myicon');
	 }

	  var files = e.target.files;
	  $('.wrap_img').children('img').remove();
	  $.each(files,function(i,file){ // Open for upload multiple image
	   var reader = new FileReader();
	   reader.readAsDataURL(file); // use when upload multipe image
	   reader.onload = function(e){
	    var tem = '<img src="'+e.target.result+'">';
	    $('.wrap_img').append(tem);
	   }
	  });
	  reader.readAsDataURL(files[0]);
	 });
	 
	 
	 /* 2016-01-13 */
	 $('.btn_user').click(function(e) {
		 	alert(1);
			$('.profile_setting').toggleClass('on');
	 });
	
});