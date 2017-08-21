FactoryGirl.define do
  factory :product do
    title 'IPhone'
    description 'Product of Apple'
    start_date Time.now
    end_date Time.now + 5.months
  end
end
