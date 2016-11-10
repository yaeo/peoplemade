$(document).on('turbolinks:load', function() {
  $(function(){
    var reader = new FileReader();
    // inputに変化があったらスタート
    $('.image-selector').on('change', function() {
      // 変化があったもののidを取得
      var id = this.getAttribute("id");
      // filesの0番目を読み込む
      reader.readAsDataURL(this.files[0]);
      // 読み込みが終わったらスタート
      reader.addEventListener('load', function(){
        $('#regulation-image').attr('src', reader.result);
      });
    });
  });
});
