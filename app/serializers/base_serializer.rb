# frozen_string_literal: true

class BaseSerializer < ActiveModel::Serializer
  private

  def nested_resource(resource)
    serializer = "#{resource.class}Serializer".constantize.new(resource)
    {
      id: resource.id.to_s,
      type: serializer._type,
      attributes: serializer.attributes
    }
  end

  def nested_resources(resources)
    resources.map { |r| nested_resource(r) }
  end
end
