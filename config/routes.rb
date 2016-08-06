Rails.application.routes.draw do
  resources :graders
  resources :projects
  resources :students

  root "projects#index"
end
