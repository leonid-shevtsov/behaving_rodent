module BehavingRodent
  module Matchers
    class SeeImage
      def initialize(url, options)
        @url = url
        @options = options 
        if @url[0,1]!='/' && @url[0,7]!='http://'
          # Rails magic
          @selector = "img[src^=\"/images/#{@url}?\"]"
        else
          @selector = "img[src^=\"#{@url}?\"]"
        end
      end

      def matches?(page)
        @page = page
        if @options[:in].nil?
          @page.has_css?(@selector)
        else
          @page.has_css?(@selector)
        end
      end

      def failure_message_for_should
        "expected to see image \"#{@url}\" on the page #{@page.current_path}"
      end

      def failure_message_for_should_not
        "expected not to see image \"#{@url}\" on the page #{@page.current_path}"
      end
    end
  end
end
