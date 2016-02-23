 $(document).ready(function() {  
  
  $('.grid').masonry({
    // options...
    itemSelector: '.grid-item',
    columnWidth: 300,
    fitWidth: true
  });
  
  
  
  
  $(document).on('click', '.js_g_enter_button', function(e) {
e.preventDefault();

$(this).fadeOut(200);
$('.g_enter').fadeIn(200);
 

}); 

$(document).on('click', '.js_g_enter_form', function(e) {
e.preventDefault();

$(this).fadeOut(200);
$('.g_enter_form').fadeIn(200);

 

}); 

  


  });
