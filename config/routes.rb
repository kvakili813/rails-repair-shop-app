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


end
