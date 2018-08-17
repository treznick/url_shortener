class ShortLink < ApplicationRecord
  before_save :generate_friendly_id, on: :create

  private

  def generate_friendly_id
    self.friendly_id = SecureRandom.hex(4)
  end
end
