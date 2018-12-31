+++
Categories = ["posts"]
Description = "2018 - Year in Review"
Tags = ["2018"]
date = "2018-12-31T15:35:00-04:00"
menu = "main"
title = "2018 - Year in Review"
draft = false
+++

In trying to [keep]({{< ref "year-in-review.md" >}}) the [tradition]({{< ref "2017-year-in-review.md" >}}) of posting a year in review, so here it goes.

## Programming

This year I continued working part-time on a LAMP stack app, the one that used Angular 1.x for the UI. I also continued fixing bugs and adding new features to the "web based application to assist in monitoring local government, which I still continue to do. I did move it over to use Amazon AWS hosted Elasticsearch because the single, "small" EC2 server was being overloaded.

This year, I gave up working remote to help focus on getting the "next generation backend processing system" (mentioned in last years [post]({{< ref "2017-year-in-review.md" >}})) to production. I'm happy to report we did get it deployed to production in September with only a few issues in the weeks after the cut-over. In particular, we realized that heavily using blobs in [Crate](https://crate.io/) was not feasible, at least with our use case and cluster size. We actually migrated blob storage over to a self-hosted [Minio](https://www.minio.io/) cluster. The biggest drawback so far with Minio, is the time it takes to list objects and delete them. A co-worker developed an application that runs alongside Minio that can "age-off" data by time, by simply deleting the files from disk (on each server + disk(s)) which has been working quite well.

This year I only tried and used a few new technologies or libraries:

* [Minio](https://www.minio.io/)
* [http4k](https://www.http4k.org/)
* [AWS SDKs](https://aws.amazon.com/tools/) - Java/Python/Go - the Minio clients didn't support batch deletes at the time

The languages and prominent technologies I continued using this year included:

* [Go](http://golang.org)
* [Python](http://python.org)
* [Kotlin](https://kotlinlang.org/) - just beginning to work with Kotlin, replacing Scala
* [Bash](https://www.gnu.org/software/bash/)
* [PHP](http://www.php.net/)
* [AngularJS 1.x](https://angularjs.org/)
* [Vue.js](https://vuejs.org/)
* [Elasticsearch](https://www.elastic.co/products/elasticsearch)
* [Docker](https://www.docker.com/)
* [Mesos](http://mesos.apache.org/)
* [Marathon](https://mesosphere.github.io/marathon/)
* [Crate](https://crate.io/)
* [RabbitMQ](https://www.rabbitmq.com/)
* [Salt](https://docs.saltstack.com/en/2016.3/contents.html)
* [Nginx](https://nginx.org/en/)
* [Nixy](https://github.com/martensson/nixy)

## Looking Back

To recap, for 2018 I wanted to:

* exercise regularly
    * I averaged 3 days per week
* give up energy drinks
    * I didn't completely, in June I decided to stop and I ended up having a few more from June - December (mostly because of long working days where I'd only get 3.5 - 4 hours of sleep). I do occasionally drink coffee and sometimes I'll have other energy style drinks (hi-ball for example), though they use coffee beans for caffeine and don't include other chemicals.
* read more books
    * success, though I don't retain a lot of details, which might be something to work on in 2019. I did read a few books:
        * [West Cork](https://www.goodreads.com/book/show/38108759-west-cork)
        * [Astrophysics for People in a Hurry](https://www.goodreads.com/book/show/32191710-astrophysics-for-people-in-a-hurry)
            * this got me looking up at the night sky more often, which resulted in seeing ~10 shooting stars
        * [Red Sparrow](https://www.goodreads.com/book/show/15803037-red-sparrow)
        * [12 Rules for Life: An Antidote to Chaos](https://www.goodreads.com/book/show/30257963-12-rules-for-life)
        * [Crushing It](https://www.goodreads.com/book/show/36045512-crushing-it)
        * [Norse Mythology](https://www.goodreads.com/book/show/37903770-norse-mythology)
        * [Palace of Treason](https://www.goodreads.com/book/show/22609257-palace-of-treason) - sequel to Red Sparrow, haven't finished
        * [Unshakeable: Your Financial Freedom Playbook](https://www.goodreads.com/book/show/40885164-unshakeable)
* take the kids to Disney
    * we went on a 7 day cruise on Disney Fantasy to the Eastern Caribbean (Philipsburg, St. Maarten; St. Thomas; Castaway Cay, Bahamas)
* get more experience with machine learning and natural language processing
    * not really
* have a date night (in or out of the house) with Kelly at least every other month (more the better :)
    * we went to frederick a few times ([hootch and banter](http://hootchandbanter.com/) was one that was a lot of fun) and to a few places in Westminster
    * we also were able to go to the gym and run errands from time to time
* celebrated 20 years with my the love of my life 
* officially started a company, [Codescratch](https://codescratch.com) with two partners and we celebrated the new beginning with our wives at [Rose's Luxury](https://www.rosesluxury.com/)

## Looking Forward

In 2019 I will:

* exercise regularly, with a few specific goals:
    * bench press 5 reps at 150lb (max I've tried by myself is 105)
    * curl dumbbells 5 reps (each arm) at 50 lbs (today I can do 1-2 sets of 5 reps at 40lb)
    * run 1 mile in 8 minutes (no idea what my timing is now, in middle school I could do 6:50 or so)
* read more books
    * [Palace of Treason](https://www.goodreads.com/book/show/22609257-palace-of-treason) - book 2 in the Red Sparrow Trilogy, finish it
    * [The Kremlin's Candidate](https://www.goodreads.com/book/show/30753713-the-kremlin-s-candidate) - book 3 in the Red Sparrow Trilogy
    * [A Monster Calls](https://www.goodreads.com/book/show/25480342-a-monster-calls)
    * [Designing Data-Intensive Applications](https://www.goodreads.com/book/show/23463279-designing-data-intensive-applications)
* take Kelly and the kids to [Toby's Dinner Theatre](https://tobysdinnertheatre.com/)
* go to the beach

I want to:

* get our driveway paved, its currently just stone
* landscaping in the backyard, the grass by the deck stairs and around needs some major love, thanks to our wonderful Sheepies
* try new things, perhaps:
    * indoor rock climbing ([here](https://www.earthtreksclimbing.com/columbia/), maybe [here](http://climbzone.us/))
    * [indoor sky diving](https://www.iflyworld.com/)
    * [go kart racing](https://autobahnspeed.com/)
    * kayaking

