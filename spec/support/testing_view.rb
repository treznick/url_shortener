class TestingView
  include ActionView::Helpers::UrlHelper
  include Rails.application.routes.url_helpers

  private

  def controller
    # This has to be here to let the Route url_helpers work.
    # It's only because ActionView will want to know if
    # `#controller.respond_to?(:optimize_routes_generation?)`.
    nil
  end
end
