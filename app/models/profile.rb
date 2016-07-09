class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :links
  has_many :experiences, dependent: :destroy
end
