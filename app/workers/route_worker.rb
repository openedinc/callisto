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
 \"maxScore\"=>1,
  \"isPartOf\"=>{\"@id\"=>\"https://A0501617.opened.com/assessment_bank/0235872d-636a-4467-94d0-5ab6842463ed/assessment/1094264\"}},
\"generated\"=>{\"extensions\"=>{\"qti.interaction.type\"=>\"choice\"}, \"@context\"=>\"http://purl.imsglobal.org/ctx/caliper/v1/Context\",
   \"@type\"=>\"http://purl.imsglobal.org/caliper/v1/MultipleChoiceResponse\",
   \"@id\"=>\"https://A0501617.opened.com/assessment_bank/0235872d-636a-4467-94d0-5ab6842463ed/assessment/1094264/response/null\",
   \"attempt\"=>{\"@context\"=>\"http://purl.imsglobal.org/ctx/caliper/v1/Context\", \"@type\"=>\"http://purl.imsglobal.org/caliper/v1/Attempt\", \"@id\"=>\"https://A0501617.opened.com/assessment_bank/0235872d-636a-4467-94d0-5ab6842463ed/assessment/1094264/attempt/9d6501d3-535b-4dd4-928c-b6056ef0f5da\", \"count\"=>1, \"startedAtTime\"=>\"2017-04-12T17:35:54.164Z\", \"endedAtTime\"=>nil},
    \"startedAtTime\"=>\"2017-04-12T17:35:54.164Z\", \"endedAtTime\"=>\"2017-04-12T17:36:17.393Z\", \"duration\"=>\"PT23.229S\"}}"
into

t.string   "actorId"
t.string   "action"
t.string   "objectId"
t.integer  "maxScore"
t.string   "isPartOf"
t.string   "generatedId"
t.integer  "generatedCount"
t.datetime "generatedStartedAtTime"
=end
  def parseAssessmentItem(e)
    ai=AssessmentItemEvent.new
    ai.actorId=e["actor"]["@id"]
    ai.action=e["action"]
    ai.objectId=e["object"]["@id"]
    ai.isPartOf=e["object"]["isPartOf"]["@id"]
    ai.maxScore=e["object"]["maxScore"]
    if e["generated"]["attempt"]
      ai.generatedId=e["generated"]["attempt"]["@id"]
      ai.generatedCount=e["generated"]["attempt"]["count"]
      ai.generatedStartedAtTime=e["generated"]["startedAtTime"]
    else
      ai.generatedId=e["generated"]["@id"]
      ai.generatedCount=e["generated"]["count"]
      ai.generatedStartedAtTime=e["generated"]["startedAtTime"]
    end
    ai.save
    ai
  end

  def parseOutcome(e)
  end

  def parseMedia(e)
  end 

  def perform(*args)
    events=CaliperEvent.where :routed=>false
    events.each do |e|
      result=JSON.parse(e.payload)
      subevents=result["data"]
      subevents.each do |se|
        p "Subevent #{se}"
        type=se["@type"]
        case type
        when "http://purl.imsglobal.org/caliper/v1/AssessmentEvent"
          ae=parseAssessmentItem(se)
        when "http://purl.imsglobal.org/caliper/OutcomeEvent"
          parseOutcome(se)
        when "http://purl.imsglobal.org/caliper/MediaEvent"
          parseMedia(se)
        end
      end
    end
  end
end
