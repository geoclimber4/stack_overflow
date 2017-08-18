$(document).ready(function() {
  createAnswer();
  newQuestion();
  postQuestion();
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

var newQuestion = function(){
  $('#new-question-form').on("submit", function(event){
    event.preventDefault()

    var formTarget = $(this);
    var url = formTarget.attr('action');
    var method = formTarget.attr('method');

    var request = $.ajax({
      url: url,
      type: method
    })

    request.done(function(response){
      $(formTarget).before(response)
      $(formTarget).hide()
    })
  })
}

var postQuestion = function(){
  $('.container').on('submit', '#question-new', function(e){
    e.preventDefault();
    console.log('jimmy')

    var formTarget = $(this);
    var url = formTarget.attr('action');
    var method = formTarget.attr('method');
    var data = formTarget.serialize();

    var request = $.ajax({
      url: url,
      type: method,
      data: data
  })
    request.done(function(response){
      console.log(response)
      $('.question-list').append(response)
      $(formTarget)[0].reset()
      $(formTarget).hide();
      $('#new-question-form').show();

    })
  })
}
