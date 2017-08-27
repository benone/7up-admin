ActiveAdmin.register Question do
  permit_params :text, :answers, :quiz_id #, :original_image_url
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
      f.input :quiz
      f.input :text
      # f.input :targeting
      f.input :answers#, as: :text
    end
    f.actions
  end

  show do |question|
    if question.created_at < 1.minute.ago
      div class: 'custom-class' do
        h3 question.text
        answers = question.answers.split("\n")
        @data = Hash[answers.map{|a| [a, rand(100)]}]
        render partial: 'questions/chart', locals: {data: @data}
      end
    end
  end
end
