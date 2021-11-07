# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe 'GET #index' do
    def do_request
      get :index
    end

    describe 'response status' do
      before do
        sign_in user
        do_request
      end

      it { expect(response).to have_http_status(:ok) }
    end
  end

  describe 'GET #show' do
    def do_request
      get :show, params: { id: user.id }
    end

    describe 'response status' do
      before do
        sign_in user
        do_request
      end

      it { expect(response).to have_http_status(:ok) }
    end
  end
end
