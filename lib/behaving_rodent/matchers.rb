module BehavingRodent
  module Matchers
    def included?(klass)
      # Make we.should matchers possible
      klass.send(:alias_method, :we, :page)

      RSpec::Matchers.define :be_on_the do |path|
        match do |page|
          page.current_path == path
        end
        
        failure_message_for_should do |page|
          "expected to be on #{path}, but was on #{page.current_path}"
        end
        
        failure_message_for_should_not do |page|
          "expected not to be on #{path}"
        end
      end

      Rspec::Matchers.define :see do |*args|
        text = args[0]
        options = args[1].is_a?(Hash) ? args[1] : {}
        match do |page|
          page.visit(options[:on]) unless options[:on].nil?

          if options[:in].nil?
            page.has_content?(text)
          else
            page.has_css?(options[:in], :text => text)
          end
        end

        failure_message_for_should do |page|
          "expected to see \"#{text}\" on the page #{page.current_path}"
        end
        
        failure_message_for_should_not do |page|
          "expected not to see \"#{text}\" on the page #{page.current_path}"
        end
      end

      Rspec::Matchers.define :see_image do |*args|
        url = args[0]
        if url[0,1]!='/'
          # Rails magic
          selector = "img[src^=\"/images/#{url}?\"]"
        else
          selector = "img[src^=\"#{url}?\"]"
        end
        options = args[1].is_a?(Hash) ? args[1] : {}
        match do |page|
          if options[:in].nil?
            page.has_css?(selector)
          else
            page.has_css?(selector)
          end
        end

        failure_message_for_should do |page|
          "expected to see image \"#{url}\" on the page #{page.current_path}"
        end
        
        failure_message_for_should_not do |page|
          "expected not to see image \"#{url}\" on the page #{page.current_path}"
        end
      end
    end
  end
end
