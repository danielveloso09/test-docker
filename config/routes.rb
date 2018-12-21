# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'reports#index'

  # Devise routes
  devise_for :users
  devise_scope :user do
    get 'sign_out', to: 'devise/sessions#destroy'
  end

  resources :reports

  # for 3rd parties
  namespace :api do
    # authentication
    resource :sessions, only: %i[create destroy]
    # fetch reports
    namespace :v1 do
      get 'reports', to: 'reports#filter'
    end
  end
end
