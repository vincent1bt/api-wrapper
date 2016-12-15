Rails.application.routes.draw do

  get '/' => redirect("/v1/pages")

  scope module: "api" do
    namespace :v1 do
      resources :pages
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
