# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  it 'has one reviewer' do
    t = described_class.reflect_on_association(:reviewer)
    expect(t.macro).to eq(:has_one)
  end

  it 'has reviewed user' do
    t = described_class.reflect_on_association(:reviewed)
    expect(t.macro).to eq(:belongs_to)
  end
end

# has one reviewer, belongs to reviewed
