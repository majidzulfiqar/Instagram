Rails.application.routes.draw do
  root 'application#index'
  get  '/callback' => 'landing#callback'
  get  '/profile' => 'landing#profile'
  get  '/logout' => 'landing#logout'
end
