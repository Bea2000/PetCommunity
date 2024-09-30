# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  #   describe 'ReviewsController ' do
  #     it "creates article" do
  #       review_params = [adoptant: 1, user_id: 2, rating: 4.5, content: "muy weno"]
  #       expect { post :create, :review => review_params }.to change(Review, :count).by(1)
  #     end
  #   end

  describe 'metodos del controlador' do
    it 'makes new comment' do
      control = controller.new # (adoptant: 1, user_id: 2, rating: 4.5, content: "muy weno")
      get :index
      expect(control).to be_a_new Comment
    end

    it 'updates comments' do
      expect(controller.show).to be_nil
    end

    it 'crea algo' do
      params = { user_id: 1 }

      expect do
        post :create, params: params
      end.to raise_error ArgumentError
    end
  end
end
