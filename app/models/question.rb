class Question < ApplicationRecord
  belongs_to :quiz

  after_initialize :set_defaults

  def set_defaults
    
  end
end
