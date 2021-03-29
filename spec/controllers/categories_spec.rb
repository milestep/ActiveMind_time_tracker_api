require 'rails_helper'

describe 'Categories controller rspec', type: :request do

  let(:url) { '/api/categories' }
  let(:params) do
    {
      email: "test@gmail.com",
      password: "password"
    }
  end
  let(:category) do
    {
        category: "test_category"
    }
  end

  context 'GET when params are correct' do
    before do
      if(User.find_by(email: params[:email]).nil?)
        @user = FactoryBot.create(:user)
        @token = JWT.encode({user_id: @user.id}, Rails.application.secret_key_base)
      end
      get url, headers: { Authorization: @token }
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

  end

  context 'GET when token is wrong' do
    before do
      if(User.find_by(email: params[:email]).nil?)
        @user=FactoryBot.create(:user)
      end
      get url, headers: { Authorization: "null" }
    end

    it 'returns 401' do
      expect(response).to have_http_status(401)
    end

  end

  context 'POST when params are correct' do
    before do
      if(User.find_by(email: params[:email]).nil?)
        @user = FactoryBot.create(:user)
        @token = JWT.encode({user_id: @user.id}, Rails.application.secret_key_base)
      end
      post url, params: category, headers: { Authorization: @token }
    end

    it 'returns 201' do
      expect(response).to have_http_status(201)
    end

  end

  context 'POST when token is wrong' do
    before do
        if(User.find_by(email: params[:email]).nil?)
          @user = FactoryBot.create(:user)
          @token = JWT.encode({user_id: @user.id}, Rails.application.secret_key_base)
        end
        post url, params: category, headers: { Authorization: "null" }
      end

    it 'returns 401' do
      expect(response).to have_http_status(401)
    end

  end

end