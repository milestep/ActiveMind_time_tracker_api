ActiveAdmin.register Note do
  menu priority: 1
  permit_params :user_id, :project_id, :category_id, :hours, :date

  # show do |m|
  #   note = Note.find(m.id)
  #   user = User.find(m.user_id)
  #   project = Project.find(m.project_id)
  #   category = Category.find(m.category_id)
  #   attributes_table do
  #     row :user do
  #       link_to user.username, admin_user_path(m.user_id)
  #     end
  #     row :project do
  #       link_to project.project, admin_project_path(m.project_id)
  #     end
  #     row :category do
  #       link_to category.category, admin_category_path(m.category_id)
  #     end
  #     row :hours
  #     row :date
  #   end
  #   active_admin_comments
  # end

  # index do
  #   selectable_column
  #   id_column
  #   column "User" do |m|
  #     user = User.find(m.user_id)
  #     link_to user.username, admin_user_path(m.user_id)
  #   end
  #   column "Project" do |m|
  #     project = Project.find(m.project_id)
  #     link_to project.project, admin_project_path(m.project_id)
  #   end
  #   column "Category" do |m|
  #     category = Category.find(m.category_id)
  #     link_to category.category, admin_category_path(m.category_id)
  #   end
  #   column :hours
  #   column :date
  #   column :created_at
  #   column :updated_at
  #   actions
  # end

  # filter :user_id, :as => :select, :collection => User.all.map{ |x| [x.username, x.id] } 
  # filter :project_id,  :as => :select, :collection => Project.all.map{ |x| [x.project, x.id] }
  # filter :category_id,  :as => :select, :collection => Category.all.map{ |x| [x.category, x.id] }
  # filter :hours
  # filter :date
  # filter :created_at
  # filter :updated_at

  # form do |f|
  #   f.inputs do
  #     f.input :user_id, :as => :select, :collection => User.all.map{ |x| [x.username, x.id] } 
  #     f.input :project_id,  :as => :select, :collection => Project.all.map{ |x| [x.project, x.id] }
  #     f.input :category_id,  :as => :select, :collection => Category.all.map{ |x| [x.category, x.id] }
  #     f.input :hours
  #     f.input :date
  #   end
  #   f.actions
  # end
  
end
