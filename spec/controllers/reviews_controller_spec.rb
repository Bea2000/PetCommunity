# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  describe 'metodos del controlador' do
    it 'makes new review' do
      control = controller.new # (adoptant: 1, user_id: 2, rating: 4.5, content: "muy weno")
      get :index
      expect(control).to be_a_new Review
    end

    it 'updates reviews' do
      expect(controller.show).to be_nil
    end
  end
end
