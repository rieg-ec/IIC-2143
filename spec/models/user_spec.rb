# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  describe 'relations' do
    it { is_expected.to have_many(:course_users).dependent(:destroy) }
    it { is_expected.to have_many(:courses_owned).dependent(:destroy) }
    it { is_expected.to have_many(:courses_enrolled).dependent(:nullify) }
    it { is_expected.to have_many(:questions).dependent(:destroy) }
    it { is_expected.to have_many(:reviews).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
  end
end
