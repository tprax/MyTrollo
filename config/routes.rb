Rails.application.routes.draw do
  resources :boards do
    resources :lists do 
      resources :tasks
    end
  end
end
