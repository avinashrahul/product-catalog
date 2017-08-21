Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :rate_plans
  resources :products
  root to: 'admin/dashboard#index'
end
