# Project description
Simple social network :smiley:

# Project structure
## Api
- Language: Ruby 2.6.5
- Framework: Rails 5.2.3 api mode
- Running on port: 3000
## Frontend
- Language: Javascript
- Framework: Vuejs
- Running on port: 8080

# Code convention
## Api
1. use snake_case
2. format as rubocop lint

## frontend
2. use camelCase

# Running project on docker
1. Clone from git
2. Run ```docker-compose run api bundle install```
3. Enjoy

# Note for api
1. Write test before write code
2. Test and use lint to format before create pull request
3. After add gem into gem file must run ```docker-compose run api bundle install``` again

# HTTP status code using
## OK
|method|action|symbol|status code|
|---|---|---|---|
|index/show|get|:ok|200|
|create|post|:created|201|
|update|put|:ok|200|
|destroy|delete|:no_content|204|

## response format
```json
{
    "data": "..."
}
```

## error
|description|symbol|status code|
|---|---|---|
|data invalid|:bad_request|400|
|unauthorize|:unauthorized|401|
|user not allowed to access|:forbidden|403|
|not found|:not_found|404|
|system error|:internal_server_error|500|

## response
```json
{
    "error": "..."
}
```
