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

## Development (docker-based)

### Prerequisites

* Docker
* Docker Compose
* PostgreSQL 9.6+ (client only)

### Setup

Clone project:

```sh
git clone https://github.com/openedinc/callisto.git
cd callisto
```

Initialize containers:

```sh
docker-compose up
```

The first time you run this will take a few minutes, it should output something similar to the following:

```sh
postgres_1  |  done
postgres_1  | server stopped
postgres_1  |
postgres_1  | PostgreSQL init process complete; ready for start up.
postgres_1  |
postgres_1  | LOG:  database system was shut down at 2018-01-30 00:34:47 UTC
postgres_1  | LOG:  MultiXact member wraparound protections are now enabled
postgres_1  | LOG:  database system is ready to accept connections
postgres_1  | LOG:  autovacuum launcher started
callisto_web_1 exited with code 1
...
```

This is expected and only will happen the first time you launch the containers. Cancel the operation with `Ctrl+c`. Next, initialize the database:

```sh
docker-compose run web bin/rails db:migrate db:seed
```

This will setup the database tables. You should output like this:

```sh
...
== 20180130181022 CreateActiveAdminComments: migrating ========================
-- create_table(:active_admin_comments)
   -> 0.0541s
-- add_index(:active_admin_comments, [:namespace])

$

```

Now restart the web container. The database container should already be running.

```sh
docker-compose restart web
docker-compose ps
```

You should see the following:

```sh
Name                      Command              State           Ports
------------------------------------------------------------------------------------
callisto_postgres_1   docker-entrypoint.sh postgres   Up      5432/tcp
callisto_web_1        bin/rails s -p 3000             Up      0.0.0.0:3000->3000/tcp
```

### Create Test User

You can create a test user by running the following script:

```sh
docker-compose exec web bin/rails user:create["testuser@example.com","password"]
```

## Development (without docker)

We recommend developing callisto using docker so you can ensure the application will run the same way locally as it does in production. Below are the steps if you'd like to run it without docker.

### Prerequisites

* Ruby 2.4.3
* PostgreSQL 9.6+

### Setup

Clone project:

```sh
git clone https://github.com/openedinc/callisto.git
cd callisto
```

Run setup script to install gems and prepare the database:

```sh
bin/setup
```

Now you can run the project:

```sh
bin/rails s
```

### Create Test User

You can create a test user by running the following script:

```sh
docker-compose exec web bin/rails user:create["testuser@example.com","password"]
```

## Endpoints

### Getting your token

You will need to sign in to get your access-token, uid, and client.  These attributes will be used in all subsequent requests to authenticate your user.

#### Request

```sh
curl -X POST -i \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  "http://localhost:3000/api/v1/auth/sign_in" \
  -d '{"email": "testuser@example.com", "password": "password" }'
```

#### Response Headers

```
access-token: VBU0HTcLQRX6X6o2rnXtmw
token-type: Bearer
client: 67iQfwL3rJ_Da7nNXwKhNw
expiry: 1519412618
uid: testuser@example.com
```

#### Every other request should have headers set similar to below

```sh
curl -H 'Content-Type: application/json' \
  -H 'access-token: VBU0HTcLQRX6X6o2rnXtmw' \
  -H 'client: 67iQfwL3rJ_Da7nNXwKhNw' \
  -H "uid: testuser@example.com" \ http://localhost:3000/api/v1/example_endpoint
```

### Querying for Event Types

#### AssessmentItemEvents

Various queries on AssessmentItemEvents can be performed with the `assessment_item_events.json` endpoint.

Parameters include:
* actor_id - the ID of the assessment item taker, e.g. "https://example.edu/user/554433"
* action_id - what happened with the assessment item, e.g. "http://purl.imsglobal.org/vocab/caliper/v1/action#Completed"
* object_id - the assessment item ID itself, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001"
* generated_id - the ID of the assessment attempt, e.g. ""https://example.edu/politicalScience/2015/american-revolution-101/assessment/001/item/001/response/001""
* learning_objective - all GradeEvents for a particular learning objective, expressed as a CASE URL

Example REST call (all assessment item events for specified user):

```sh
curl -H 'Content-Type: application/json' \
  -H 'access-token: lW1c60hYkRwAinzUqgLfsQ' \
  -H 'client: W_xCQuggzNOVeCnNZbjKFw' \
  -H 'uid: testuser@example.com' \
  https://opencallisto.org/api/v1/assessment_item_events.json?actor_id=https://example.edu/user/554433
```

#### GradeEvents

Various queries on GradeEvents can be performed with the grade_events.json endpoint.

Parameters include:
* actor_id - the ID of the assessment taker, e.g. "https://example.edu/user/554433"
* object_id - the ID of the assessment attempt, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001/attempt/5678"
* object_assignable - the ID of the assessment, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/0011"
* generated_id - the ID of the assessment result, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001/attempt/5678/result
* learning_objective - all GradeEvents for a particular learning objective, expressed as a CASE URL

Example REST call (all grade events for specified user):

```sh
curl -H 'Content-Type: application/json' \
  -H 'access-token: lW1c60hYkRwAinzUqgLfsQ'
  -H 'client: W_xCQuggzNOVeCnNZbjKFw' \
  -H 'uid: testuser@example.com' \
  https://opencallisto.org/api/v1/grade_events.json?actor_id=https://example.edu/user/554433
```

#### AssessmentEvents

Various queries on AssessmentEvents can be performed with the grade_events.json endpoint.

Parameters include:
* actor_id - the ID of the assessment taker, e.g. "https://example.edu/user/554433"
* action - what happened with the assessment, e.g."http://purl.imsglobal.org/vocab/caliper/v1/action#Paused"
* object_id - the ID of the assessment, e.g. "https://A0501617.opened.com/assessment_bank/0235872d-636a-4467-94d0-5ab6842463ed/assessment/1094264"
* generated_id - the ID of the assessment attempt, e.g. "https://example.edu/politicalScience/2015/american-revolution-101/assessment/001/attempt/5678/result
* learning_objective - all GradeEvents for a particular learning objective, expressed as a CASE URL

Example REST call (all grade events for specified user):

```sh
curl -H 'Content-Type: application/json' \
  -H 'access-token: lW1c60hYkRwAinzUqgLfsQ'
  -H 'client: W_xCQuggzNOVeCnNZbjKFw' \
  -H 'uid: testuser@example.com' \
  https://opencallisto.org/api/v1/assessment_events.json?actor_id=https://example.edu/user/554433
```

#### MediaEvents

Various queries on MediaEvents can be performed with the media_events.json endpoint.

Parameters include:
* actor_id - the ID of the media viewer, e.g. "https://example.edu/user/554433"
* action_id - what happened with the video, e.g. "http://purl.imsglobal.org/vocab/caliper/v1/action#Ended"
* object_id - the URL of the video itself, e.g. "https://example.com/super-media-tool/video/1225"
* learning_objective - the learning objective of the video, expressed as the CASE URL for the standard, e.g. http://opensalt.opened.com/cftree/item/19033

Example REST call (all grade events for specified user):

```sh
curl -H 'Content-Type: application/json' \
  -H 'access-token: lW1c60hYkRwAinzUqgLfsQ'
  -H 'client: W_xCQuggzNOVeCnNZbjKFw' \
  -H 'uid: testuser@example.com' \
  https://opencallisto.org/api/v1/media_events.json?actor_id=https://example.edu/user/554433
```

## Database Schema Generation Rules

Callisto relies on Postgres to store the attributes of each Caliper event individually. This includes columns such as actor_id, action_id, and object_id. As new Caliper events get created the following rules should be followed for generating Postgres tables and their columns.   The rules here are also useful for code the expects to populate rows to the table.

Table names (following the ActiveRecord convention) should be the Caliper event name (its type) with underscores between words.  For example the Caliper AssessmentEvent has the table name "assessment_events".  

The columns that must always be present include:
* id - a unique ID for the row stored in the table.  This is necessary for the ActiveRecord ORM to function.  
ables for each event should be available with the following rules. Code that populates the table does not have to populate this column
* event_id - the Caliper id attribute should be represented as event_id in the table to not collide with the id column mentioned above
* payload - a direct duplicate of the JSON of the original Caliper payload
* client - this column will be the identity of the logged in application sending Caliper events or querying for them. It is used to segment the data by particular groups.  

The Caliper event type attribute should NOT be present in the Postgres table, as it is implied by the table name.  

All other Caliper event attributes SHOULD be present in the table and abide by the following rules:
* The column names should be the exact Caliper attribute name but converted to underscores when there is more than one word instead of camelCase.  For example the "eventTime" attribute becomes "event_time".  
* Non-valid identified characters (alphanumeric plus underscore) should be stripped.  So the Caliper event attribute "@context" becomes "context".
* For attributes that are embedded inside other attributes, an underscore should be placed in between the parent and child attribute to create a column name.  For example the id attribute inside the actor attribute would be placed in the column "actor_id".

## Administration

Callisto includes an admin interface, powered by [active admin](https://activeadmin.info). This interface is enabled by default at the `/admin` path. For example, in local development: http://localhost:3000/admin

### Disabling the admin interface

To disable the admin interface, make sure the `ENABLE_ACTIVE_ADMIN` environment variable is either not set or set it to `'false'`.

### Admin interface security

**NOTE:** Callisto's active admin interface should not be exposed to the public internet for anything other than development / test environments. Production environments should run a copy of the callisto container on a secure network with the admin interface enabled.

## Credits

Callisto is a project from [ACT, Inc.](http://www.act.org).

Current contributors include Adam Blum, Lucas Campbell and Lars Burgess.

It is open source and available via [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0.html).  Please submit pull requests to us via the GitHub repo if you make enhancements.  [Email us](mailto:bluma@act.org) if you want to discuss your contributions.

IMS Caliper is a trademark of [IMS Global](http://imsglobal.org)
