ActiveAdmin.register Quiz do
  permit_params :title, :company_id, :age, :city, :gender #, :original_image_url
  # filter :title
  # filter :tags_count

 #  filter :full_text_search, as: :string
 #  filter :venue_id_eq

 #  index do
 #    column :venue
 #    column :title
 #    column :tags_count
 #    column :image do |dish|
 #      image_tag dish.image_url(:thumb).to_s
 #    end
 #    actions
 #  end


  form do |f|
    f.inputs do
      f.input :company
      f.input :title
      f.input :age, collection: ["14-18", "18-22", "22-26", "26-30", "30-34", "34-38", "38-42", "42+"], as: :check_boxes
      f.input :city, collection: ["Москва", "Санкт-Петербург", "Ростов", "Челябинск"], as: :check_boxes
      f.input :gender, collection: ["Мужчина", "Женщина"], as: :check_boxes
      # f.input :targeting
      # f.input :answers#, as: :text
    end
    f.actions
  end


end
