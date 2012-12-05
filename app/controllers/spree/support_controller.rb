module Spree
  class CallbackRequest
    include ActiveModel::Validations
    include ActiveModel::Conversion
    include ActiveModel::Translation
    extend ActiveModel::Naming

    attr_accessor :name, :phone, :info

    validates_presence_of :name
    validates_presence_of :phone

    def initialize(attributes = {})
      attributes.each { |name, value| send("#{name}=", value) }
    end

    def persisted?
      false
    end
  end

  class SupportController < Spree::BaseController

    layout false

    def callback
      @callback = CallbackRequest.new
    end
    
    def request_callback
      @callback = CallbackRequest.new(params[:callback])
      if @callback.valid?
        Spree::AdminMailer.callback_notification(@callback).deliver
      end

      respond_to do |format|
        format.js
      end
    end
  end
end
