class Skill < ActiveRecord::Base
  belongs_to :profile
  validates :title, presence: true, uniqueness: true
  validates :rating, presence: true, numericality: {less_than_or_equal_to: 10}

end
