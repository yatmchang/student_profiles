  class User < ActiveRecord::Base
  has_secure_password

  has_one :profile, dependent: :destroy
  has_many :links, through: :profile
  has_many :experiences, through: :profile
  has_many :educations, through: :profile
  has_many :skills, through: :profile
  has_many :projects, through: :profile


  attr_accessor :current_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  # validate :current_password_is_correct, on: :update

  after_create :make_profile

  def full_name
    "#{first_name} #{last_name}".titleize
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    Mailer.password_reset(self).deliver_later
  end

  private

  def make_profile
    Profile.create(user: User.last)
  end

  # def current_password_is_correct
  #   if !password.blank?
  #     user = User.find_by_id(id)
  #     if (user.authenticate(current_password) == false)
  #       errors.add(:current_password, "is incorrect.")
  #     end
  #   end
  # end



end
