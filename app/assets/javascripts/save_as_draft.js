$(document).on('turbolinks:load', function() {
  // 下書き保存ボタンを押されたらstatusをdraftに変更する
  $('#js-save-as-draft').on('click', function() {
    $('#story_status').attr('value', "draft");
  });
  // 申請ボタンを押されたらstatusをinreviewに変更する
  $('#js-save-as-inreview').on('click', function() {
    $('#story_status').attr('value', "inreview");
  });
});
