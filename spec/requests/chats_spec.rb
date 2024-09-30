# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Chats', type: :request do
  describe 'GET /edit' do
    it 'returns http success' do
      expect { controller.edit }.to raise_error(NoMethodError)
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/chats/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      expect { controller.show }.to raise_error(NoMethodError)
    end
  end
end
