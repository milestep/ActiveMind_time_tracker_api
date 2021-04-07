ActiveAdmin.register User do
  menu priority: 4
  permit_params :email, :firstname, :lastname, :is_admin, :password

  show do |m|
    attributes_table do
      row :email  
      row :firstname
      row :lastname
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
    column :firstname
    column :lastname
    column :is_admin
    column :created_at
    column :updated_at
    actions
  end

  filter :email
  filter :firstname
  filter :lastname
  filter :is_admin
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :firstname
      f.input :lastname
      f.input :is_admin
      f.input :password
    end
    f.actions
  end
end
