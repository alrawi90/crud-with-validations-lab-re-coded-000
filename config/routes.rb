Rails.application.routes.draw do
  resources :songs , only: [:index,:show,:new,:edit,:create ,:update,:destroy]
end
