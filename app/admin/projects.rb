ActiveAdmin.register Project do
  menu priority: 2
  permit_params :project

  index do
    selectable_column
    id_column
    column :project
    column :created_at
    column :updated_at
    actions
  end

  filter :project
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :project
    end
    f.actions
  end
end
