module BehavingRodent
  module Matchers
    class StayOnTheSame
      def initialize(page)
        @page = page
      end

      def matches?(proc)
        @page.execute_script('window.rspec_stay_on_the_same_page_flag = true');
        @path = @page.current_path
        proc.call
        puts @page.evaluate_script('typeof(window.rspec_stay_on_the_same_page_flag)')
        @page.evaluate_script('typeof(window.rspec_stay_on_the_same_page_flag)')=='boolean'
      end
      
      def failure_message_for_should
        "expected the block to stay on the page at #{@path}, but " +
          (@page.current_path==@path ? 'the page was reloaded' : "it navigated to #{@page.current_path}")
      end

      def failure_message_for_should_not
        "expected the block to navigate from #{@path} or reload, but it stayed on the same page"
      end
    end
  end
end
