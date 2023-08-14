Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      root "support_ticket#create"
      resources :support_tickets, only: [:index, :create, :update] do
          resources :responses, only: [:create]
      end
    end
  end
end
