# README
This is an API REST that uses Ruby on Rails 5 and PostgreSQL as the database.

## Requirements

In order to install and run the project locally you need to have the following installed:

* [Ruby 2.6.2](https://www.ruby-lang.org/es/downloads/)
* [PostgreSQL](https://www.postgresql.org/)

## Setup

Download the project by cloning it from Git:

```
$ git clone git@github.com:mejialvarez/msv_test.git
```

Install the dependencies with:

```
$ bundle
```

Create the database and run the migrations by executing:

```
$ rails db:create
$ rails db:migrate
```

You can seed the database running:

```
$ rails db:seed
```
This command will create one binary tree. Check the file [seeds.rb](db/seeds.rb) for more information.


## Endpoints:

```
POST   /api/v1/binary_trees
```
|Parameter    |Parameter type    |Data type            |
|:-----------:|:----------------:|:-------------------:|
|binary_tree  |body              |`{"nodes": "Array"}` |


```
GET    /api/v1/binary_trees/:id/lowest_common_ancestor
```
|Parameter    |Parameter type    |Data type            |
|:-----------:|:----------------:|:-------------------:|
|id           |path              |integer              |


## API REST

Go to https://msvtest.herokuapp.com/