# ff-tbl-macros

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'ff-tbl-macros', git: 'https://github.com/firefield/ff-tbl-macros.git'
```

## Example Usage
```ruby
class User::Delete < Trailblazer::Operation
  step Macros::Model::Destroy()
end
```

## Application Specific Macros
Some macros are tighten to specific app functionality and should not be included in this gem.
If you'd like to add some custom macros just put them in the _lib/macros_ folder of your Rails app following the example convention:

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

### Running Specs
```
bundle exec rspec
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).