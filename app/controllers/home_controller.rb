# frozen_string_literal: true

# main page controller
class HomeController < ApplicationController
  def index
    @disruptions = Tims.new.get_disruptions
    @hash = Gmaps4rails.build_markers(@disruptions) do |disruption, marker|
      marker.lat disruption.latitude
      marker.lng disruption.longitude
    end
  end
end
