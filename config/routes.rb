Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :binary_trees, only: :create do
        get 'lowest_common_ancestor', on: :member
      end
    end
  end
end
