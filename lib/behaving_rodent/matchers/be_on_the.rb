module BehavingRodent
  module Matchers
    class BeOnThe
      def initialize(path)
        @path = path
      end

      def matches?(page)
        @page = page
        @page.current_path == @path
      end

      def failure_message_for_should
        "expected to be on #{@path}, but was on #{@page.current_path}"
      end

      def failure_message_for_should_not
        "expected not to be on #{@path}"
      end
    end
  end
end
