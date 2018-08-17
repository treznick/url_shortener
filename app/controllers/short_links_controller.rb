class ShortLinksController < ApplicationController
  before_action :build_short_link, only: [:index]
  before_action :load_short_links, only: [:index, :create]
  before_action :find_short_link, only: [:show]

  def index
  end

  def create
    @short_link = ShortLink.new(short_link_params)

    if @short_link.save
      flash[:success]
      redirect_to action: :index
    else
      flash[:errors]
      render :index
    end
  end

  def show
    if @short_link
      redirect_to @short_link.url
    else
      redirect_to action: :index
    end
  end

  private

  def find_short_link
    @short_link = ShortLink.find_by(friendly_id: params[:friendly_id])
  end

  def build_short_link
    @short_link = ShortLink.new
  end

  def load_short_links
    @short_links = ShortLink.all.order(:created_at)
  end

  def short_link_params
    params.
      require(:short_link).
      permit(:url)
  end
end
