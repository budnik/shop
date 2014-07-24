Rails.application.routes.draw do
  resources :prices
  scope :api do
    resources :prices do
      resources :products, only: :index
    end
  end

  root 'prices#index'
  get '*anything' => 'prices#index'
end
