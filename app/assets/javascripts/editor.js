$(document).on('turbolinks:load', function() {
  $( document ).ready(function(){
    $('.editable').bind('input propertychange', function() {
      console.log(this);
      $("#topic_" + $(this).attr("data-field-id")).val($(this).html().replace("#{params[:content]}", "content"));
    });
  });
});
