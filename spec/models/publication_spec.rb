# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Publication, type: :model do
  it 'has many comments' do
    t = described_class.reflect_on_association(:comments)
    expect(t.macro).to eq(:has_many)
  end

  it 'belongs to a user' do
    t = described_class.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end
end
