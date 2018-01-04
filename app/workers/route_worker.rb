require "json"
class RouteWorker
  include Sidekiq::Worker

=begin
 parse {
"Subevent {\"eventTime\"=>\"2017-04-12T17:36:17.397Z\", \"federatedSession\"=>\"81538\", \"edApp\"=>{\"@context\"=>\"http://purl.imsglobal.org/ctx/caliper/v1/Context\", \"@type\"=>\"http://purl.imsglobal.org/caliper/v1/SoftwareApplication\", \"@id\"=>\"https://myunitylogin.com/opened\", \"name\"=>\"Unity\"}, \"@context\"=>\"http://purl.imsglobal.org/ctx/caliper/v1/Context\",
\"@type\"=>\"http://purl.imsglobal.org/caliper/v1/AssessmentItemEvent\",
 \"actor\"=>{\"@context\"=>\"http://purl.imsglobal.org/ctx/caliper/v1/Context\", \"@type\"=>\"http://purl.imsglobal.org/caliper/v1/lis/Person\", \"@id\"=>\"https://A0501617.opened.com/user/polina_teacher_240\"},
 \"action\"=>\"http://purl.imsglobal.org/vocab/caliper/v1/action#Completed\",
 \"object\"=>{\"@context\"=>\"http://purl.imsglobal.org/ctx/caliper/v1/Context\", \"@type\"=>\"http://purl.imsglobal.org/caliper/v1/AssessmentItem\", \"@id\"=>\"https://A0501617.opened.com/assessment_bank/0235872d-636a-4467-94d0-5ab6842463ed/assessment/1094264/item_bank/2b249051-1bfe-49ce-ba28-cea2ac907807/item/1094267\",
 \"max_score\"=>1,
  \"is_part_of\"=>{\"@id\"=>\"https://A0501617.opened.com/assessment_bank/0235872d-636a-4467-94d0-5ab6842463ed/assessment/1094264\"}},
\"generated\"=>{\"extensions\"=>{\"qti.interaction.type\"=>\"choice\"}, \"@context\"=>\"http://purl.imsglobal.org/ctx/caliper/v1/Context\",
   \"@type\"=>\"http://purl.imsglobal.org/caliper/v1/MultipleChoiceResponse\",
   \"@id\"=>\"https://A0501617.opened.com/assessment_bank/0235872d-636a-4467-94d0-5ab6842463ed/assessment/1094264/response/null\",
   \"attempt\"=>{\"@context\"=>\"http://purl.imsglobal.org/ctx/caliper/v1/Context\", \"@type\"=>\"http://purl.imsglobal.org/caliper/v1/Attempt\", \"@id\"=>\"https://A0501617.opened.com/assessment_bank/0235872d-636a-4467-94d0-5ab6842463ed/assessment/1094264/attempt/9d6501d3-535b-4dd4-928c-b6056ef0f5da\", \"count\"=>1, \"startedAtTime\"=>\"2017-04-12T17:35:54.164Z\", \"endedAtTime\"=>nil},
    \"startedAtTime\"=>\"2017-04-12T17:35:54.164Z\", \"endedAtTime\"=>\"2017-04-12T17:36:17.393Z\", \"duration\"=>\"PT23.229S\"}}"
into

t.string   "actor_id"
t.string   "action"
t.string   "object_id"
t.integer  "max_score"
t.string   "is_part_of"
t.string   "generated_id"
t.integer  "generated_count"
t.datetime "generated_started_at_time"
=end
  def parseAssessmentItem(e)
    p "Parsing AssessmentItem"
    ai=AssessmentItemEvent.new
    ai.actor_id=e["actor"]["id"] if e["actor"]
    ai.action=e["action"] if e["action"]
    ai.group_id=e["group"]["id"] if e["group"]
    ai.event_time=e["eventTime"] if e["eventTime"]

    if e["object"]
      ai.object_id=e["object"]["id"]
      ai.is_part_of=e["object"]["is_part_of"]["id"] if e["object"]["is_part_of"]
      ai.is_part_of||=e["object"]["isPartOf"]["id"] if e["object"]["isPartOf"]

      ai.max_score=e["object"]["max_score"]
    else
      p "No object attribute in AssessmentItem event"
    end

    if e["generated"]
      ai.generated_id=e["generated"]["id"]
      ai.generated_count=e["generated"]["count"]
      ai.generated_started_at_time=e["generated"]["startedAtTime"]
      ai.generated_score = e["generated"]["score"].to_f if e["generated"]["score"]

      if e["generated"]["attempt"]
        ai.generated_attempt_id=e["generated"]["attempt"]["id"]
      end

    else
      p "No generated attribute in AssessmentItem event"
    end
    ai.save
    ai
  end

=begin
PARSE
{\"eventTime\"=>\"2017-04-11T17:59:50.452Z\", \"federatedSession\"=>\"81403\", \"edApp\"=>{\"@context\"=>\"http://purl.imsglobal.org/ctx/caliper/v1/Context\", \"@type\"=>\"http://purl.imsglobal.org/caliper/v1/SoftwareApplication\", \"@id\"=>\"https://myunitylogin.com/opened\", \"name\"=>\"Unity\"}, \"@context\"=>\"http://purl.imsglobal.org/ctx/caliper/v1/Context\",
\"@type\"=>\"http://purl.imsglobal.org/caliper/v1/gradeEvent\",
\"actor\"=>{\"@context\"=>\"http://purl.imsglobal.org/ctx/caliper/v1/Context\", \"@type\"=>\"http://purl.imsglobal.org/caliper/v1/lis/Person\", \"@id\"=>\"https://A0501617.opened.com/user/polina_teacher_240\"}, \"action\"=>\"http://purl.imsglobal.org/vocab/caliper/v1/action#Graded\",
\"object\"=>{\"@context\"=>\"http://purl.imsglobal.org/ctx/caliper/v1/Context\", \"@type\"=>\"http://purl.imsglobal.org/caliper/v1/Attempt\", \"@id\"=>\"https://A0501617.opened.com/assessment_bank/0235872d-636a-4467-94d0-5ab6842463ed/assessment/1094264/attempt/8eeb8415-d3c3-421e-a1c1-e84e58db611a\",
\"assignable\"=>{\"@context\"=>\"http://purl.imsglobal.org/ctx/caliper/v1/Context\", \"@type\"=>\"http://purl.imsglobal.org/caliper/v1/AssessmentItem\", \"@id\"=>\"https://A0501617.opened.com/assessment_bank/0235872d-636a-4467-94d0-5ab6842463ed/assessment/1094264/item_bank/2b249051-1bfe-49ce-ba28-cea2ac907807/item/1094272\", \"max_score\"=>1, \"is_part_of\"=>{\"@id\"=>\"https://A0501617.opened.com/assessment_bank/0235872d-636a-4467-94d0-5ab6842463ed/assessment/1094264\"}}, \"count\"=>1, \"startedAtTime\"=>\"2017-04-11T17:59:47.600Z\", \"endedAtTime\"=>nil},

\"generated\"=>{\"@context\"=>\"http://purl.imsglobal.org/ctx/caliper/v1/Context\", \"@type\"=>\"http://purl.imsglobal.org/caliper/v1/Result\",
\  "@id\"=>\"https://A0501617.opened.com/assessment_bank/0235872d-636a-4467-94d0-5ab6842463ed/assessment/1094264/item_bank/2b249051-1bfe-49ce-ba28-cea2ac907807/item/1094272/result/0ebc82c1-8e7a-4ca6-b7a0-f3740167df5c\", \"actor\"=>{\"@id\"=>\"https://A0501617.opened.com/user/polina_teacher_240\"},

\"assignable\"=>{\"@context\"=>\"http://purl.imsglobal.org/ctx/caliper/v1/Context\", \"@type\"=>\"http://purl.imsglobal.org/caliper/v1/AssessmentItem\", \"@id\"=>\"https://A0501617.opened.com/assessment_bank/0235872d-636a-4467-94d0-5ab6842463ed/assessment/1094264/item_bank/2b249051-1bfe-49ce-ba28-cea2ac907807/item/1094272\",
  \"max_score\"=>1, \"is_part_of\"=>{\"@id\"=>\"https://A0501617.opened.com/assessment_bank/0235872d-636a-4467-94d0-5ab6842463ed/assessment/1094264\"}}, \"totalScore\"=>0, \"scoredBy\"=>{\"@id\"=>\"https://myunitylogin.com/opened\"}},

\"group\"=>{\"@context\"=>\"http://purl.imsglobal.org/ctx/caliper/v1/Context\", \"@type\"=>\"http://purl.imsglobal.org/caliper/v1/lis/CourseSection\", \"@id\"=>\"https://A0501617.opened.com/course/section/32080\", \"name\"=>\"Math - Grade K-1\"}

}

into
t.string   "actor_id"
t.string   "action"
t.string   "object_id"
t.string   "assignable_id"
t.integer  "assignable_max_score"
t.string   "assignable_is_part_of"
t.string   "generated_id"
t.integer  "generated_total_score"
t.string   "generated_scored_by"

=end
  def parseGrade(e)
    p "Parsing grade"
    o=GradeEvent.new
    o.actor_id=e["actor"]["id"] if e["actor"]
    o.action=e["action"]
    o.event_time=e["eventTime"] if e["eventTime"]

    if e["object"]
      o.object_id=e["object"]["id"]
    else
      p "No object attribute in GradeEvent"
    end
    if e["assignable"]
      o.assignable_id=e["assignable"]["@id"]
      o.assignable_max_score=e["assignable"]["max_score"]
      o.assignable_is_part_of=e["assignable"]["is_part_of"]["@id"] if o.assignable_is_part_of=e["assignable"]["is_part_of"]
      o.assignable_is_part_of||=e["assignable"]["isPartOf"]["@id"] if o.assignable_is_part_of=e["assignable"]["isPartOf"]
    end
    if e["generated"]
      o.generated_id=e["generated"]["id"]
      o.generated_total_score=e["generated"]["generated_total_score"]
      o.generated_scored_by=e["generated"]["scoredBy"]
    else
      p "No generated attribute in GradeEvent"
    end
    o.save
    o
  end

=begin
parse

{\"eventTime\"=>\"2017-04-12T17:36:17.910Z\", \"federatedSession\"=>\"81538\", \"edApp\"=>{\"@context\"=>\"http://purl.imsglobal.org/ctx/caliper/v1/Context\", \"@type\"=>\"http://purl.imsglobal.org/caliper/v1/SoftwareApplication\", \"@id\"=>\"https://myunitylogin.com/opened\", \"name\"=>\"Unity\"}, \"@context\"=>\"http://purl.imsglobal.org/ctx/caliper/v1/Context\",
\"@type\"=>\"http://purl.imsglobal.org/caliper/v1/AssessmentEvent\",
\"actor\"=>{\"@context\"=>\"http://purl.imsglobal.org/ctx/caliper/v1/Context\", \"@type\"=>\"http://purl.imsglobal.org/caliper/v1/lis/Person\", \"@id\"=>\"https://A0501617.opened.com/user/polina_teacher_240\"},
\"action\"=>\"http://purl.imsglobal.org/vocab/caliper/v1/action#Paused\",
\"object\"=>{\"@context\"=>\"http://purl.imsglobal.org/ctx/caliper/v1/Context\", \"@type\"=>\"http://purl.imsglobal.org/caliper/v1/Assessment\", \"@id\"=>\"https://A0501617.opened.com/assessment_bank/0235872d-636a-4467-94d0-5ab6842463ed/assessment/1094264\"},
\"generated\"=>{\"@context\"=>\"http://purl.imsglobal.org/ctx/caliper/v1/Context\", \"@type\"=>\"http://purl.imsglobal.org/caliper/v1/Attempt\", \"@id\"=>\"https://A0501617.opened.com/assessment_bank/0235872d-636a-4467-94d0-5ab6842463ed/assessment/1094264/attempt/9d6501d3-535b-4dd4-928c-b6056ef0f5da\", \"count\"=>1, \"startedAtTime\"=>nil, \"endedAtTime\"=>\"2017-04-12T17:36:17.908Z\"}}"

into

t.string   "actor_id"
t.string   "action"
t.string   "object_id"
t.string   "generated_id"
t.string   "generated_ended_at_time"

=end
  def parseAssessment(e)
    p "Parsing Assessment"
    a=AssessmentEvent.new
    a.actor_id=e["actor"]["id"] if e["actor"]
    a.action=e["action"]
    a.group_id=e["group"]["id"] if e["group"]
    a.event_time=e["eventTime"] if e["eventTime"]

    if e["object"]
      a.object_id=e["object"]["id"]
    else
      p "No object attribute in AssessmentEvent"
    end
    if e["generated"]
      a.generated_id=e["generated"]["id"]
      a.generated_ended_at_time=e["generated"]["generated_ended_at_time"]
    else
      p "No generated attribute in AssessmentEvent"
    end
    a.save
    a
  end

  def parseMedia(e)
    p "Parsing Media"
    m=MediaEvent.new
    m.actor_id=e["actor"]["id"] if e["actor"]
    m.action=e["action"]
    m.group_id=e["group"]["id"] if e["group"]
    m.event_time=e["eventTime"] if e["eventTime"]

    if e["object"]
      m.object_id=e["object"]["id"]
    else
      p "No object attribute in MediaEvent"
    end
    m.save
    m
  end

  def perform(id)
    event = CaliperEvent.where(id: id).where(routed: nil).take

    if(event)
      result = event.payload.is_a?(String) ? JSON.parse(event.payload) : event.payload
      #support array of events or single event
      if result.key?("data")
        result["data"].each do |se|
          p "Subevent #{se}"
          routed_event = route_event(se)
        end
      else
        routed_event = route_event(result)
      end

      routed_event.update_attribute(:caliper_event_id, event.id) if routed_event&.persisted?

      event.routed = true
      event.save
    end
  end

  def route_event(se)
    type=se["type"]
    case type
    when "AssessmentItemEvent"
      ae=parseAssessmentItem(se)
    when "GradeEvent"
      o=parseGrade(se)
    when "AssessmentEvent"
      a=parseAssessment(se)
    when "MediaEvent"
      m=parseMedia(se)
    end
  end

end
