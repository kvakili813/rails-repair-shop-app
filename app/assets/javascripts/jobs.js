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

function populateList(jobs){
  var str = "";
  str = iterateJobs(jobs);
  return str;
}
