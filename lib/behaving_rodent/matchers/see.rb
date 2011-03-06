module BehavingRodent
  module Matchers
    class See
      def initialize(text, options = {})
        @text = text
        @options = options
      end

      def matches?(page)
        @page = page
        @page.visit(@options[:on]) unless @options[:on].nil?

        if @options[:in].nil?
          @page.has_content?(@text)
        else
          @page.has_css?(@options[:in], :text => @text)
        end
      end

      def failure_message_for_should
        "expected to see \"#{@text}\" on the page #{@page.current_path}"
      end
      
      def failure_message_for_should_no
        "expected not to see \"#{@text}\" on the page #{@page.current_path}"
      end
    end
  end
end
