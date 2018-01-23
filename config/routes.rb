Rails.application.routes.draw do
  root 'landing#index'
  get  '/callback' => 'landing#callback'
  get  '/profile' => 'landing#profile'
end
