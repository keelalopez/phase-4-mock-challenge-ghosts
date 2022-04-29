# Rails Mock Code Challenge - Haunted Houses

For this assessment, you'll be working with a Haunted Houses domain.

In this repo, there is a Rails application with some features built out. There is
no React client to work with, although you can build your own.

Your job is to build out the Rails API to add the functionality described in the
deliverables below.

## Setup

To download the dependencies for the backend, run:

```sh
bundle install
```

You can run your Rails API on [`localhost:3000`](http://localhost:3000) by running:

```sh
rails s
```

## Models

You need to create the following relationships:

- A `Ghost` has many `HauntedHouse`s through `Haunting`s
- A `HauntedHouse` has many `Ghost`s through `Haunting`s
- A `Haunting` belongs to a `Ghost` and belongs to a `Haunted House`

Start by creating the models and migrations for the following database tables:

### Haunted House

| Column  | Data Type |
| ------  | --------- |
| id      |   integer |
| address | string    |

### Ghost

| Column       | Data Type |
| ---------    | --------- |
| id           | integer   |
| name         | string    |
| age_at_death | integer   |

### Haunting

| Column           | Data Type |
| ---------        | --------- |
| id               | integer   |
| ghost_id         | integer   |
| haunted_house_id | integer   |


Add any code needed in the model files to establish the relationships.

You may optionally build your seed file to generate ghosts, haunted houses, and hauntings.

## Validations

Add validations to the `Ghost` model:

- must have an `age_at_death` between 0 and 110
- must have a name

Add validations to the `HauntedHouse` model:

- must start the address with a number (for example `21 Willow Street`)

## Routes

Set up the following routes. Make sure to return JSON data in the format
specified along with the appropriate HTTP verb.

### GET /ghosts

Return JSON data in the format below:

```json
[
  {
    "id": 1,
    "name": "Casper",
    "age_at_death": 12
  },
  {
    "id": 2,
    "name": "Old Man Withers",
    "age_at_death": 99
  }
]
```

### GET /ghosts/:id

If the `Ghost` exists, return JSON data in the format below:

```json
{
  "id": 1,
  "name": "Casper",
  "age_at_death": 12,
  "haunted_houses": [
    {
      "id": 1,
      "address": "21 Willow St",
    },
    {
      "id": 2,
      "address": "18 Tanglewood Ave"
    }
  ]
}
```

If the `Ghost` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```json
{
  "error": "Ghost not found"
}
```

### DELETE /ghosts/:id

If the `Ghost` exists, it should be removed from the database, along with
any `Haunting`s that are associated with it.

After deleting the `Ghost`, return an _empty_ response body, along with the
appropriate HTTP status code.

If the `Ghost` does not exist, return the following JSON data, along with
the appropriate HTTP status code:

```json
{
  "error": "Ghost not found"
}
```

### GET /haunted-houses

Return JSON data in the format below:

```json
[
  {
    "id": 1,
    "address": "21 Willow St",
  },
  {
    "id": 2,
    "address": "18 Tanglewood Ave"
  }
]
```

You may need to alter the resources in routes to make sure the path reads as `haunted-houses` rather than `haunted_houses`.

### POST /hauntings

This route should create a new `Haunting` that is associated with an
existing `Ghost` and `HauntedHouse`. It should accept an object with the following
properties in the body of the request:

```json
{
  "ghost_id": 1,
  "haunted_house_id": 2
}
```

If the `Haunting` is created successfully, send back a response with the data
related to the `Ghost` and `HauntedHouse`:

```json
{
  "id": 3,
  "ghost": {
    "id": 1,
    "name": "Casper",
    "age_at_death": 12
  },
  "haunted_house": {
    "id": 2,
    "address": "18 Tanglewood Ave"
  }
}
```

If the `Haunting` is **not** created successfully, return the following
JSON data, along with the appropriate HTTP status code:

```json
{
  "errors": ["Ghost must exist", "HauntedHouse must exist", "any other messages we may get"]
}
```
