# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Course, type: :model do
  it 'has a valid factory' do
    expect(build(:course)).to be_valid
  end

  describe 'relations' do
    it { is_expected.to belong_to(:teacher) }
    it { is_expected.to have_many(:course_students) }
    it { is_expected.to have_many(:students) }
    it { is_expected.to have_many(:reviews) }
    it { is_expected.to have_many(:questions) }
    it { is_expected.to have_many(:lectures) }
  end
end
