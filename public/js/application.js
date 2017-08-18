$(document).ready(function() {
  createAnswer();
});

var createAnswer = function(){
  $("#add-answer-form").on("submit", function(event){
    event.preventDefault();
    // console.log("yo Ida, this is the right thing....")
    var formTarget = $(this);
    var url = formTarget.attr('action');
    var method = formTarget.attr('method');
    var data = formTarget.serialize();

    var request = $.ajax({
      url: url,
      type: method,
      data: data
    })
    request.done(function(response) {
      $(".all-answers ul").append(response);
      console.log(response)
      // below code works, not sure if it's poor form? Javascript method on a Jquery Object
      $("#add-answer-form")[0].reset();
    });
    request.fail(function(failResponse){
      console.log(failResponse)
      var karlStuff = JSON.parse(failResponse.responseText)
      console.log(karlStuff)
      alert(karlStuff.errors)
    });
  });
};
