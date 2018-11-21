$(function(){
  createJob();
});

function createJob(){
  $(document).on('click', '#create-job', function(event){
    event.preventDefault();
    var url = window.location.pathname.slice(0, -3);
    // var data = $('form').serialize();
    // $.post('url', data()
    // ).done(function(data){
    $.post(url, $('form').serialize()
     ).done(function(data){
        var job = data['id'];
        var str = '<li>Repairman: ' + data['repairman']['name'] + '</li>';
        str += '<li>Customer: ' + data['customer']['name'] + '</li>';
        str += '<li>Location: ' + data['location'] + '</li>';
        str += '<li>Tickets:<ul>';
        data['tickets'].forEach(function(order){
          str += '<li>Description: ' + order['description'] + '</li>';
          str += '<li>Price: $' + order['price'] + '</li>';
        });
        str += '</ul></li>';
        $('#new-ajax-jobs').append(str);
        $('input[type=text]').val('');
      });
  });
}
