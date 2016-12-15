class Api::V1::PagesController < ApplicationController
  rescue_from ActionController::ParameterMissing, with: :error_params_missing

  def index
    pages = Page.all
    render json: pages
  end

  def create
    url = page_params[:url]
    if url =~ URI::regexp
      wrapper = Wrapper.new(url)
      page = Page.new(title: page_params[:title], url: url,
                         h1: wrapper.get_h1_tags, h2: wrapper.get_h2_tags,
                         h3: wrapper.get_h1_tags)
      if page.save
        render json: page, status: :created
      else
        render_error(page.errors)
      end
    else
      render_error("Invalid url")
    end
  end

  private

  def render_error(error)
    render json: { "error": error }, status: :bad_request
  end

  def page_params
    params.require(:page).permit(:title, :url)
  end

  def error_params_missing
    render json: { "error": "Params missing" }, status: :bad_request
  end
end
