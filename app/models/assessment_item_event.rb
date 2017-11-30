class AssessmentItemEvent < ApplicationRecord

  def self.search(actor_id: nil, action: nil, object_id: nil, generated_id: nil, group_id: nil, is_part_of: nil)
    unscoped
      .with_actor_id(actor_id)
      .with_action(action)
      .with_object_id(object_id)
      .with_generated_id(generated_id)
      .with_group_id(group_id)
      .with_is_part_of(is_part_of)
  end

  scope :with_actor_id, -> (actor_id) {
    optional_param_scope(:actor_id, actor_id)
  }

  scope :with_generated_id, -> (generated_id) {
    optional_param_scope(:generated_id, generated_id)
  }

  scope :with_action, -> (action) {
    optional_param_scope(:action, action)
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

  private
    def self.optional_param_scope(name = nil, value = nil)
      if value.present?
        where("#{name}" => value)
      end
    end
end
