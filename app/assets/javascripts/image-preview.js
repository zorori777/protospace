$(document).on('turbolinks:load', function() {
  $(function(){
    var setFileInput = $('.js-imgInput');
    setFileInput.each(function(){

      var preview = $(this),
      selfInput = $(this).find('input[type=file]');
      selfInput.change(function(){

        var file = $(this).prop('files')[0],
        fileReader = new FileReader();

        if(!this.files.length){
          return;
        }
        else {
          if(file.type.match('image.*')){
            var preEditImage = preview.find('.preEditImage, .user-image-size');

            fileReader.onload = function() {
              preview.css({'background-image':'url('+ fileReader.result+')'});
              preEditImage.css({'display':'none'})
            }
            fileReader.readAsDataURL(file);
          }
        }
      });
    });
  });
});
