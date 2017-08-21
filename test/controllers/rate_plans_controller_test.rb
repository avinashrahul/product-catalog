require 'test_helper'

class RatePlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rate_plan = rate_plans(:one)
  end

  test "should get index" do
    get rate_plans_url, as: :json
    assert_response :success
  end

  test "should create rate_plan" do
    assert_difference('RatePlan.count') do
      post rate_plans_url, params: { rate_plan: { description: @rate_plan.description, end_date: @rate_plan.end_date, price: @rate_plan.price, product_id: @rate_plan.product_id, recurrence: @rate_plan.recurrence, start_date: @rate_plan.start_date, title: @rate_plan.title } }, as: :json
    end

    assert_response 201
  end

  test "should show rate_plan" do
    get rate_plan_url(@rate_plan), as: :json
    assert_response :success
  end

  test "should update rate_plan" do
    patch rate_plan_url(@rate_plan), params: { rate_plan: { description: @rate_plan.description, end_date: @rate_plan.end_date, price: @rate_plan.price, product_id: @rate_plan.product_id, recurrence: @rate_plan.recurrence, start_date: @rate_plan.start_date, title: @rate_plan.title } }, as: :json
    assert_response 200
  end

  test "should destroy rate_plan" do
    assert_difference('RatePlan.count', -1) do
      delete rate_plan_url(@rate_plan), as: :json
    end

    assert_response 204
  end
end
