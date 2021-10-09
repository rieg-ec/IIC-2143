# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  it 'has a valid factory' do
    expect(build(:question)).to be_valid
  end

  describe 'relations' do
    it { is_expected.to belong_to(:course_user) }
    it { is_expected.to have_one(:author) }
  end
end
