module BehavingRodent
  module Helpers
    def click_and_confirm(link)
      confirming do
        click_link link
      end
    end
    
    def click_and_cancel(link)
      cancelling do
        click_link link
      end
    end

    def confirming(&block)
      stub_javascript_confirm_and_alert(true)
      block.call
      unstub_javascript_confirm_and_alert
    end

    def cancelling(&block)
      stub_javascript_confirm_and_alert(false)
      block.call
      unstub_javascript_confirm_and_alert
    end

    def stub_javascript_confirm_and_alert(confirm_return_value)
      if page.driver.class.public_instance_methods(false).include? 'execute_script'
        page.execute_script "window.confirm_pre_rspec=window.confirm;"+
          "window.alert_pre_rspec=window.alert;"+
          "window.confirm = function() { return '#{return_value.to_s}'; };"+
          "window.alert = function() { return true; }"
      end
    end
    def unstub_javascript_confirm_and_alert
      if page.driver.class.public_instance_methods(false).include? 'execute_script'
        page.execute_script "if (typeof(window.confirm_pre_rspec)!=\"undefined\") {"+
          "window.confirm = window.confirm_pre_rspec;"+
          "window.alert = window.alert_pre_rspec;"+
          "}"
      end
    end
  end
end
