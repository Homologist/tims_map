class TimsNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "tims_notifications_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    @disruptions = Tims.new.get_disruptions
    @hash = Gmaps4rails.build_markers(@disruptions) do |disruption, marker|
      marker.lat disruption.latitude
      marker.lng disruption.longitude
    end
    @hash[0..2].each do |a|
      ActionCable.server.broadcast "tims_notifications_channel", message: a
      sleep(0.1)
    end
  end
end
