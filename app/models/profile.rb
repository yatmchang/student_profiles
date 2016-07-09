class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :links
  has_many :experiences, dependent: :destroy
  has_many :educations
  has_many :skills
  
end
