class Education < ActiveRecord::Base
  mount_uploader :logo, AvatarUploader

end
