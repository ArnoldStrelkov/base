$(document).ready(function() {  
    
    
$(document).on('click', '.s_enter', function(e) {
e.preventDefault();

//alert('sfdd');

$("ul li a").removeClass('yellow');
$(this).addClass('yellow');
$('.main').hide();


$('.s_login_form').show();


 }); 
    
    
    
    
    
    
    
    
    
});   