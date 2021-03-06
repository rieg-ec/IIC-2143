# frozen_string_literal: true

class Api::V1::BaseSerializer < BaseSerializer
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
