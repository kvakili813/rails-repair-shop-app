$(function(){
  deleteJob();
});

function deleteJob(){
  $(document).on('click', 'button.delete.btn-danger', function(event){
    event.preventDefault();
    let job_id = parseInt(event.target.id)

    // var item = this;
    var url = this.attributes.href.value;
    // var pending_url = '/jobs?state=pending';
    // var completed_url = '/jobs?state=completed';
    // if ($('#pending-header').text() === "Your Pending Jobs:"){
    //  pending_url = '/jobs?state=pending&scoped=true';
    //  completed_url ='/jobs?state=completed&scoped=true';
   //  }
    $.ajax({
      type: "DELETE",
      url: url,
      data: {id: job_id},
      complete: function(){
      // refresh list of jobs

      appendAllJobs();
        // $(item).parent().hide(500);
      }
    });
  })
}
