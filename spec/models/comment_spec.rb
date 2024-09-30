# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'belongs to a publication' do
    t = described_class.reflect_on_association(:publication)
    expect(t.macro).to eq(:belongs_to)
  end

  it 'belongs to a user' do
    t = described_class.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end
end
