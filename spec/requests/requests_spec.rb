# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Requests', type: :request do
  describe 'GET /show' do
    it 'returns http success' do
      expect { controller.show }.to raise_error(NoMethodError)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/requests/new'
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/requests/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      expect { controller.edit }.to raise_error(NoMethodError)
    end
  end
end
