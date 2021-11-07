# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::CoursesController, type: :controller do
  let(:user) { create(:user) }
  let(:course) { create(:course) }

  describe 'GET #index' do
    def do_request
      get :index, format: :json
    end

    before do
      sign_in user
      do_request
    end

    it { expect(response).to have_http_status(:ok) }
  end

  describe 'GET #show' do
    def do_request
      get :show, params: { id: course.id }, format: :json
    end

    before do
      sign_in user
      do_request
    end

    it { expect(response).to have_http_status(:ok) }
  end

  describe 'POST #register' do
    def do_request
      post :register, params: { id: course.id }, format: :json
    end

    before do
      sign_in user
    end

    describe 'response status' do
      before { do_request }

      it { expect(response).to have_http_status(:created) }
    end

    describe 'validations' do
      it { expect { do_request }.to change(CourseStudent, :count).by(1) }
    end
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
