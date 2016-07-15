// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//
//= require_tree .


// $(document).on('click', '._sign_in', function(e) {
  
  $(document).ready(function() {  
 //$(document).on('page:change', function() {  
 
 $(document).on('click', '.lite_button',  function(e) {
   
  e.preventDefault();
  
  $(this).hide();
  
  $(this).parent().find('.lite_form').show();
   
});
  
  
  $(document).on('submit', '.js_lite_submit', function(e) {
  var _this;
    e.preventDefault();
   
    _this = this;
    // alert('111');
    var formData;
    formData = new FormData($(this)[0]);
    
    console.log (formData);
   
    return   $.ajax({
      //url:"/api/createpost",
    url: $(this).attr('action'),
      type: 'POST',
      data: formData,
      async: true,
      success: function(response) {
          
         $(_this).hide();
         $(_this).parent().html('вы присоединилсь к проекту')
        // $('.new').prepend(response);
        // $('.js_submit')[0].reset();
        // $('.css_form_for_post_display_none').fadeOut(300);
        // $('.add_menu_on').removeClass('active');
        // $('.add_menu_on').find('a').text('добавить пост');
        // $(_this).find('.image_preview').attr("src", '');
        // $(_this).find('.add_foto_menu').css("display","block");
        // $('.js_add_form_for_post').removeClass('active');
          
        // $('.send').fadeIn(1000);
        // $('.send_text').html('');
         
        
         
      },
     cache: false,
      contentType: false,
      processData: false
  });
   
 });
 
 
 
 
 
 var youtube;
youtube = function() {   
    
    
 $(".youtube").each(function() {
        
        
        // определение миниатюры
        $(this).css('background-image', 'url(http://i.ytimg.com/vi/' + this.id + '/sddefault.jpg)');

        // значок Play поверх миниатюры
        // $(this).append($('<div/>', {'class': 'play'}));

        $(document).delegate('#'+this.id, 'click', function() {
            // iframe со включенной опцией autoplay
            var iframe_url = "https://www.youtube.com/embed/" + this.id + "?autoplay=1&autohide=1&rel=0";
           // if ($(this).data('params')) iframe_url+='&'+$(this).data('params');

            // Высота и ширина iframe
            var iframe = $('<iframe/>', {'frameborder': '0', 'src': iframe_url });

            // Замена миниатюры плеером
            $(this).replaceWith(iframe);
        });
    });
    
    

 }; //конец youtube
    
    
youtube ();
 
 
 
 
 
 
 
 
 
 
 
     
var tempScrollTop, currentScrollTop = 0;

$(window).scroll(function(){

currentScrollTop = $(window).scrollTop();


if (tempScrollTop < currentScrollTop ){
//scrolling down
//alert('down');
$('.title_all').removeClass('fixed');

}else if (tempScrollTop > currentScrollTop ){
//scrolling up
//alert('up');

$('.title_all').addClass('fixed');
}
tempScrollTop = currentScrollTop;

if ( currentScrollTop == 0){
    $('.title_all').removeClass('fixed');
}

});




var count = 0;
var hold = true;

$(window).scroll(function(){
    
    
    var pr_hwin = $(window).height();
    var pr_hdoc = $(document).height();
    var pr_scr = $(window).scrollTop();
    var raz = pr_hdoc - pr_hwin
     $('.fixed100').html('raz' + raz +'<br>scr' + pr_scr + '<br>win' + pr_hwin + '<br>doc' + pr_hdoc  + '<br><br>');
   // alert(document.location.pathname);
   
	
    if  ($(window).scrollTop() >= $(document).height() - $(window).height() - 500){
                       
                       
                //if   (hold){    
                 if   (false){          
                        hold = false;
                        count++;
//alert(count);
     
        var url = document.location.pathname
       // if (url == "/") {
       // url ='/user'
       // };
        
        $.post( url, {  page: count })
  .done(function( response ) {
    
   // alert(response);
       
     //   $('.yield').append(response);
      //  more();
      //  youtube ();
         hold = true;
    
  });
                }
        
    }
    
}); 
            


$(document).on('click', '.js_test',  function(e) {
       e.preventDefault();
        var email = $(this).parents('.email_enter').find('input[name="email"]').val()
         $.ajax({
          type: "POST",
          url: '/enter',
        data:  { email:  email  },
         // data:  { email:  $('input[name="email"]').val()  },
          success: (function( response ) {
    if (response == "error"){
        
        $('.css_label_enter').addClass('error').html('неверный формат e-mail');
        
        //alert(response);
    }else{
        $('.css_enter').html(response);
        
    }
    
    
   // alert(response);
       
        
       }),
          dataType: 'text'
          });
     
});   
    
$(document).on('click', '.link_burger',  function(e) {
   e.preventDefault();
   //alert ('12123');

 
  
  $('.yield').css("display","none");
  $('.title_display').css("display","none");
  $('.menu').css("display","block");
  

});

$(document).on('click', '.close_burger',  function(e) {
   e.preventDefault();
   //alert ('12123');

 $('.menu').css("display","none");
  $('.title_display').css("display","block");
  $('.yield').css("display","block");

});



$(document).on('click', '.js_add_form_for_post',  function(e) {
   e.preventDefault();
   //alert ('12123');

 
 if ($('.js_add_form_for_post').hasClass('active')) {
     
     $('.js_add_form_for_post').removeClass('active');
 $('.css_form_for_post_display_none').css("display","none");
 
 } else{
     $('.js_add_form_for_post').addClass('active');
  $('.css_form_for_post_display_none').css("display","block");
 };

});




$(document).on('click', '.js_delete',  function(e) {
   var _this;
  e.preventDefault();
   _this = $(this);
   //alert (_this.html());
var url;
url = $(this).attr('href');
//alert(url);
    return   $.ajax({
      url: url,
    //url: $(this).attr('action'),
      type: 'POST',
      data: '',
      async: true,
      success: function(response) {
 
_this.parents('.post').fadeOut(400);

       },
     cache: false,
      contentType: false,
      processData: false
  });
});


$(document).on('click', '.js_button_edit',  function(e) {
   var _this;
  e.preventDefault();
   _this = $(this);
   //alert (_this.html());
var url;
url = $(this).attr('href');
//alert(url);
    return   $.ajax({
      url: url,
    //url: $(this).attr('action'),
      type: 'POST',
      data: '',
      async: true,
      success: function(response) {
 //alert ('success');
_this.parents('.post').html(response);
youtube ();
more();
       },
     cache: false,
      contentType: false,
      processData: false
  });
});



  
$(document).on('submit', '.js_form_edit', function(e) {
  var _this;
    e.preventDefault();
   
    _this = this;
   var url = $(this).attr('action');
    // alert(url);
    var formData;
    formData = new FormData($('.js_form_edit')[0]);
    
    //$('.send').css("display","none");
    //$('.send_text').html('отправляем...');
    
    console.log (formData);
    console.log ($(".www").val());
    return   $.ajax({
      url: url,
    //url: $(this).attr('action'),
      type: 'POST',
      data: formData,
      async: true,
      success: function(response) {
          $(_this).parents('.post').html(response);
         
        
         youtube ();
         more();
         
         
      },
     cache: false,
      contentType: false,
      processData: false
  });
   
 });






$(document).on('click', '.js_read',  function(e) {
   var _this;
  e.preventDefault();
   _this = $(this);
   //alert (_this.html());
var url;
url = $(this).attr('href');
//alert(url);
    return   $.ajax({
      url: url,
    //url: $(this).attr('action'),
      type: 'POST',
      data: '',
      async: true,
      success: function(response) {
 
 //alert (_this.html());
if (_this.html() == 'читаю') {
    _this.removeClass('active');
    _this.html('читать');
    
  } else {
      // alert ('31231');
    _this.addClass('active');
    _this.html('читаю');
    
  }
       },
     cache: false,
      contentType: false,
      processData: false
  });
});





  
$(document).on('submit', '.js_submit', function(e) {
  var _this;
    e.preventDefault();
   
    _this = this;
    // alert('111');
    var formData;
    formData = new FormData($('.js_submit')[0]);
    
    $('.send').css("display","none");
    $('.send_text').html('отправляем...');
    
    console.log (formData);
    console.log ($(".www").val());
    return   $.ajax({
      url:"/api/createpost",
    //url: $(this).attr('action'),
      type: 'POST',
      data: formData,
      async: true,
      success: function(response) {
         $('.new').prepend(response);
         $('.js_submit')[0].reset();
         $('.css_form_for_post_display_none').fadeOut(300);
        // $('.add_menu_on').removeClass('active');
        // $('.add_menu_on').find('a').text('добавить пост');
         $(_this).find('.image_preview').attr("src", '');
         $(_this).find('.add_foto_menu').css("display","block");
         $('.js_add_form_for_post').removeClass('active');
          
         $('.send').fadeIn(1000);
         $('.send_text').html('');
         
         youtube ();
         more ();
         
         
      },
     cache: false,
      contentType: false,
      processData: false
  });
   
 });



var more;
more = function() { 

$('.post_in').each(function() {
    
   
  if (+($(this).css('height').replace('px', '')) > 308) {
     $(this).parents('.post').find('.post_full').css('display', 'block');
     $(this).parents('.post').find('.js_read').css('display', 'none');
     $(this).parents('.post').find('.js_delete').css('display', 'none');
     $(this).parents('.post').find('.js_ad_delete').css('display', 'none');
     
  }
});  

};

more();







$('body').on('click', '.post_full', function(e) {
  e.preventDefault();
 
    //$(this).parents('.post_in').addClass('full');
     $(this).parents('.post').find('.post_in').addClass('full');
    $(this).css('display', 'none');
    $(this).parents('.post').find('.js_read' ).css('display', 'block');
    $(this).parents('.post').find( '.js_delete').css('display', 'block');
    $(this).parents('.post').find( '.js_ad_delete').css('display', 'block');
  
});

$(document).on('click', '.js_add_post_picture', function(e) {
e.preventDefault();

$(this).parent().find(".post_picture_input").click();

//$(".post_picture_input").click();

 });
 
 
$(document).on('change', '.post_picture_input', function() {
   var input = $(this)[0];
    if ( input.files && input.files[0] ) {
        if ( input.files[0].type.match('image.*') ) {
            var reader = new FileReader();
            reader.onload = function(e) {
                
                
                $('.add_foto_menu').css("display","none");
                
                $('.image_preview').attr('src', e.target.result);
                
            }
            reader.readAsDataURL(input.files[0]);
        } else console.log('is not image mime type');
    } else console.log('not isset files data or files API not supordet');
});


$(document).on('submit', '.js_ad_submit', function(e) {
  var _this;
    e.preventDefault();
   
    _this = this;
    // alert('111');
    var formData;
    formData = new FormData($('.js_ad_submit')[0]);
    
    $('.send').css("display","none");
    $('.send_text').html('отправляем...');
    
   // console.log (formData);
   // console.log ($(".www").val());
    return   $.ajax({
      url:"/api/createad",
    //url: $(this).attr('action'),
      type: 'POST',
      data: formData,
      async: true,
      success: function(response) {
         $('.new').prepend(response);
         $('.js_ad_submit')[0].reset();
         $('.css_form_for_post_display_none').fadeOut(300);
        // $('.add_menu_on').removeClass('active');
        // $('.add_menu_on').find('a').text('добавить пост');
        // $(_this).find('.image_preview').attr("src", '');
        // $(_this).find('.add_foto_menu').css("display","block");
         $('.js_add_form_for_post').removeClass('active');
          
         $('.send').fadeIn(1000);
         $('.send_text').html('');
         
        // youtube ();
         more ();
         
         
      },
     cache: false,
      contentType: false,
      processData: false
  });
   
 });
 
 
$(document).on('click', '.js_ad_delete',  function(e) {
   var _this;
  e.preventDefault();
   _this = $(this);
   //alert (_this.html());
var url;
url = $(this).attr('href');
//alert(url);
    return   $.ajax({
      url: url,
    //url: $(this).attr('action'),
      type: 'POST',
      data: '',
      async: true,
      success: function(response) {
 
_this.parents('.post').fadeOut(400);

       },
     cache: false,
      contentType: false,
      processData: false
  });
});




});   