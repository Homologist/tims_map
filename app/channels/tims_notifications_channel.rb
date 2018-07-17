# frozen_string_literal: true

# Channel who is in charge of broadcasting disruptions
class TimsNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'tims_notifications_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    @disruptions = Tims.new.disruptions
    @hash_list = Gmaps4rails.build_markers(@disruptions) do |disruption, marker|
      marker.lat disruption.latitude
      marker.lng disruption.longitude
    end
    @hash_list.each do |disruption|
      ActionCable.server.broadcast 'tims_notifications_channel', message: disruption
      sleep(0.1)
    end
  end
end
