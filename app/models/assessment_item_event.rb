class AssessmentItemEvent < ApplicationRecord

  def self.search(actor_id: nil, action: nil, object_id: nil)
    unscoped
      .with_actor_id(actor_id)
      .with_action(action)
      .with_object_id(object_id)

  end

  scope :with_actor_id, -> (actor_id) {
    optional_param_scope(:actor_id, actor_id)
  }

  scope :with_action, -> (action) {
    optional_param_scope(:action, action)
  }

  scope :with_object_id, -> (object_id) {
    optional_param_scope(:object_id, object_id)
  }

  private
    def self.optional_param_scope(name = nil, value = nil)
      if value.present?
        where("#{name}" => value)
      end
    end
end
