$(document).ready(function() {  
    
    
$(document).on('click', '.js_ask_ask', function(e) {
e.preventDefault();

var url = $(this).attr("href");
//alert(ulr);
//$(this).closest( "div" ).html('12');
//$('.inst_input').click();
var _this = $(this);

$.get( url ).done(function( response ) {
    
   // alert(response);
       
        _this.closest( "div" ).prepend(response); 
       
    
  });

}); 


$(document).on('submit', '.js_ask_form', function(e) {
  var _this = $(this);
  
    e.preventDefault();
    $.ajax({
        type     : "POST",
        cache    : false,
        url      : $(this).attr('action'),
        data     : $(this).serialize(),
        success  : function(response) {
          
            _this.closest( "div" ).html('<div class="flash"> вопрос отправлен</div>').fadeOut(1500);
        }
    });
});
    
    
$(document).on('click', '.js_show_answer_form', function(e) {
e.preventDefault();
    
    $(this).fadeOut(1);
    $(this).closest( "div" ).find('textarea').fadeIn(400);
    $(this).closest( "div" ).find('button').fadeIn(400);
    
});
    
    
    
});  