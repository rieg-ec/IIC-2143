# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  let(:user) { create(:user) }
  let(:course) { create(:course) }
  let(:review) { create(:review) }

  describe 'GET #index' do
    def do_request
      get :index, params: { course_id: course.id }, format: :json
    end

    before do
      sign_in user
      do_request
    end

    it { expect(response).to have_http_status(:ok) }
  end

  describe 'GET #show' do
    def do_request
      get :show, params: { id: review.id }, format: :json
    end

    before do
      sign_in user
      do_request
    end

    it { expect(response).to have_http_status(:ok) }
  end

  describe 'POST #create' do
    def do_request
      post :create, params: {
        course_id: course.id,
        review: { body: 'lorem ipsum', rating: 5 }
      }, format: :json
    end

    before { create(:course_student, student: user, course: course) }

    describe 'response status' do
      before do
        sign_in user
        do_request
      end

      it { expect(response).to have_http_status(:created) }
    end

    describe 'validations' do
      before do
        sign_in user
      end

      it { expect { do_request }.to change(Review, :count).by(1) }
    end
  end

  describe 'DELETE #destroy' do
    let!(:review) { create(:review) }

    def do_request
      delete :destroy, params: { id: review.id }, format: :json
    end

    describe 'response status' do
      before do
        sign_in user
        do_request
      end

      it { expect(response).to have_http_status(:no_content) }
    end

    describe 'validations' do
      before do
        sign_in user
      end

      it { expect { do_request }.to change(Review, :count).by(-1) }
    end
  end
end
