ActiveAdmin.register User do
  menu priority: 4
  permit_params :email, :username, :is_admin, :password

  show do |m|
    attributes_table do
      row :email  
      row :username
      row :password_digest
      row :is_admin 
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  index do
    selectable_column
    id_column
    column :email
    column :username
    column :is_admin
    column :created_at
    column :updated_at
    actions
  end

  filter :email
  filter :username
  filter :is_admin
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :username
      f.input :is_admin
      f.input :password
    end
    f.actions
  end
end
