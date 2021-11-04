# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CourseStudent, type: :model do
  it 'has a valid factory' do
    expect(build(:course_student)).to be_valid
  end

  describe 'relations' do
    it { is_expected.to belong_to(:student) }
    it { is_expected.to have_many(:questions).dependent(:destroy) }
    it { is_expected.to have_one(:review).dependent(:destroy) }
  end
end
