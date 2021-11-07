# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let(:user) { create(:user) }
  let(:course) { create(:course) }

  describe 'GET #show' do
    def do_request
      get :show, params: { id: course.id }
    end

    before do
      sign_in user
      do_request
    end

    it { expect(response).to have_http_status(:ok) }
  end

  describe 'GET #new' do
  end

  describe 'POST #create' do
  end

  describe 'GET #edit' do
  end

  describe 'PATCH #update' do
  end
end
