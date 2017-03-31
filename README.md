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
  "sensor": "https://<<Caliper sensor site URL>",
  "sendTime":"2017-03-29T00:29:26.154Z",
  "data":"[{event 1},{event 2}]}" https://opencallisto.herokuapp.com/caliper_events/create
```
