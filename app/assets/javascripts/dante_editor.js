$(document).on('turbolinks:load', function() {
  $( document ).ready(function(){
    $('#editor').bind('input propertychange', function() {
      $("#topic_" + $(this).attr("data-field-id")).val($(this).html().replace("#{params[:content]}", "content"));
    });
  });
});
