require 'behaving_rodent/matchers/be_on_the'
require 'behaving_rodent/matchers/stay_on_the_same'
require 'behaving_rodent/matchers/see'
require 'behaving_rodent/matchers/see_image'

module BehavingRodent
  module Matchers
    def included(klass)
      # Make we.should matchers possible
      klass.send(:alias_method, :we, :page)

      # Test the current URL
      #
      #     we.should be_on_the home_page
      #
      def be_on_the(page_url)
        BeOnThe.neW(page)
      end

      # Test that block does not change or reload the page
      #
      #     expect {
      #       click_link 'AJAX action'
      #     }.to stay_on_the_same page
      #
      def stay_on_the_same(page)
        StayOnTheSame.new(page)
      end
      
      # Test for content
      #
      #     # plain
      #     we.should see 'some text'
      #
      #     # with a container
      #     we.should see 'title', :in => 'h1'
      #
      #     # with a page url
      #     we.should see 'my site', :on => home_page
      #
      def see(text, options={})
        See.new(text, options)
      end

      # Test for an image present
      #
      # If the URL is relative, it's assumed relative to /images.
      #
      # See #see for a list of options
      #
      #     we.should see_image 'new.png'
      #
      #     we.should see_image @bob.avatar_url
      #
      def see_image(url, options={})
        SeeImage.new(url, options)
      end
    end
  end
end
