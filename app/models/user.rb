class User < ActiveRecord::Base
  has_secure_password
  
  has_one :profile, dependent: :destroy
  
  has_many :links, through: :profiles
  has_many :experiences, through: :profiles
  has_many :educations, through: :profiles
  has_many :skills, through: :profiles

  attr_accessor :current_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validate :current_password_is_correct, on: :update

  after_create :make_profile

  def full_name
    "#{first_name} #{last_name}".titleize
  end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
  
  private

  def make_profile
    Profile.create(user: User.last)
  end

  def current_password_is_correct
    if !password.blank?
      user = User.find_by_id(id)
      if (user.authenticate(current_password) == false)
        errors.add(:current_password, "is incorrect.")
      end
    end
  end

end
