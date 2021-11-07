# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET index' do
    let(:user) { create(:user) }

    def do_request
      get :index
    end

    before do
      sign_in user
      do_request
    end

    it { expect(response).to have_http_status(:ok) }
  end
end
