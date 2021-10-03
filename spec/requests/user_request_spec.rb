# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }

  describe 'GET #index' do
    def do_request
      get users_path
    end

    describe 'Permissions' do
      context 'when user is authenticated' do
        before do
          sign_in user
          do_request
        end

        it { expect(response.status).to eq(200) }
      end

      context 'when user is not authenticated' do
        before { do_request }

        it { expect(response.status).to eq(302) }
      end
    end

    describe 'Correct output' do
      before do
        sign_in user
        do_request
      end

      it { expect(response).to render_template('index') }
    end
  end

  describe 'GET #show' do
    def do_request
      get user_path(user), params: { id: other_user.id }
    end

    describe 'Permissions' do
      context 'when user is authenticated' do
        before do
          sign_in user
          do_request
        end

        it { expect(response.status).to eq(200) }
      end

      context 'when user is not authenticated' do
        before { do_request }

        it { expect(response.status).to eq(302) }
      end
    end

    describe 'Correct output' do
      before do
        sign_in user
        do_request
      end

      it { expect(response).to render_template('show') }
    end
  end
end
