ActiveAdmin.register Project do
  permit_params :name, :web_url, :student_id, :read_me_url
end
