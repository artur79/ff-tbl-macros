# ff-tbl-macros

![MIT-LICENSE](https://img.shields.io/github/license/firefield/ff-tbl-macros.svg?style=flat-square) ![build status](https://img.shields.io/travis/firefield/ff-tbl-macros.svg?style=flat-square)

Macros for Trailblazer operations.

# Overview

## Features

- several predefined macros organized in namespaces
- custom macros

# Getting Started

## Prerequisites

For contributing, install docker to use the provided dockerized development environment.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ff-tbl-macros', git: 'https://github.com/firefield/ff-tbl-macros.git'
```

# Usage

Use the macros in the operation steps:

```ruby
class User::Delete < Trailblazer::Operation
  step Macros::Model::Destroy()
end
```

# Contributing

1. Fork the Project
1. Create your Feature Branch (git checkout -b feature/AmazingFeature)
1. Commit your Changes (git commit -m 'Add some AmazingFeature)
1. Push to the Branch (git push origin feature/AmazingFeature)
1. Open a Pull Request

## Development

The project includes a dockerized development environment.

```
# build the docker containers
docker-compose build

# run the specs
docker-compose run --rm app bundle exec rspec

```

# Documentation

## Macros Types

There are several types of macros organized in namespaces.

### Auth Macros

- `Macros::Auth::Authenticate`
- `Macros::Auth::SignIn`
- `Macros::Auth::SignOut`

### Contract Macros

- `Macros::Contract::ExtractParams`
- `Macros::Contract::Prepopulate`

### Context Macros

- `Macros::Ctx::Copy`
- `Macros::Ctx::Inspect`
- `Macros::Ctx::ValidatePresence`

### Current User Macros

- `Macros::CurrentUser::Set`

### Error Macros

- `Macros::Error::SetFromContract`

### Model Macros

- `Macros::Model::Build`
- `Macros::Model::Copy`
- `Macros::Model::Destroy`
- `Macros::Model::Persist`

### Search Macros

- `Macros::Search::Query`

### Verify Params Macros

- `Macros::VeriryParams::Date`

## Application Specific Macros

You can create your own custom macros specific to your application. Just put them in the _lib/macros_ folder of your Rails app following this convention:

_lib/macros/lorem.rb_
```ruby
module Macros
  class Lorem < Macros::Base
    register :print_ipsum
  end
end
```

_lib/macros/lorem/print_ipsum.rb_
```ruby
module Macros
  class Lorem
    # Some info what your macro does
    #
    # @examples
    #   step Macros::Lorem::PrintIpsum(count:)
    #
    class PrintIpsum < Macros::Base
      def initialize(count:)
        @count = count
      end

      def call(ctx, **)
        @count.times { print 'Ipsum' }
      end
    end
  end
end
```

# License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

# Aknowledgements

Gem used https://github.com/coditsu/macros as the base.

