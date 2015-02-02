# aqua-io-ruby

Official [Aqua.io](https://aqua.io) API library client for Ruby. Currently covers Aqua.io's ICD-9 and ICD-10 APIs.

## Getting Started

To use the Aqua.io API, you need to have proper API credentials, which you can get for free by [signing up](https://aqua.io/developers/sign_up).

You may also want to read up on [the API documentation](https://aqua.io/codes).

## Installation

#### Versions

Works with Ruby [ 1.8.6 / 1.8.7 / 1.9.1 / 1.9.2 / 1.9.3 / 2.0.0 / 2.1.0 / 2.1.1 ]

#### Ruby on Rails

```ruby
gem 'aqua-io',		'~> 0.1.0'
```

#### Other Ruby Projects

Make sure you have [rubygems](https://rubygems.org) installed

```bash
$ gem install aqua-io
```

Then in your project:

```ruby
require "aqua-io"
```

## Usage

### Build a client

##### Get an access token using your aqua.io credentials

```ruby
client = AquaIo::Client.new({ client_id: '09a8b7', client_secret: '1a2b3' }, client_options)

token = client.access_token.retrieve

access_token = {access_token: token.body['access_token']}
```

##### All other API calls require an access token

```ruby
client = AquaIo::Client.new(access_token, client_options)
```

### Client Options

The following options are available while instantiating a client:

 * __base__: Base url for the api
 * __user_agent__: Default user-agent for all requests
 * __headers__: Default headers for all requests
 * __request_type__: Default format of the request body

### Response information

__All the callbacks provided to an api call will receive the response as shown below__

```ruby
response = client.icd9.top_level_codes

response.code
# >>> 200

response.headers
# >>> {'x-server' => 'nginx/1.6.2', ...}
```

##### JSON response

When the response sent by server is __json__, it is decoded into a hash

```ruby
response.body
#=> [{'short_description': 'INFECTIOUS AND PARASIT...', 'api_path': 'icd9/001-139', 'name': '001-139', 'description': 'INFECTIOUS AND PARASITIC DISEASES (001-139)'},  ... ]
```

### Method Options

The following options are available while calling a method of an api:

 * __headers__: Headers for the request
 * __query__: Query parameters for the url
 * __body__: Body of the request
 * __request_type__: Format of the request body

### Request body information

Set __request_type__ in options to modify the body accordingly

##### RAW request

When the value is set to __raw__, don't modify the body at all.

##### JSON request

When the value is set to __json__, JSON encode the body.

### ICD-9 api

Returns an ICD-9 code.

```ruby
icd9 = client.icd9
```

##### All top-level codes (GET codes/v1/icd9)

Returns all top-level ICD-9 codes. Useful for helping a user navigate down the ICD-9 hierarchy to find a code.

```ruby
response = icd9.top_level_codes(options)
```

##### Retrieve a single code. (GET codes/v1/icd9/:code_name)

Returns a single code matching the name, if any exists. Replace periods with hypens (e.g. '066-4' for '066.4')

The following arguments are required:

 * __code_name__: name of code

```ruby
response = icd9.single_code("066-4", options)
```

##### Search for codes by name. (GET codes/v1/icd9?q[name_cont]=:query)

Returns all codes whose name contains the search string.

The following arguments are required:

 * __query__: the search query string

```ruby
response = icd9.search_by_name("082-2", options)
```

##### Search for codes by description. (GET codes/v1/icd9?q[description_cont]=:query)

Returns all codes whose description contains the search string.

The following arguments are required:

 * __query__: the search query string

```ruby
response = icd9.search_by_description("eastern equine", options)
```

##### Search for codes by name or description. (GET codes/v1/icd9?q[name_or_description_cont]=:query)

Returns all codes whose name or description contains the search string.

The following arguments are required:

 * __query__: the search query string

```ruby
response = icd9.search_by_name_or_description("west nile", options)
```

### ICD-10 api

Returns an ICD-10 code.

```ruby
icd10 = client.icd10
```

##### All top-level codes (GET codes/v1/icd10)

Returns all top-level ICD-10 codes. Useful for helping a user navigate down the ICD-10 hierarchy to find a code.

```ruby
response = icd10.top_level_codes(options)
```

##### Retrieve a single code. (GET codes/v1/icd10/:code_name)

Returns a single code matching the name, if any exists. Replace periods with hypens (e.g. 'R50-9' for 'R50.9')

The following arguments are required:

 * __code_name__: name of code

```ruby
response = icd10.single_code("R50-9", options)
```

##### Search for codes by name. (GET codes/v1/icd10?q[name_cont]=:query)

Returns all codes whose name contains the search string.

The following arguments are required:

 * __query__: the search query string

```ruby
response = icd10.search_by_name("b05", options)
```

##### Search for codes by description. (GET codes/v1/icd10?q[description_cont]=:query)

Returns all codes whose description contains the search string.

The following arguments are required:

 * __query__: the search query string

```ruby
response = icd10.search_by_description("mumps", options)
```

##### Search for codes by name or description. (GET codes/v1/icd10?q[name_or_description_cont]=:query)

Returns all codes whose name or description contains the search string.

The following arguments are required:

 * __query__: the search query string

```ruby
response = icd10.search_by_name_or_description("rubella", options)
```

## Contributors
Here is a list of [Contributors](https://github.com/aquaio/aqua-io-ruby/contributors)

### TODO

* Other code sets

## License
MIT

## Bug Reports
Report [here](https://github.com/aquaio/aqua-io-ruby/issues).

## Contact
Michael Carroll at Aqua.io

michael@aqua.io

@aqua_io

__This library initially generated by [alpaca](https://github.com/pksunkara/alpaca).__
