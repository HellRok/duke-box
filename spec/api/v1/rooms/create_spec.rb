require 'rails_helper'

RSpec.describe "rooms#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/rooms", payload
  end

  describe 'basic create' do
    let(:payload) do
      {
        data: {
          type: 'rooms',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    it 'creates the resource' do
      expect {
        make_request
      }.to change { Room.count }.by(1)
      room = Room.last

      assert_payload(:room, room, json_item)
    end
  end
end
