Rails.application.routes.draw do
  resources :graders
  resources :projects do
    resources :grades
  end
  resources :students

  root "projects#index"
end
