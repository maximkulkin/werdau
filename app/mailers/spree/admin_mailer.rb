module Spree
  class AdminMailer < ActionMailer::Base
    helper 'spree/base'

    def order_notification(order)
      @order = order

      subject = "#{Spree::Config[:site_name]} #{t('admin_mailer.order_notification.subject')}"

      mail(:to => Spree::Config[:admin_email], :subject => subject)
    end
  end
end
