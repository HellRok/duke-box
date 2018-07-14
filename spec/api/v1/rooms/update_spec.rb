require 'rails_helper'

RSpec.describe "rooms#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/rooms/#{room.id}", payload
  end

  describe 'basic update' do
    let!(:room) { create(:room) }

    let(:payload) do
      {
        data: {
          id: room.id.to_s,
          type: 'rooms',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect {
        make_request
      }.to change { room.reload.attributes }
      assert_payload(:room, room, json_item)

      # ... assert updates attributes ...
    end
  end
end
