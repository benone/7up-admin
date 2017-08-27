class AddTargetingToQuizes < ActiveRecord::Migration[5.1]
  def change
    
    add_column :quizzes, :age, :string
    add_column :quizzes, :city, :string
    add_column :quizzes, :gender, :string

  end
end
