Rails.application.routes.draw do
  devise_for :repairmen, :controllers => {registrations: 'registrations'}


get '/' => 'repairmen#home'

  resources :customers, except: [:show, :destroy]

  resources :repairmen, only: [:show] do
    resources :jobs
  end

  post '/jobs' => 'jobs#create'
  post '/complete' => 'tickets#complete'

  get '/auth/facebook/callback' => 'sessions#create'

  get '/tickets/price_order', to: 'tickets#ticket_price'

  get '/jobs' => 'jobs#jobs'
 get '/get_repairman_pending_jobs' => 'jobs#repairman_pending_jobs'
 get '/get_repairman_completed_jobs' => 'jobs#repairman_completed_jobs'
 get '/repairman_job_path' => 'jobs#show'
end
