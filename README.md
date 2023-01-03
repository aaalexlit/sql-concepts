# SQL learning playground
## About this repo
This repo is inspired by the post ["SQL Requirements for a Data Scientist in Amazon + Cheat Sheet"](https://medium.com/@fmnobar/sql-requirements-for-a-data-scientist-in-amazon-cheat-sheet-b1e24004ede7) on medium by [Farzad Mahmoodi Nobar](https://www.linkedin.com/in/fmnobar/)

Using the following repo you can start practicing SQL following the mentioned post right away without the necessity to install or configure anything.

## Prerequisites

All you need is an account with Docker that we would need to be able to use [Play With Docker](https://labs.play-with-docker.com/).  
If you don't have one you can register it on the [Docker Hub](https://hub.docker.com/)

## Follow Along
1. Log into [Play With Docker](https://labs.play-with-docker.com/) and press "Start"
1. Press a " + ADD NEW INSTANCE"  
You'll see a terminal appear 
![Add new instance button](https://raw.githubusercontent.com/aaalexlit/sql-concepts/main/images/new_instance.png)
1. In the terminal clone this repo
    ```bash
    $ git clone  https://github.com/aaalexlit/sql-concepts.git
    $ cd sql-concepts/
    $ docker compose up
    ```
1. Wait until the needed images are pulled 
next to the "OPEN PORT" button on the upper row you'll see a list of hyperlinks with the corresponding ports.
![hyperlinked ports](https://raw.githubusercontent.com/aaalexlit/sql-concepts/main/images/open_gui.png)
Press the "8080" one and you'll have a new tab with an instance of [Cloudbeaver](https://dbeaver.com/docs/cloudbeaver/Build-and-deploy/) - a database management tool with a rich web interface
1. You need to login with `learner/learner` to Cloudbeaver to get access to the preconfigured connection and sql sheet.
![Cloudbeaver login](https://raw.githubusercontent.com/aaalexlit/sql-concepts/main/images/cloudbeaver_login.png)
![Login page](https://raw.githubusercontent.com/aaalexlit/sql-concepts/main/images/login_page.png)
1. Press the "Tools" button and check "SQL scripts manager" option
![Enable SQLscripts manager](https://raw.githubusercontent.com/aaalexlit/sql-concepts/main/images/enable_sql_scripst_manager.png)
1. On the right-hand side you'll see a panel with one script "sql_for_data_science.sql".
1. Double-click it and select the "Restore" option.
![Restore connection](https://raw.githubusercontent.com/aaalexlit/sql-concepts/main/images/restore_connection.png)
1. That's it! you're ready to follow along the article.

> Important note: always run the first statement `SET search_path TO examples;` after you restore your connection. Otherwise you'll see the following error
![Relation doesn't exist error](https://raw.githubusercontent.com/aaalexlit/sql-concepts/main/images/relation_doesnt_exist.png)

## Useful Cloudbeaver shortcuts

`Ctrl+Enter` executes a statement under the cursor
`Ctrl+Shift+Enter` executes a statement under the cursor in a separate tab (ie no "overwriting" the results of the previously executed statement)
That should be enough for starters

## Running locally

Obviously, if you have Git and Docker installer on your machine, you can follow the steps above on your machine.  
The only difference is that you'd need to go to [http://localhost:8080/](http://localhost:8080/) to see the IDE

## Behind the scenes
There are 2 docker containers
* PostrgeSQL 15.1
* Cloudbeaver 

see the details in the [docker-compose.yaml](https://github.com/aaalexlit/sql-concepts/blob/main/docker-compose.yaml)

and 2 volumes with
* initial database setup sql scripts that create the tables and fill them up
* Cloudbeaver workspace that contains pre-configures user, connection and `sql_for_data_science.sql` script


## Things that can be tweaked

Coudbeaver Session is set up to last 30 minutes. You can change that!  

To be able to experiment and create your own tables etc, you'll need to 
1. Edit connection properties
1. Set readOnlyMode to `ignore`

## Useful links:  
[Documentation for Postgres Docker image on Docker Hub](https://hub.docker.com/_/postgres/)  
[CloudBeaver Documenataion](https://dbeaver.com/docs/cloudbeaver/Build-and-deploy/)