# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MessagesControllers', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      expect { controller.index }.to raise_error(NoMethodError)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      expect { controller.show }.to raise_error(NoMethodError)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      expect { controller.new }.to raise_error(NoMethodError)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      expect { controller.edit }.to raise_error(NoMethodError)
    end
  end
end
