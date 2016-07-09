class Link < ActiveRecord::Base
  belongs_to :profile

  validates :title, presence: true
  validates :href, presence: true

end
