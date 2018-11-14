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
