ActiveAdmin.register User do
  menu priority: 4
  permit_params :username, :password_digest

  show do |m|
    attributes_table do
      row :username 
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  index do
    selectable_column
    id_column
    column :username
    column :created_at
    column :updated_at
    actions
  end

  filter :username
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :username
      f.input :password_digest
    end
    f.actions
  end
end
