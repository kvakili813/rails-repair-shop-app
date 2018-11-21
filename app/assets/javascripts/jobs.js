$(function(){
  homeButton();
  profileButton();
});

function homeButton(){
  $(document).on('click', '#home-button', function(event){
    event.preventDefault();

    setHeaders("All");
    appendPendingJobs('/jobs?state=pending');
    appendCompletedJobs('/jobs?state=completed');
  });
}

function profileButton(){
  $(document).on('click', '#profile-button', function(event){
    event.preventDefault();
    setHeaders("Your");
    appendPendingJobs('/jobs?state=pending&scoped=true');
    appendCompletedJobs('/jobs?state=completed&scoped=true');
  });
}

function appendPendingJobs(url){
  $.get(url
    ).done(function(jobs){
      $('#pending-list').html(populateList(jobs));
  });
}

function appendCompletedJobs(url){
  $.get(url
    ).done(function(jobs){
      $('#completed-list').html(populateList(jobs));
    });
}

function appendAllJobs(){
  $.get('/jobs')
  .done(function(jobs){
    $('#completed-list').html(populateList(jobs));
  })

}

function populateList(jobs){
  var str = "";
  str = iterateJobs(jobs);
  return str;
}

function iterateJobs(jobs){
  var str = "<ul>";
  jobs.forEach(function(job){
    var job_id = job.id;
    var link_path = '/repairmen/' + job['repairman']['id'] + '/jobs/' + job['id'];
    str += '<li>Repairman: ' + job['repairman']['name'] + '<br>';
    str += 'Customer: ' + job['customer']['name'] + '<br>';
    str += '<ul>';
    str += iterateTickets(job['tickets']);
    str += '</ul>';
    str += '<button class="edit btn-info" href="' + link_path + '/edit">Edit Job</button>  |  ';
    str += '<button ' + `id=${job_id} ` + 'class="delete btn-danger" href="' + link_path + '">Delete Job</button> | ';
    str += '<button class="read-more btn-more" href="' + link_path + '/show">Read More</button> <br><br>';
    str += '</li>';
  });
  str += '</ul>';
  return str;
}

function iterateTickets(orders){
  var str = "";
  orders.forEach(function(order){
    str += '<li>' + order['description'] + ', ';
    str += '$' + order['price'] + ', ';
    str += '<strong>' + order['status'] + '</strong>'
    if(order['status'] === 'pending'){
      str += ', mark complete? <input type="checkbox" name="ids[]" value="' + order['id'] + '">';
    }
    str += '</li>';
  });
  return str;
}

function setHeaders(arg){
  $('#pending-header').text(arg + " Pending Jobs:");
  $('#completed-header').text(arg + " Completed Jobs:");
}
