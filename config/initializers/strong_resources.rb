# Define payloads that can be re-used across endpoints.
#
# For instance, you may create Tag objects via the /tags endpoint.
# You may also sidepost Tag objects via the /posts endpoint.
# Here is where the Tag payload can be defined. For example:
#
# strong_resource :tag do
#   attribute :name, :string
#   attribute :active, :boolean
# end
#
# You can now reference this payload across controllers:
#
# class TagsController < ApplicationController
#   strong_resource :tag
# end
#
# class PostsController < ApplicationController
#   strong_resource :post do
#     has_many :tags, disassociate: true, destroy: true
#   end
# end
#
# Custom types can be added here as well:
# Parameters = ActionController::Parameters
# strong_param :pet_type, swagger: :string, type: Parameters.enum('Dog', 'Cat')
#
# strong_resource :pet do
#   attribute :type, :pet_type
# end
#
# For additional documentation, see https://jsonapi-suite.github.io/strong_resources
StrongResources.configure do
  strong_resource :video do
    attribute :creator_uuid, :string
    attribute :youtube_id, :string
    attribute :title, :string
    attribute :thumbnail, :string
    attribute :room_id, :integer
  end
  strong_resource :room do
    attribute :owner_uuid, :string
    attribute :owner_ip, :string
  end
end
