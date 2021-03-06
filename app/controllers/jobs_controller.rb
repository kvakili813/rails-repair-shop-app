class JobsController < ApplicationController
  before_action :set_repairman, except: :create
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def new
    @job = Job.new
    3.times do
      @job.tickets.build
    end
  end

  def create
    @job = Job.new(job_params)
    @repairman = Repairman.find_by(id: params[:job][:repairman_id])
    if @job.save
      redirect_to repairman_job_path(@repairman.id, @job.id)
    else
      render 'new'
    end
  end

  def show
    @job = []
    @job << Job.find(params[:id])
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to repairman_job_path(@job.repairman.id, @job.id)
    else
      render 'edit'
    end
  end

  def destroy
    @job.destroy
    redirect_to '/'
  end

  private

    def set_job
      @job = Job.find(params[:id])
    end

    def set_repairman
      @repairman = Repairman.find_by(id: params[:repairman_id])
    end

    def job_params
      params.require(:job).permit(:repairman_id, :customer_id, :location, tickets_attributes: [:description, :price, :id])
    end

end
