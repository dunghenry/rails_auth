## Ruby on rails + Authentication + Docker + MongoDB

### Install mongoid: add gem 'mongoid' to Gemfile

```js
bundle install
```

### Generate the default Mongoid configuration

```js
bin/rails g mongoid:config
```

### Create model User

```js
bin/rails g scaffold User username:string email:string password:string
```

### List routes

```js
rails routes
```
