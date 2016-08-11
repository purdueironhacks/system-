Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :graders
  resources :graders
  resources :projects do
    resources :grades
  end
  resources :students

  root to: "projects#index"
end
