# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  AdminUser.create!(
    email: 'admin@example.com',
    password: 'password',
    password_confirmation: 'password'
  )

  actions = ['started', 'ended', 'paused']

  10.times do |index|
    AssessmentEvent.create!(
      actor_id: "https://staging.opened.com/user/#{index}",
      action: actions[index % actions.size],
      object_id: "https://staging.opened.com/resources/#{index}",
      generated_id: "https://staging.opened.com/assessment_run/#{index}",
      generated_started_at_time: index.days.ago,
      generated_ended_at_time: index.days.ago,
      group_id: nil,
      event_time: index.days.ago
    )
    AssessmentItemEvent.create!(
      actor_id: "https://staging.opened.com/user/#{index}",
      action: actions[index % actions.size],
      max_score: 100,
      object_id: "https://staging.opened.com/resources/#{index}",
      is_part_of: "https://staging.opened.com/resources/#{index + 1}",
      generated_id: "https://staging.opened.com/answer/#{index}",
      generated_count: nil,
      generated_started_at_time: index.days.ago,
      generated_ended_at_time: index.days.ago,
      group_id: "https://staging.opened.com/group/#{index}",
      event_time: index.days.ago,
      generated_score: 0,
      generated_attempt_id: "https://staging.opened.com/assessment_run/#{index}",
    )
    GradeEvent.create!(
      actor_id: "https://staging.opened.com/user/#{index}",
      action: actions[index % actions.size],
      assignable_id: "https://staging.opened.com/resources/#{index}",
      assignable_max_score: 100,
      assignable_is_part_of: "https://staging.opened.com/resources/#{index + 1}",
      object_id: "https://staging.opened.com/resources/#{index}",
      generated_id: "https://staging.opened.com/answer/#{index}",
      generated_started_at_time: index.days.ago,
      generated_ended_at_time: index.days.ago,
      generated_total_score: index * 10,
      event_time: index.days.ago,
      generated_scored_by: "https://staging.opened.com/user/#{index}"
    )
    MediaEvent.create!(
      actor_id: "https://staging.opened.com/user/#{index}",
      action: actions[index % actions.size],
      object_id: "https://staging.opened.com/resources/#{index}",
      group_id: "https://staging.opened.com/group/#{index}",
      generated_started_at_time: index.days.ago,
      generated_ended_at_time: index.days.ago,
      event_time: index.days.ago
    )
  end
end
