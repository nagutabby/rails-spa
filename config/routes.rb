Rails.application.routes.draw do
  devise_for :users, :controllers => {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  resources :articles, except: [:new, :edit]
  root "home#index"
  get "/about", to: "home#about"
end
