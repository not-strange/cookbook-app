Rails.application.routes.draw do
  get '/one' => 'recipes#one'
  get '/all' => 'recipes#all'
end
