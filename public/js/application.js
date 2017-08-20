$(document).ready(function() {
  createAnswer();
  newQuestion();
  postQuestion();
  newQuestionComment();
  postQuestionComment();
  deleteQuestionComment();
  newAnswerComment();
  postAnswerComment();
  deleteAnswerComment();
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
      $('.question-list').append(response)
      $(formTarget)[0].reset()
      $(formTarget).hide();
      $('#new-question-form').show();

    })
  })
}

var newQuestionComment = function(){
  $('#q-comment').on('submit', function(event){
    event.preventDefault();
    
    var $form = $(this);
    var url = $form.attr('action');
    var method = $form.attr('method');
    
    var request = $.ajax({
      url: url,
      method: method
    })
    request.done(function(response){
      $form.before(response);
      $form.hide();
    })
  })
};

var postQuestionComment = function(){
  $('.question-comment-new').on('submit', '#post-q-comment', function(event){
    event.preventDefault();
    
    var $form = $(this)
    var url = $form.attr('action');
    var method = $form.attr('method');
    var data = $form.serialize();
  
    var request = $.ajax({
      url: url,
      method: method,
      data: data
    })
    request.done(function(response){
    $('.question-comments').children('ul').append(response);
    $form[0].reset();
    $form.hide();
    $('#q-comment').show();
    });
    request.fail(function(failResponse){
      alert(failResponse.responseText)
    });

  })
};

var deleteQuestionComment = function(){
  $('.question-comments').on('submit', '.delete-comment', function(event){
    event.preventDefault();
    
    var $deleteForm = $(this);
    var url = $deleteForm.attr('action');
    
    var request = $.ajax({
      url: url,
      method: 'DELETE'
    })
    request.done(function(response){
    $deleteForm.prev().remove();
    $deleteForm.remove();
    })

  })
};

var newAnswerComment = function(){
  $('.all-answers').on('submit', '#add-answer-comment', function(event){
    event.preventDefault();

    var $addForm = $(this)
    var url = $addForm.attr('action')

    var request = $.ajax({
      url: url,
      method: 'GET'
    })
    request.done(function(response){
      $addForm.before(response);
      $addForm.hide();
    })
  })
};

var postAnswerComment = function(){
  $('.all-answers').on('submit', '#post-answer-comment', function(event){
    event.preventDefault();
    
    var $postForm = $(this)
    var url = $postForm.attr('action');
    var method = $postForm.attr('method');
    var data = $postForm.serialize();
    console.log(data);

    var request = $.ajax({
      url: url,
      method: method,
      data: data
    })
    request.done(function(response){
      console.log(response);
    });
    request.fail(function(failResponse){
      alert(failResponse.responseText)
    })
  });
};

var deleteAnswerComment = function(){
  $('.answer-comments').on('submit', '.delete-comment', function(event){
    event.preventDefault();
    
    var $deleteForm = $(this);
    var url = $deleteForm.attr('action');
    
    var request = $.ajax({
      url: url,
      method: 'DELETE'
    })
    request.done(function(response){
    $deleteForm.prev().prev().remove();
    $deleteForm.remove();
    })

  })
};

