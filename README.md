[![Callisto](https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fe%2Fe9%2FCallisto.jpg&imgrefurl=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FCallisto_(moon)&docid=tD_c3u1PG4yfIM&tbnid=2j8CMWUau04HWM%3A&vet=10ahUKEwiXz9Of6_7SAhVpxFQKHY4-B3YQMwg-KAAwAA..i&w=740&h=753&bih=1080&biw=1920&q=callisto&ved=0ahUKEwiXz9Of6_7SAhVpxFQKHY4-B3YQMwg-KAAwAA&iact=mrc&uact=8)](http://google.com/)

# Callisto Vision

Most Learning Record Stores (LRSes) that support IMS Global Caliper (or XAPI) today
just store the JSONB of the event payload in some fashion.  There is no built-in
query capability. You must write rather elaborate JSON queries to gain insight
into student usage patterns based on the events.  

Callisto provides the same generic event store. But it decomposes the various
event types into their own structured forms and then exposes specific REST
queries for each event type. It is our hope that the Callisto query web Services
eventually become extensions to the IMS Global Caliper standard. 
