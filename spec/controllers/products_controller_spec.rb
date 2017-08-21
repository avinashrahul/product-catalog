require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do
  describe 'GET index' do
    before(:each) do
      @product = FactoryGirl.create(:product)
    end

    it 'should get index' do
      get :index
      expect(response).to be_successful
      assigns(:products).should_not == nil
    end

  end
end
