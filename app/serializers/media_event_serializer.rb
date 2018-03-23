class MediaEventSerializer < ActiveModel::Serializer
  attributes :id,
    :actor_id,
    :action,
    :object_id,
    :created_at,
    :updated_at
end
