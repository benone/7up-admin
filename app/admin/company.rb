ActiveAdmin.register Company do
  permit_params :title#, :original_image_url
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

end
