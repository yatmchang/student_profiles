class User < ActiveRecord::Base
  has_secure_password

  has_one :profile, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  after_create :make_profile

  def full_name
    "#{first_name} #{last_name}".titleize
  end


  private

  def make_profile
    Profile.create(user: Uder.last)
  end
end
