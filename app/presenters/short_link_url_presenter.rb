class ShortLinkUrlPresenter < SimpleDelegator
  class << self
    def default_url_options
    end
  end

  def initialize(obj, view)
    @view = view
    super(obj)
  end

  def shortened_url
    URI.join(root_url(url_options), friendly_id).to_s
  end

  delegate :root_url, to: :view

  private

  attr_reader :view

  def url_options
    Rails.application.config.action_controller.default_url_options.merge(only_path: false)
  end
end
