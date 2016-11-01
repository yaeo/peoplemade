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
      // idに応じて画像を読み込み結果に差し替え
      if (id == "story_topics_attributes_0_image") {
        $('#1-image').attr('src', reader.result);
      } else if (id == "story_topics_attributes_1_image") {
        $('#2-image').attr('src', reader.result);
      } else if (id == "story_topics_attributes_2_image") {
        $('#3-image').attr('src', reader.result);
      } else if (id == "story_topics_attributes_3_image") {
        $('#4-image').attr('src', reader.result);
      }
    });
  });
});
