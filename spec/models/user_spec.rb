# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has many publications' do
    t = described_class.reflect_on_association(:publications)
    expect(t.macro).to eq(:has_many)
  end

  it 'has many comments' do
    t = described_class.reflect_on_association(:comments)
    expect(t.macro).to eq(:has_many)
  end
end
