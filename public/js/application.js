


$(document).ready(function() {
  $('.vote').click(function(event){
    var voteLink = $(this);
    console.log(voteLink)
    event.preventDefault();
    var url = $(this).attr('href')

    $.post(url, function(response){
      var response_value = response.post_vote.toString() + ' votes'
      voteLink.siblings('.ajaxvotes').html(response_value);
    }, "json");
  });
});


// $(document).ready(function() {
//   $('.vote').click(function(event){
//     var url = $(this).attr('href')
//     console.log(url)
//     event.preventDefault();
//   });
// });