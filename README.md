# Callisto Vision

Most Learning Record Stores (LRSes) that support IMS Global Caliper (or XAPI) today
just store the JSONB of the event payload in some fashion.  There is no built-in
query capability. You must write rather elaborate JSON queries to gain insight
into student usage patterns based on the events.  

Callisto provides the same generic event store. But it decomposes the various
event types into their own structured forms and then exposes specific REST
queries for each event type. It is our hope that the Callisto query web Services
eventually become extensions to the IMS Global Caliper standard. 

# Architecture

Callisto is a very simple Ruby on Rails app with models and controllers for (eventually)
all important Caliper events likely to be used for query.  It is written for Postgres
due to PG's excellent JSONB and fulltext support which are likely to be helpful.
It could be ported to other relational databases.  Given its focus on web service query,
Callisto will stick very closely to the generated Rails scaffolding for the models for each Caliper event. 

# Populating Caliper Events

To store Caliper events in Callisto use the CaliperEvent model Create method: 

```
  curl --data "payload={
  "sensor": "https://myunitylogin.com/client/sensor",
  "sendTime":"2017-03-29T00:29:26.154Z",
  "data":"[
    { event1 JSON-LD
      "eventTime"=>"2017-03-29T00:29:21.802Z",
      "federatedSession"=>"81398",
      "edApp"=>{
        "@context"=>"http://purl.imsglobal.org/ctx/caliper/v1/Context",
        "@type"=>"http://purl.imsglobal.org/caliper/v1/SoftwareApplication",
        "@id"=>"https://myunitylogin.com/opened",
        "name"=>"Unity"
      },
      "@context"=>"http://purl.imsglobal.org/ctx/caliper/v1/Context",
      "@type"=>"http://purl.imsglobal.org/caliper/v1/AssessmentItemEvent",
      "actor"=>{
        "@context"=>"http://purl.imsglobal.org/ctx/caliper/v1/Context",
        "@type"=>"http://purl.imsglobal.org/caliper/v1/lis/Person",
        "@id"=>"https://A0501617.opened.com/user/polina_teacher_240"
      },
      "action"=>"http://purl.imsglobal.org/vocab/caliper/v1/action#Started",
      "object"=>{
        "@context"=>"http://purl.imsglobal.org/ctx/caliper/v1/Context",
        "@type"=>"http://purl.imsglobal.org/caliper/v1/AssessmentItem",
        "@id"=>"https://A0501617.opened.com/assessment_bank/0235872d-636a-4467-94d0-5ab6842463ed/assessment/1094264/item_bank/2b249051-1bfe-49ce-ba28-cea2ac907807/item/1094267",
        "maxScore"=>1,
        "isPartOf"=>{
          "@id"=>"https://A0501617.opened.com/assessment_bank/0235872d-636a-4467-94d0-5ab6842463ed/assessment/1094264"
        }
      },
      "generated"=>{
        "extensions"=>{
          "load.duration"=>"PT0.212S"
        },
        "@context"=>"http://purl.imsglobal.org/ctx/caliper/v1/Context",
        "@type"=>"http://purl.imsglobal.org/caliper/v1/Attempt",
        "@id"=>"https://A0501617.opened.com/assessment_bank/0235872d-636a-4467-94d0-5ab6842463ed/assessment/1094264/attempt/605f3558-c201-415e-b39d-e67ac0b07a19",
        "count"=>1,
        "startedAtTime"=>"2017-03-29T00:29:21.800Z",
        "endedAtTime"=>nil
      }
    }
]
} https://<hostname>/caliper-event/create
```
