require 'rails_helper'

RSpec.describe 'A Goods requests', type: :request do
  let!(:goods) { create_list(:good, 100) }
  let!(:good_id) { goods.first.id }

  describe 'GET /goods' do
    before { get '/goods' }

    it 'returns goods' do
      expect(json).not_to be_empty
      expect(json["data"].size).to eq(page_size)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /goods' do
    let(:valid_attributes) { {name: 'Test', description: 'A test description', price: 100} }

    context 'when the request is valid' do
      before { post '/goods', params: valid_attributes}

      it 'creates a good' do
        expect(json['data']['attributes']['name']).to eq('Test')
        expect(json['data']['attributes']['description']).to eq('A test description')
        expect(json['data']['attributes']['price']).to eq(100)
      end

      it 'returns code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'PUT /goods/:id' do
    let(:valid_attributes) { {name: 'Test 2'} }

    before { put "/goods/#{good_id}", params: valid_attributes }

    context 'when a goods exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)  
      end

      it 'updates a goods' do
        updated = Good.find(good_id)
        expect(updated.name).to eq('Test 2')
      end
    end
  end

  describe 'DELETE /goods/:id' do
    before { delete "/goods/#{good_id}" }

    it 'returns code 204' do
      expect(response).to have_http_status(204)
    end
  end

end