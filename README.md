# Callisto

*A simple, queryable [Caliper](http://www.imsglobal.org/activity/caliperram) event store.*

[![Build Status](https://travis-ci.org/openedinc/callisto.svg?branch=master)](https://travis-ci.org/openedinc/callisto)
[![Code Climate](https://codeclimate.com/github/openedinc/callisto.png)](https://codeclimate.com/github/openedinc/callisto)

## Callisto Vision

Most Learning Record Stores (LRSes) that support IMS Global Caliper (or XAPI) today
just store the JSONB of the event payload in some fashion.  There is no built-in
query capability. You must write rather elaborate JSON queries to gain insight
into student usage patterns based on the events.  

Callisto provides the same generic event store. But it decomposes the various
event types into their own structured forms and then exposes specific REST
queries for each event type. It is our hope that the Callisto query web services
eventually become extensions to the IMS Global Caliper standard.

## Code and Architecture

Callisto is a very simple Ruby on Rails app with models and controllers for
(eventually) all important Caliper events likely to be used for query. It is written
for Postgres due to PG's excellent JSONB and fulltext support which are likely to be helpful.
It could be ported to other relational databases. Given its focus on web service query,
Callisto will stick very closely to the generated Rails scaffolding for the models for each Caliper event.

Code is available on [GitHub](http://github.com/openedinc/callisto)

All Callisto code is open source via [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0).

## Endpoints

### Getting your token

You will need to sign in to get your access-token, uid, and client.  These attributes will be used in all subsequent requests to authenticate your user.

####Request
```
  curl -XPOST -H Accept: application/json' -H 'Content-Type: application/json' https://www.opencallisto.org/auth/sign_in -d '{"email": "mail@example.com", "password": "password" }'
```
####Response Headers
```
  access-token: lW1c60hYkRwAinzUqgLfsQ
  token-type: Bearer
  client: W_xCQuggzNOVeCnNZbjKFw
  expiry: 1426610121
  uid: testemail@mydomain.com
```

#### Every other request should have headers set similar to below
```
  curl -XGET -v -H 'Content-Type: application/json' -H 'access-token: lW1c60hYkRwAinzUqgLfsQ' -H 'client: W_xCQuggzNOVeCnNZbjKFw' -H "uid: testemail@mydomain.com" https://www.opencallisto.org/example_endpoint
```
### Populating Caliper Events

To store Caliper events in Callisto use the CaliperEvent model Create method.  In the example below the sensor value is just a unique URI (it happens to be a unique URI on opened.com).  The data consists of multiple valid Caliper events.

```
  curl -H "Content-Type: application/json" -d '{"caliper_event":{"payload":{"sensor": "https://opened.com/sensors/MediaEvent","data":[{"a":"1"},{"b":"2"}]}}}' https://www.opencallisto.org/caliper_events
```

#### Sample Caliper Event

Below is a sample Caliper event (specifically MediaEvent) based on one of the [IMS Caliper fixtures](https://github.com/IMSGlobal/caliper-common-fixtures-public/blob/public/src/test/resources/fixtures/caliperMediaEvent.json). Of particular note is the learningObjectives attribute as that was not fleshed out in the fixture example. It also uses IMS CASE item URLs for the learningObjective's ID and in an extension attribute called "case_item".   Other parts of the MediaEvent that aren't required are left out for simplicity.  

```json
{

 "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",
 "@type": "MediaEvent",
 "actor": {
   "@id": "https://example.edu/user/554433",
   "@type": "Person",
   "dateCreated": "2015-08-01T06:00:00.000Z"
 },
 "action": "Ended",
 "object": {
   "@id": "https://example.com/super-media-tool/video/1225",
   "VideoObject",
   "name": "American Revolution - Key Figures Video",
   "learningObjectives": [
     {
       "@id": "http://opensalt.opened.com/cftree/item/19033",
       "@type": "LearningObjective",
       "extensions": {“caseItemURI”: “http://opensalt.opened.com/cftree/item/19033”},
       "dateCreated": "2015-08-01T06:00:00.000Z"
     }
   ]
  }
}
```

### Querying for Event Types

Once Caliper events are stored with the "caliper_events/create" method they can be retrieved using various index methods for each event type.

#### AssessmentItemEvents

Various queries on AssessmentItemEvents can be performed with the assessment_item_events.json endpoint.

Parameters include:
* actor_id - the ID of the assessment item taker, e.g. "https://example.edu/user/554433"
* action_id - what happened with the assessment item, e.g. "http://purl.imsglobal.org/vocab/caliper/v1/action#Completed"
* object_id - the assessment item ID itself, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001"
* generated_id - the ID of the assessment attempt, e.g. ""https://example.edu/politicalScience/2015/american-revolution-101/assessment/001/item/001/response/001""
* learning_objective - all GradeEvents for a particular learning objective, expressed as a CASE URL

Example REST call (all assessment item events for specified user):
```sh
  curl https://opencallisto.org/assessment_item_events.json?actor_id=https://example.edu/user/554433
```

#### GradeEvents

Various queries on GradeEvents can be performed with the grade_events.json endpoint.

Parameters include:
* actor_id - the ID of the assessment taker, e.g. "https://example.edu/user/554433"
* object_id - the ID of the assessment attempt, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001/attempt/5678"
* object_assignable - the ID of the assessment, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/0011"
* generated_id - the ID of the assessment result, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001/attempt/5678/result
* learning_objective - all GradeEvents for a particular learning objective, expressed as a CASE URL

Example REST call (all grade events for specified user) :
```
  curl https://opencallisto.org/grade_events.json?actor_id=https://example.edu/user/554433
```

#### AssessmentEvents

Various queries on AssessmentEvents can be performed with the grade_events.json endpoint.

Parameters include:
* actor_id - the ID of the assessment taker, e.g. "https://example.edu/user/554433"
* action - what happened with the assessment, e.g."http://purl.imsglobal.org/vocab/caliper/v1/action#Paused"
* object_id - the ID of the assessment, e.g. "https://A0501617.opened.com/assessment_bank/0235872d-636a-4467-94d0-5ab6842463ed/assessment/1094264"
* generated_id - the ID of the assessment attempt, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001/attempt/5678/result
* learning_objective - all GradeEvents for a particular learning objective, expressed as a CASE URL

Example REST call (all grade events for specified user) :
```
  curl -H 'Content-Type: application/json' -H 'access-token: lW1c60hYkRwAinzUqgLfsQ' -H 'client: W_xCQuggzNOVeCnNZbjKFw' -H "uid: testemail@mydomain.com" https://opencallisto.org/assessment_events.json?actor_id=https://example.edu/user/554433
```

#### MediaEvents

Various queries on MediaEvents can be performed with the media_events.json endpoint.

Parameters include:
* actor_id - the ID of the media viewer, e.g. "https://example.edu/user/554433"
* action_id - what happened with the video, e.g. "http://purl.imsglobal.org/vocab/caliper/v1/action#Ended"
* object_id - the URL of the video itself, e.g. "https://example.com/super-media-tool/video/1225"
* learning_objective - the learning objective of the video, expressed as the CASE URL for the standard, e.g. http://opensalt.opened.com/cftree/item/19033

Example REST call (all grade events for specified user) :
```
  curl -H 'Content-Type: application/json' -H 'access-token: lW1c60hYkRwAinzUqgLfsQ' -H 'client: W_xCQuggzNOVeCnNZbjKFw' -H "uid: testemail@mydomain.com" https://opencallisto.org/media_events.json?actor_id=https://example.edu/user/554433
```

## Credits

Callisto is a project from [OpenEd, Inc.](http://www.opened.com), a division of ACT Assessment Technologies.

Current contributors include Adam Blum, Lucas Campbell and Lars Burgess.

It is open source and available via [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0.html).  Please submit pull requests to us via the GitHub repo if you make enhancements.  [Email us](mailto:adam@opened.com) if you want to discuss your contributions.

IMS Caliper is a trademark of [IMS Global](http://imsglobal.org)
