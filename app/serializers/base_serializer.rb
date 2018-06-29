class BaseSerializer < ActiveModel::Serializer

  # `object_id` is a reserved keyword in ruby
  attribute(:object_id) { object.send(:object_id) }
end
