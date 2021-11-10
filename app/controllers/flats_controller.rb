require "open-uri"

class FlatsController < ApplicationController
  ENDPOINT = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"

  before_action :set_flats, only: [:show, :index]

  def index
  end

  def show
    flat_id = params[:id].to_i
    @flat = @flats.find { |flat| flat["id"] == flat_id }
  end

  private

  def set_flats
    @flats = JSON.parse(open(ENDPOINT).read)
  end

end
