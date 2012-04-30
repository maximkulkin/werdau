# encoding: utf-8

Spree::Order.class_eval do
  # Cancel custom #name method, fallback to attribute
  def name
    attributes['name']
  end

  attr_accessible :name, :phone

  validates :name, :phone, :presence => true,
    :if => lambda { |r| r.state == 'contacts' }

  state_machines[:state] = StateMachine::Machine.new(Spree::Order, :initial => 'cart') do
    event :next do
      transition :from => 'cart', :to => 'contacts'
      transition :from => 'contacts', :to => 'complete'
    end

    before_transition :to => 'complete', :do => :init_shipping_and_payment
    after_transition  :to => 'complete', :do => :finalize!
  end


  def payment?
    false
  end

  def shipment_state
    super || 'not_started'
  end

  private

  def init_shipping_and_payment
    self.shipping_method ||= Spree::ShippingMethod.find_by_name('Курьерская доставка')
    payments.build(
      :payment_method => Spree::PaymentMethod.find_by_name('Наложенный платеж'),
      :state => 'pending'
    ) if payments.empty?
  end
end
