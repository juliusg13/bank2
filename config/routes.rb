Rails.application.routes.draw do
	devise_for :users, :controllers => { registrations: 'registrations' }
	devise_scope :user do
		get 'sign_in', to: 'devise/sessions#new'
	end
  resources :users do
	  resources :transfers
  end
	namespace :v1 do
		resources :users do
			resources :transfers, shallow: true
		end
	end

	root to: "home#index"
end
