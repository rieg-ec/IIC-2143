# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CourseUser, type: :model do
  it 'has a valid factory' do
    expect(build(:course_user)).to be_valid
  end

  describe 'relations' do
    it { is_expected.to belong_to(:course) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:questions).dependent(:destroy) }
    it { is_expected.to have_one(:review).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:role) }
  end

  describe 'enumerize' do
    it { is_expected.to enumerize(:role).in(:student, :teacher) }
  end
end
