# frozen_string_literal: true

module Api
  module V1
    class BaseSerializer < BaseSerializer
      private

      def nested_resource(resource)
        serializer = "Api::V1::#{resource.class}Serializer".constantize.new(resource)
        {
          id: resource.id.to_s,
          type: serializer._type,
          attributes: serializer.attributes
        }
      end
    end
  end
end
