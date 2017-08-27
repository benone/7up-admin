class Quiz < ApplicationRecord
  belongs_to :company

  attr_accessor :age, :city, :gender
  # after_initialize :update_targeting

  # def update_targeting
  #   targeting = { age: age, city: city, gender: gender }
  # end
  
end
