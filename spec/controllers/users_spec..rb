require 'rails_helper'

describe 'Users controller spec', type: :request do
  let(:url) { '/api/signin' }
  let(:params) do
    {
      email: "test@gmail.com",
      password: "password"
    }
  end
  let(:wrong_params) do
    {
      email: " ",
      password: " "
    }
  end

  context 'Signin when params are correct' do
    before do
      post url, params: params
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end
    it 'returns JTW token ' do
      expect(response.body['token']).to be_present
    end
  end

  context 'Signin when login params are incorrect' do
    before do
      post url, params: wrong_params
    end

    it 'returns unathorized status' do
      expect(response.status).to eq 401
    end
  end

  context 'Get users' do
    before do
      get url
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end
  end

end