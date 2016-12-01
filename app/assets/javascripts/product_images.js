$(document).on('turbolinks:load', function() {
  $(function(){
    // inputに変化があったらスタート
    $('#product_images_attributes_0_image').on('change', function() {
      var obj = this.files;
      Object.keys(obj).forEach(function(key) {
        var reader = new FileReader();
        var val = this[key];
        reader.readAsDataURL(val);
        reader.addEventListener('load', function(){
          $('#selected-images').append('<li><img src ='+reader.result+'></li>');
        })
      }, obj);
    });
  });

  $(function(){
    $('#product_images_attributes_0_images').on('change', function() {
      var obj = this.files;
      Object.keys(obj).forEach(function(key) {
        var reader = new FileReader();
        var val = this[key];
        reader.readAsDataURL(val);
        reader.addEventListener('load', function(){
          $('#selected-images').append('<li><img src ='+reader.result+'></li>');
        })
      }, obj);
    });
  });
});
