## Behaving Rodent

I'm extracting all behavioral matchers & helpers from my acceptance tests and putting them here.

Fork if you want, but keep it DRY.

## How to use

Just include it in your config:

    RSpec.configure do |c|
      c.include BehavingRodent, :type => :request
    end

See the rdoc for more info on what's included.
