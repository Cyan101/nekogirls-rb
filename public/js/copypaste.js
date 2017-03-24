$(function(){
  $('.demo-noninputable').pastableNonInputable();
  $('.demo-textarea').on('focus', function(){
    var isFocused = $(this).hasClass('pastable-focus');
    console && console.log('[textarea] focus event fired! ' + (isFocused ? 'fake onfocus' : 'real onfocus'));
  }).pastableTextarea().on('blur', function(){
    var isFocused = $(this).hasClass('pastable-focus');
    console && console.log('[textarea] blur event fired! ' + (isFocused ? 'fake onblur' : 'real onblur'));
  });
  $('.demo-contenteditable').pastableContenteditable();
  $('.demo').on('pasteImage', function(ev, data){
    var blobUrl = URL.createObjectURL(data.blob);
    var textfield = document.getElementById('text_to_decode');
    textfield.value = (data.dataURL);
  }).on('pasteImageError', function(ev, data){
    alert('Oops: ' + data.message);
    if(data.url){
      alert('But we got its url anyway:' + data.url)
    }
  }).on('pasteText', function(ev, data){
  });
});
