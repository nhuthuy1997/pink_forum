$(document).ready(function(){
  $('li.disabled').hide();
  
  $('.page a').attr('class', 'page-link');
  $('li.active').attr('class', 'page-item active');
  

  $('.first a').attr('class', 'page-link');
  $('.first').attr('class', 'page-item')

  $('.prev a').attr('class', 'page-link');
  $('.prev').attr('class', 'page-item')

  $('.next_page a').attr('class', 'page-link');
  $('.next_page').attr('class', 'page-item')

  $('.last a').attr('class', 'page-link');
  $('.last').attr('class', 'page-item')
});