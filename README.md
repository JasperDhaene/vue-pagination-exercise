# Ziggu pagination exercise

## Software versions
- Ruby 2.3.7
- Rails 5.2.5
- Vue 3
- Postgres 11

## Setup

### Backend
```
bin/setup
rails s
```

### Frontend
```
cd frontend
yarn && yarn serve
```

## Thoughts on Vue

I started by reading through the guide on [https://vuejs.org/](vuejs.org). I read the first few pages of the 'Essentials' section but as I went on I searched more for topics I thought I'd need for this exercise.

It's clear that Vue is very different from Ember. In Ember you have `Routes` and `Controllers` that contain logic and represent a webpage with a distinct URL. The view is implemented in `Templates` with HTML and a separate templating language and components are just reusable parts of a template. Vue being entirely based around components is a very different philosophy to what I'm used to then.

The structure of a Vue component (all the logic, HTML and styling in the same file) and the concept of directives makes me think it would all look very messy in real applications. But maybe that's just a knee jerk reaction to quickly having to learn something different. After all, I haven't explored any best practices or seen any code from a larger application yet.

I've struggled with working on reusable components/services in Ember before so I'm curious if Vue has a clear advantage in this because of its design philosophy.

## Thoughts on the exercise

It's a nice challenge to make a full stack exercise like this in just a few hours but it is hectic if you're new to a framework. Everything you read is immediately put into practice but I think you only get a shallow impression from what you're trying to learn. I don't feel like I've learned much Vue from this yet. Normally I'd read through more of the guide and look at real code to get a better feel for the framework and how to think in "Vue".

## Design decisions

### Backend

Because of the time constraints I added gems I'm familiar with. These include:
- `kaminari`: pagination
- `active_model_serializers`: serializing objects in API response
- `faker`: dummy data used for seeding the database
- `annotate`: adds model schemas
- `pry-rails`: used for debugging and makes the rails console output easier to work with 

While working on the front-end there were CORS errors that prevented API calls from being made so I ended up using `rack-cors` as well.

I went with the suggestion from the assignment to create a `User` model and only added the bare minimum of properties like name and email.

The `index` method of `UsersController` is very straighforward: just fetching all Users and paginating. In a larger application I would write this differently. Permitted params and fetching data from a reusable repository seemed like overkill for this exercise though.

The database is seeded with 100 Users. Despite the usage of a `per_page` parameter, this is hard-coded in the front-end to 10 users per page. 

### Frontend

Text is hard-coded because this is just an exercise. In normal circumstances i18n and a loading state during the API call should be considered.

The page shows a table of 10 users. I implemented the simplest way to navigate through the pages with a `Previous page` and `Next page` button.

### Overall

No tests were written due to time constraints.


## How I initialized the project

- `rails new ziggu-pagination-exercise --database=postgresql --api`
- `npm i -g @vue/cli`
- `vue create frontend`