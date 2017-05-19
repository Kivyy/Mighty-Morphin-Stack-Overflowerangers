$(document).ready(function() {
  $(".question-comment-link").on("click", function( event ) {
    event.preventDefault();
    $(".question-comment-form").css("display", "block");
    $(this).hide();
  });

  $(".answer-comment-link").on("click", function( event ) {
    event.preventDefault();
    $(".answer-comment-form").css("display", "block");
    $(this).hide();

  });

  // $(".question-comment-link").on("click", function() {
  //   event.preventDefault();
  //   var $link = $(this)
  //   $.ajax({
  //    method: 'get',
  //    url: '/comments/new'
  //   }).done(function(response){
  //    $(".question-comment-link").parent().append(response);
  //  });
  // });
});
