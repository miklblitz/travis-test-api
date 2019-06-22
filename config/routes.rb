Rails.application.routes.draw do
  root to: 'pages#welcome'
  resources :goods
end
