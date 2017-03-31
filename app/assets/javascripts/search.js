
$(document).on('turbolinks:load', function(){
  function formSubmit(){
    $('#search-form').submit(function(e){
      debugger;
      $.ajax({
        url: $(this).attr('action'),
        type: "POST",
        data: $(this).serialize(),
      })
    });
  };
  formSubmit();
})
