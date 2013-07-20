class Event < ActiveRecord::Base
  validates :date, presence: true
  validate :date_is_in_future?
  validates :title, presence: true, uniqueness: true
  validates :organizer_name, presence: true
  validates :organizer_email, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\z/}

  def date_is_in_future?
    if self.date.is_a?(Date)
      errors.add(:date, 'must be in the future') unless self.date > Date.today
    else
      errors.add(:date, 'must be a valid date')
    end
  end
end
