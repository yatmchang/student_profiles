class Profile < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :links, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :skills, dependent: :destroy

  attr_accessor :contact_name
  attr_accessor :contact_email
  attr_accessor :contact_text

  mount_uploader :avatar, AvatarUploader
  mount_uploader :resume, DocumentUploader

end
