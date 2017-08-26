class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.string :company_id
      t.string :integer
      t.text :title
      
      t.timestamps
    end
  end
end
