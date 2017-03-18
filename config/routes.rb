Rails.application.routes.draw do
	devise_for :users, :controllers => { registrations: 'registrations' }
	devise_scope :user do
		get 'sign_in', to: 'devise/sessions#new'
	end
  resources :users

	root to: "home#index"
end
