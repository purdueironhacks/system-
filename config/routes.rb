Rails.application.routes.draw do
  devise_for :graders
  resources :graders
  resources :projects do
    resources :grades
  end
  resources :students

  root to: "projects#index"
end
