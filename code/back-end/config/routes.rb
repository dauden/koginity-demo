Rails.application.routes.draw do
  namespace :admin do
    get 'login/index'
    get '/' => 'login#index'
    post '/' => 'login#index'

    get 'product/' => 'product#list'
    get 'product/list'
    get 'product/add'
    post 'product/add'  => 'product#add'
    get 'product/edit/:id' => 'product#edit'
    post 'product/edit/:id' => 'product#edit'
    get 'product/detail'
    get 'product/delete/:id' => 'product#delete'
  end

  get 'product/index'  => 'product#list'

  get 'product/:id' => 'product#detail'
  get '/'  => 'product#list'
  post '/'  => 'product#list'
end
