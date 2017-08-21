ActiveAdmin.register Product do
  menu priority: 1
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :description, :start_date, :end_date,
              :rate_plans_attributes => [:id, :product_id, :title, :description, :start_date, :end_date, :recurrence, :price]

  filter :end_date, label: 'By Date Completed', as: :date_range
  filter :rate_plans_end_date, label: 'Rate Plan expire by Date Completed', as: :date_range
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  index do
    column :title
    column :description
    column :start_date
    column :end_date
    actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :start_date
      row :end_date
    end

    panel "Rate Plans" do
      table_for product.rate_plans do
        column :title
        column :description
        column :start_date
        column :end_date

        column :'Recurrence' do |rate_plan|
          RatePlan::RECURRENCE[rate_plan.recurrence]
        end

        column :'Price' do |rate_plan|
          number_to_currency(rate_plan.price)
        end

      end
    end
  end

  form do |f|
    f.inputs "Product Details"  do
      f.input :title
      f.input :description, as: :string
      f.input :start_date, as: :datepicker
      f.input :end_date, as: :datepicker
      f.has_many :rate_plans, allow_destroy: true do |rate_plans_form|
          rate_plans_form.input :title
          rate_plans_form.input :description, as: :string
          rate_plans_form.input :start_date, as: :datepicker
          rate_plans_form.input :end_date, as: :datepicker
          rate_plans_form.input :recurrence, as: :select, collection: RatePlan::RECURRENCE.map{|k, v| [v, k]}
          rate_plans_form.input :price
      end
    end
    f.actions
  end

end
