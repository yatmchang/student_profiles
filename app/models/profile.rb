class Profile < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :links, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :educations
  has_many :skills
  has_many :projects

  has_many :educations, dependent: :destroy
  has_many :skills, dependent: :destroy

  attr_accessor :contact_name
  attr_accessor :contact_email
  attr_accessor :contact_text

  mount_uploader :avatar, AvatarUploader
  mount_uploader :document, DocumentUploader

end
