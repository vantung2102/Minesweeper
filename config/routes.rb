Rails.application.routes.draw do
  root "mine_sweepers#new"
  resources :mine_sweepers do
    collection do
      get :view_all
    end
  end
end
