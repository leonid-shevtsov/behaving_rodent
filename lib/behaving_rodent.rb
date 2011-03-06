require 'behaving_rodent/version'
require 'behaving_rodent/helpers'
require 'behaving_rodent/matchers'

module BehavingRodent
  def included(klass)
    klass.send(:include, Helpers)
    klass.send(:include, Matchers)
  end
end
