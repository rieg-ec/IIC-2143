# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :email, :first_name, :last_name

  index do
    id_column
    column :email
    column :full_name
    column :updated_at
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :first_name
      row :last_name
      row :created_at
      row :updated_at
      row(:avatar) do |user|
        image_tag(user.avatar_url, width: '300')
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :avatar, as: :file
    end
    f.actions
  end
end
