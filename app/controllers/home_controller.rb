# frozen_string_literal: true

# main page controller
class HomeController < ApplicationController
  def index
    @users = [Disruption.new(51.309865, -0.128092), Disruption.new(51.609865, -0.108092)]
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end
end
