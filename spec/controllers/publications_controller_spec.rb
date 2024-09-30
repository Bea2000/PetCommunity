# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PublicationsController, type: :controller do
  #   describe 'ReviewsController ' do
  #     it "creates article" do
  #       review_params = [adoptant: 1, user_id: 2, rating: 4.5, content: "muy weno"]
  #       expect { post :create, :review => review_params }.to change(Review, :count).by(1)
  #     end
  #   end

  describe 'metodos del controlador' do
    it 'makes new publication' do
      control = controller.new # (adoptant: 1, user_id: 2, rating: 4.5, content: "muy weno")
      get :index
      expect(control).to be_a_new Publication
    end

    it 'updates reviews' do
      expect { controller.show }.to raise_error(NoMethodError)
    end
  end
end
