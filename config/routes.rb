Rails.application.routes.draw do
  resources :boards
  root to: "boards#new"
end
