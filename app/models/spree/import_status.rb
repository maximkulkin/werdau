class Spree::ImportStatus < ActiveRecord::Base

  attr_accessible :count_all, :count_process, :active, :error_messages

  scope :active, lambda { where('active = ?', true) }

  def add_error_message(error)
    errors = JSON.load(self.error_messages) || []
    errors << error

    self.error_messages = errors.to_json
  end

end
