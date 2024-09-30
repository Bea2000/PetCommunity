# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reviews', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/reviews/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/reviews/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/reviews/new'
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/reviews/edit'
      expect(response).to have_http_status(:success)
    end
  end

  # describe "#delete" do
  #   it "deletes successfully a review" do
  #     @review = Review.createadoptant: 1, user_id: 2, rating: 4.5, content: "Muy weno"()
  #     @review.should be_an_instance_of Review
  #   end
  # end
end
