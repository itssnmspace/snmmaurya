Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  namespace :sunspot do
    resources :searches do
      collection do
        get :advance_search
      end
    end
  end
  resources :portfolios

  resources :about, only: :index

  resources :topics do
    resources :problems do
      resources :solutions
    end
  end

  resources :books do
    resources :book_contents
  end

  resources :blogs do
    collection do
      get :advance_search
    end  
    resources :comments
  end

  resources :rubyists

  #scoping is the way to just remove namespaces
  #path: /contat
  #route: contact_path
  scope :module => "pages" do
    # get :contact
    # post :create_contact
    get :terms
    get :policies
    get :pages
  end

  resources :downloads, only: :index do
    collection do
      get :downloader
    end
  end

  resources :messages
  resources :studies do
    resources :lessions
  end


  resources :users do
    member do
      get :problems
      get :solutions
    end
  end

  namespace :api do
    namespace :v1 do
      resources :welcome

      resources :topics do
        resources :problems do
          resources :solutions
        end
      end
    end
  end

  #action cable running status
  mount ActionCable.server => '/cable'

  #Sidekiq on web
  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  namespace :spa do
    root :to => 'spa#index', :as => :root_with_locale
    resources :spa
    resources :dummies
  end
end