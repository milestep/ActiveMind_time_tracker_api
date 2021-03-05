ActiveAdmin.register Category do
  menu priority: 3
  permit_params :category

  index do
    selectable_column
    id_column
    column :category
    column :created_at
    column :updated_at
    actions
  end

  filter :category
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :category
    end
    f.actions
  end
end
