Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #format is::
  #<type of html request> '<name that you want the route to have>, to: '<controller_name>#<controller_method_name>'
  #get 'main', to: 'application#main'

  MainsController::ENDPOINTS.each do |endpoint_name|
    get endpoint_name, to: "mains##{endpoint_name}"
  end

  resources :files, only: [:show]
end
