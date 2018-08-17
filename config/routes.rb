Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "short_links#index"

  resource :short_links, only: [:create, :show]
end
