# SQL learning jump-start
## About this repo
This repo is inspired by the post ["SQL Requirements for a Data Scientist in Amazon + Cheat Sheet"](https://medium.com/@fmnobar/sql-requirements-for-a-data-scientist-in-amazon-cheat-sheet-b1e24004ede7) on medium by [Farzad Mahmoodi Nobar](https://www.linkedin.com/in/fmnobar/)

Using the following repo you can start practicing SQL following the mentioned post right away without the necessity to install or configure anything.

## Prerequisites

All you need is an account with Docker that we would need to use [Play With Docker](https://labs.play-with-docker.com/).  
If you don't have one you can register it on the [Docker Hub](https://hub.docker.com/)

## Follow Along
1. Log into [Play With Docker](https://labs.play-with-docker.com/) and press "Start"
1. Press a " + ADD NEW INSTANCE"  
You'll see a terminal appear 
1. In the terminal clone this repo
    ```bash
    $ git clone  https://github.com/aaalexlit/sql-concepts.git
    $ cd sql-concepts/
    $ docker compose up -d
    ```
1. Wait until the needed images are pulled  
You'll see a list of hyperlinks with the corresponding ports next to the "OPEN PORT" button on the upper row.
Press the "8080" one and you'll have a new tab with and instance of [Cloudbeaver](https://dbeaver.com/docs/cloudbeaver/Build-and-deploy/) - and IDE with a rich web interface
1. You need to login with `learner/learner` to Cloudbeaver to get access to the preconfigured connection and sql sheet.
1. 

## Behind the scenes



This can be changed:

Preconfigured CloudBeaver session = learner/learner (only for studyin, don't do this in production)

Session lasts 30 mins 

Useful links:  
[Documentation for Postgres Docker image on Docker Hub](https://hub.docker.com/_/postgres/)
[CloudBeaver Documenataion](https://dbeaver.com/docs/cloudbeaver/Build-and-deploy/)