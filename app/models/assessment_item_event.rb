class AssessmentItemEvent < ApplicationRecord

  def self.search(
      actor_id: nil, action: nil, edapp_id: nil, object_id: nil,
      generated_id: nil, group_id: nil, is_part_of: nil,
      event_time: nil, generated_attempt_id: nil)
    unscoped
      .with_actor_id(actor_id)
      .with_action(action)
      .with_edapp_id(edapp_id)
      .with_generated_id(generated_id)
      .with_object_id(object_id)
      .with_group_id(group_id)
      .with_is_part_of(is_part_of)
      .with_event_time(event_time)
      .with_generated_attempt_id(generated_attempt_id)
  end

  scope :with_actor_id, -> (actor_id) {
    optional_param_scope(:actor_id, actor_id)
  }

  scope :with_action, -> (action) {
    optional_param_scope(:action, action)
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

  scope :with_group_id, -> (group_id) {
    optional_param_scope(:group_id, group_id)
  }

  scope :with_is_part_of, -> (is_part_of) {
    optional_param_scope(:is_part_of, is_part_of)
  }

  scope :with_generated_attempt_id, -> (generated_attempt_id) {
    optional_param_scope(:generated_attempt_id, generated_attempt_id)
  }

  scope :with_event_time, -> (event_time) {
    optional_date_scope(:event_time, event_time)
  }

end
