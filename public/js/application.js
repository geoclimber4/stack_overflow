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
    });
    request.fail(function(failResponse){
      console.log(failResponse)
      console.log(JSON.parse(failResponse.responseText))
// errors partial should iterate through the parsed JSON thingamabobber
// refactor to add to errors partial
    });
  });
};
