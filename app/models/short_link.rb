class ShortLink < ApplicationRecord
  before_save :generate_friendly_id, on: :create
  validate :uri_rfc2396_compliant, :uri_host_present

  private

  def generate_friendly_id
    self.friendly_id = SecureRandom.hex(4)
  end

  def uri_rfc2396_compliant
    URI.parse(url)
  rescue URI::InvalidURIError
    errors.add(:url, :not_rfc2396_compliant)
  end

  def uri_host_present
    if URI.parse(url).host.blank?
      errors.add(:url, :blank_host)
    end
  rescue URI::InvalidURIError
  end
end
