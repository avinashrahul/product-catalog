class Product < ApplicationRecord
  has_many :rate_plans , dependent: :destroy
  accepts_nested_attributes_for :rate_plans

  validates_presence_of :title, :description, :start_date, :end_date

  validate :end_date_after_start_date?

  def end_date_after_start_date?
    if end_date < start_date
      errors.add :end_date, "must be after start date"
    end
  end

  def expired?
    self.end_date < Date.today
  end

end
