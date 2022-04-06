Rails.application.routes.draw do
  root 'cycles#index'

  resources :cycles do 
    resources :invitations, only: %i[new create] 
  end
end
