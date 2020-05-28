
class ActionDispatch::Routing::Mapper
  def draw routes_name
    instance_eval File.read(Rails.root.join("config/routes/#{routes_name}.rb"))
  end
end

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  root to: redirect("/api-docs")

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, format: :json do
    draw :v1
  end
end

# Rails.application.routes.draw do
#   mount Rswag::Ui::Engine => '/api-docs'
#   mount Rswag::Api::Engine => '/api-docs'
#   scope module: :api do
#     namespace :v1 do
#       resources :users
#       resources :tables
#     end
#   end
# end
