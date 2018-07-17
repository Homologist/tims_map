# Service who call TIMS API
# frozen_string_literal: true

class Tims

  def get_disruptions
    download_and_filter_disruption.map{ |disruption| Disruption.new(*disruption["CauseArea"]["DisplayPoint"]["Point"]["coordinatesLL"].split(",").map(&:to_f)) }
  end

  def download_and_filter
    download_and_filter_disruption
  end

  private

  def download_xml
    HTTParty.get('https://data.tfl.gov.uk/tfl/syndication/feeds/tims_feed.xml?app_id=&app_key=').parsed_response
  end

  def download_and_filter_disruption
    download_xml["Root"]["Disruptions"]["Disruption"]
  end

end
