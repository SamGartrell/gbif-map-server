-- https://postgrest.org/en/v12/tutorials/tut0.html

-- create schema to store postgrest API functions
CREATE SCHEMA api;

-- create the table to store and retreive todos
create table api.todos (
  id serial primary key,
  done boolean not null default false,
  task text not null,
  due timestamptz
);

-- insert sample data into the table
insert into api.todos (task) values
  ('finish tutorial 0'), ('pat self on back');