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

### Populating Caliper Events

To store Caliper events in Callisto use the CaliperEvent model Create method.  In the example below the sensor value is just a unique URI (it happens to be a unique URI on opened.com).  The data consists of multiple valid Caliper events.

```
  curl --data "payload={
  "sensor": "https://opened.com/sensors/MediaEvent",
  "sendTime":"2017-03-29T00:29:26.154Z",
  "data":"[{event 1},{event 2}]}" https://opencallisto.org/caliper_events
```

### Sample Caliper Event

Below is a sample Caliper event (specifically AssessmentItemCompleted) from the [IMS Caliper fixtures](https://github.com/IMSGlobal/caliper-common-fixtures/blob/master/src/test/resources/fixtures/caliperAssessmentItemCompletedEvent.json)

```json
  {
    "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",
    "@type": "http://purl.imsglobal.org/caliper/v1/AssessmentItemEvent",
    "actor": {
      "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",
      "@id": "https://example.edu/user/554433",
      "@type": "http://purl.imsglobal.org/caliper/v1/lis/Person",
      "name": null,
      "description": null,
      "extensions": {},
      "dateCreated": "2015-08-01T06:00:00.000Z",
      "dateModified": "2015-09-02T11:30:00.000Z"
    },
    "action": "http://purl.imsglobal.org/vocab/caliper/v1/action#Completed",
    "object": {
      "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",
      "@id": "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001/item/001",
      "@type": "http://purl.imsglobal.org/caliper/v1/AssessmentItem",
      "name": "Assessment Item 1",
      "description": null,
      "objectType": [],
      "alignedLearningObjective": [],
      "keywords": [],
      "isPartOf": {
        "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",
        "@id": "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001",
        "@type": "http://purl.imsglobal.org/caliper/v1/Assessment",
        "name": "American Revolution - Key Figures Assessment",
        "description": null,
        "objectType": [],
        "alignedLearningObjective": [],
        "keywords": [],
        "isPartOf": null,
        "extensions": {},
        "dateCreated": "2015-08-01T06:00:00.000Z",
        "dateModified": "2015-09-02T11:30:00.000Z",
        "datePublished": "2015-08-15T09:30:00.000Z",
        "version": "1.0",
        "dateToActivate": "2015-08-16T05:00:00.000Z",
        "dateToShow": "2015-08-16T05:00:00.000Z",
        "dateToStartOn": "2015-08-16T05:00:00.000Z",
        "dateToSubmit": "2015-09-28T11:59:59.000Z",
        "maxAttempts": 2,
        "maxSubmits": 2,
        "maxScore": 3.0
      },
      "extensions": {},
      "dateCreated": null,
      "dateModified": null,
      "datePublished": null,
      "version": "1.0",
      "dateToActivate": null,
      "dateToShow": null,
      "dateToStartOn": null,
      "dateToSubmit": null,
      "maxAttempts": 2,
      "maxSubmits": 2,
      "maxScore": 1.0,
      "isTimeDependent": false
    },
    "target": null,
    "generated": {
      "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",
      "@id": "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001/item/001/response/001",
      "@type": "http://purl.imsglobal.org/caliper/v1/FillinBlankResponse",
      "name": null,
      "description": null,
      "extensions": {},
      "dateCreated": "2015-08-01T06:00:00.000Z",
      "dateModified": null,
      "assignable": "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001",
      "actor": "https://example.edu/user/554433",
      "attempt": {
        "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",
        "@id": "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001/item/001/attempt/789",
        "@type": "http://purl.imsglobal.org/caliper/v1/Attempt",
        "name": null,
        "description": null,
        "extensions": {},
        "dateCreated": "2015-08-01T06:00:00.000Z",
        "dateModified": null,
        "assignable": "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001",
        "actor": "https://example.edu/user/554433",
        "count": 1,
        "startedAtTime": "2015-09-15T10:15:00.000Z",
        "endedAtTime": null,
        "duration": null
      },
      "values": ["2 July 1776"],
      "startedAtTime": "2015-09-15T10:15:00.000Z",
      "endedAtTime": null,
      "duration": null
    },
    "eventTime": "2015-09-15T10:15:00.000Z",
    "edApp": {
      "@context": "http://purl.imsglobal.org/ctx/caliper/v1/Context",
      "@id": "https://example.com/super-assessment-tool",
      "@type": "http://purl.imsglobal.org/caliper/v1/SoftwareApplication",
      "name": "Super Assessment Tool",
      "description": null,
      "extensions": {},
      "dateCreated": "2015-08-01T06:00:00.000Z",
      "dateModified": null
    }
  }
```

## Querying for Event Types

Once Caliper events are stored with the "caliper_events/create" method they can be retrieved using various index methods for each event type.

### AssessmentItemEvents

Various queries on AssessmentItemEvents can be performed with the assessment_item_events.json endpoint.

Parameters include:
* actor_id - the ID of the assessment item taker, e.g. "https://example.edu/user/554433"
* action_id - what happened with the assessment item, e.g. "http://purl.imsglobal.org/vocab/caliper/v1/action#Completed"
* object_id - the assessment item ID itself, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001"
* generated_id - the ID of the assessment attempt, e.g. ""https://example.edu/politicalScience/2015/american-revolution-101/assessment/001/item/001/response/001""


Example REST call (all assessment item events for specified user):
```sh
  curl https://opencallisto.org/assessment_item_events.json?actor_id=https://example.edu/user/554433
```

### OutcomeEvents

Various queries on OutcomeEvents can be performed with the outcome_events.json endpoint.

Parameters include:
* actor_id - the ID of the assessment taker, e.g. "https://example.edu/user/554433"
* object_id - the ID of the assessment attempt, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001/attempt/5678"
* object_assignable - the ID of the assessment, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/0011"
* generated_id - the ID of the assessment result, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001/attempt/5678/result

Example REST call (all outcome events for specified user) :
```
  curl https://opencallisto.org/outcome_events.json?actor_id=https://example.edu/user/554433
```

### AssessmentEvents

Various queries on AssessmentEvents can be performed with the outcome_events.json endpoint.

Parameters include:
* actor_id - the ID of the assessment taker, e.g. "https://example.edu/user/554433"
* object_id - the ID of the assessment attempt, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001/attempt/5678"
* generated_id - the ID of the assessment result, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001/attempt/5678/result

Example REST call (all outcome events for specified user) :
```
  curl https://opencallisto.org/assessment_events.json?actor_id=https://example.edu/user/554433
```

### MediaEvents

Various queries on MediaEvents can be performed with the media_events.json endpoint.

Parameters include:
* actor_id - the ID of the media viewer, e.g. "https://example.edu/user/554433"
* action_id - what happened with the video, e.g. "http://purl.imsglobal.org/vocab/caliper/v1/action#Paused"
* object_id - the URL of the video itself, e.g. "https://example.com/super-media-tool/video/1225"

Example REST call (all outcome events for specified user) :
```
  curl https://opencallisto.org/media_events.json?actor_id=https://example.edu/user/554433
```

# Credits

Callisto is a project from [OpenEd, Inc.](http://www.opened.com), a division of ACT Assessment Technologies.

Current contributors include Adam Blum, Lucas Campbell and Lars Burgess.

It is open source and available via [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0.html).  Please submit pull requests to us via the GitHub repo if you make enhancements.  [Email us](mailto:adam@opened.com) if you want to discuss your contributions. 

IMS Caliper is a trademark of [IMS Global](http://imsglobal.org)
