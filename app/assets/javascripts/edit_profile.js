$(document).on('turbolinks:load', function() {

  $(function(){
    var reader = new FileReader();
    // inputに変化があったらスタート
    $('#user_company_attributes_logo').on('change', function() {
      // filesの0番目を読み込む
      reader.readAsDataURL(this.files[0]);
      // 読み込みが終わったらスタート
      reader.addEventListener('load', function(){
        $('#js-logo').attr('src', reader.result);
      });
    });
  });

  $(function(){
    var reader = new FileReader();
    // inputに変化があったらスタート
    $('#user_company_attributes_cover_image').on('change', function() {
      // filesの0番目を読み込む
      reader.readAsDataURL(this.files[0]);
      // 読み込みが終わったらスタート
      reader.addEventListener('load', function(){
        $('#js-cover_image').attr('src', reader.result);
      });
    });
  });

});
