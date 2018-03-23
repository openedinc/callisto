class GradeEvent < ApplicationRecord
  def self.search(actor_id: nil, edapp_id: nil, object_id: nil,
    object_assignable: nil, generated_id: nil)
    unscoped
      .with_actor_id(actor_id)
      .with_edapp_id(edapp_id)
      .with_generated_id(generated_id)
      .with_object_id(object_id)
      .with_object_assignable(object_assignable)
  end

  scope :with_actor_id, -> (actor_id) {
    optional_param_scope(:actor_id, actor_id)
  }

  scope :with_edapp_id, -> (edapp_id) {
    optional_param_scope(:edapp_id, edapp_id)
  }

  scope :with_generated_id, -> (generated_id) {
    optional_param_scope(:generated_id, generated_id)
  }

  scope :with_object_id, -> (object_id) {
    optional_param_scope(:object_id, object_id)
  }

  scope :with_object_assignable, -> (object_assignable) {
    optional_param_scope(:object_assignable, object_assignable)
  }

end
