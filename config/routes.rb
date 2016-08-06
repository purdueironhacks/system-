Rails.application.routes.draw do
  resources :projects
  resources :students

  root "projects#index"
end
