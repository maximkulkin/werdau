# encoding: utf-8

Spree::Order.class_eval do
  # Cancel custom #name method, fallback to attribute
  def name
    attributes['name']
  end

  attr_accessible :name, :phone

  validates :name, :phone, :presence => true,
    :if => lambda { |r| r.state == 'contacts' }

  checkout_flow do
    go_to_state :contacts
    go_to_state :complete
  end

  state_machine.before_transition :to => :complete, :do => :init_shipping_and_payment
  state_machine.after_transition  :to => :complete, :do => :finalize!


  def payment?
    false
  end

  def shipment_state
    super || 'not_started'
  end

  def deliver_order_confirmation_email_with_admin_notification
    deliver_order_confirmation_email_without_admin_notification

    begin
      Spree::AdminMailer.order_notification(self).deliver
    rescue Exception => e
      logger.error "#{e.class.name}: #{e.message}"
      logger.error e.backtrace * "\n"
    end
  end
  
  alias_method_chain :deliver_order_confirmation_email, :admin_notification

  private

  def init_shipping_and_payment
    self.shipping_method ||= Spree::ShippingMethod.find_by_name('Курьерская доставка')
    payments.build(
      :payment_method => Spree::PaymentMethod.find_by_name('Наложенный платеж'),
      :state => 'pending'
    ) if payments.empty?
  end
end
