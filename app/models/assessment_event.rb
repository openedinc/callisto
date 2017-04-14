class AssessmentEvent < ApplicationRecord
  
  def self.search(actor_id: nil, action: nil, generated_id: nil, object_id: nil)
    unscoped
      .with_actor_id(actor_id)
      .with_action(action)
      .with_object_id(object_id)
      .with_generated_id(generated_id)
  end

  scope :with_actor_id, -> (actor_id) {
    optional_param_scope(:actor_id, actor_id)
  }

  scope :with_action, -> (action) {
    optional_param_scope(:action, action)
  }

  scope :with_generated_id, -> (generated_id) {
    optional_param_scope(:generated_id, generated_id)
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
