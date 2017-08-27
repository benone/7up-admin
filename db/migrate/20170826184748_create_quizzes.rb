class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.integer :company_id
      t.text :title
      
      t.timestamps
    end
  end
end
