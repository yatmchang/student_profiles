class Education < ActiveRecord::Base
  belongs_to :profile

  validates :school, presence: true
  validate :end_date_greater_than_start_date
  validate :start_date_less_than_today
  validate :end_date_less_than_today
  validate :mutually_exclusive_present_end_date

  def end_date_greater_than_start_date
    if end_date
      if end_date < start_date
        errors.add(:due_date, "End Date needs to be after Start Date.")
      end
    end
  end

  def start_date_less_than_today
    if start_date
      if start_date > Date.today
        errors.add(:start_date, "Start Date must be less than today!")
      end
    end
  end

  def end_date_less_than_today
    if end_date
      if end_date > Date.today
        errors.add(:end_date, "End Date must be less than today!")
      end
    end
  end


  def mutually_exclusive_present_end_date
    if (current == true) && (end_date != nil)
      errors.add(:end_date, "A current job cannot have an end date!")
    end
  end

  mount_uploader :logo, AvatarUploader
  crop_uploaded :avatar

end
