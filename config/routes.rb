Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :graders
  resources :graders
  resources :projects do
    resources :grades

    get 'novelty_fields' => 'grades#new_novelty_fields'
    post 'novelty_fields' => 'grades#create_novelty_fields'
  end
  resources :students

  root to: "projects#index"
end
