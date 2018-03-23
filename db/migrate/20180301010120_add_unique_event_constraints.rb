class AddUniqueEventConstraints < ActiveRecord::Migration[5.1]
  disable_ddl_transaction!

  def change
    add_index :assessment_events,
      [
        :action,
        :event_time,
        :object_id,
        :actor_id,
        :edapp_id
      ],
      unique: true,
      name: 'index_ae_action_event_time_object_id_actor_id_edapp_id'
    add_index :assessment_item_events,
      [
        :action,
        :event_time,
        :object_id,
        :actor_id,
        :edapp_id
      ],
      unique: true,
      name: 'index_aie_action_event_time_object_id_actor_id_edapp_id'
    add_index :grade_events,
      [
        :action,
        :event_time,
        :object_id,
        :actor_id,
        :edapp_id
      ],
      unique: true,
      name: 'index_ge_action_event_time_object_id_actor_id_edapp_id'
    add_index :media_events,
      [
        :action,
        :event_time,
        :object_id,
        :actor_id,
        :edapp_id
      ],
      unique: true,
      name: 'index_me_action_event_time_object_id_actor_id_edapp_id'
  end
end
