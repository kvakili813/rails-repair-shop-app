$(function(){
  createJob();
});

function createJob(){
  $(document).on('click', '#create-job', function(event){
    event.preventDefault();
