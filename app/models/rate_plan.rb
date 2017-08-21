class RatePlan < ApplicationRecord
  belongs_to :product

  validates_presence_of :title, :description, :start_date, :end_date, :recurrence, :price
  validate :end_date_after_start_date?

  def end_date_after_start_date?
    if end_date < start_date
      errors.add :end_date, "must be after start date"
    end
  end

  RECURRENCE = {'onetime' => 'One-time', 'monthly' => 'Monthly', 'quarterly' => 'Quarterly', 'annually' =>  'Annually'}
end
