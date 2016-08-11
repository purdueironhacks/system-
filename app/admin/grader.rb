ActiveAdmin.register Grader do
  permit_params :name, :email, :grader_type

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :grader_type
    column :created_at
    column :updated_at
    actions
  end
end
