class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :web_app_link, presence: true
  validates :github_link, presence: true
  mount_uploader :logo, AvatarUploader
end
