# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  it 'has a valid factory' do
    expect(build(:review)).to be_valid
  end

  describe 'relations' do
    it { is_expected.to have_one(:author) }
    it { is_expected.to belong_to(:course_user) }
  end
end
