ActiveAdmin.register Grade do
  permit_params :project_id, :grader_id, :usability_score, :technical_score, :phase

  index do
    selectable_column
    id_column
    column :project_id
    column :grader_id
    column :usability_score
    column :technical_score
    column :phase
    column :created_at
    column :updated_at
    actions
  end
end
