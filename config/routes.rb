Rails.application.routes.draw do
  devise_for :users
  resources :courses
  resources :departments
  resources :sections

  root to: 'student#index'
  get 'courses_for_dept', to: 'student#course_list'
  get 'sections_for_course', to: 'student#section_list'
  post 'add_course', to: 'student#add_course', as: :add_course
  get 'times_for_section', to: 'student#times'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
