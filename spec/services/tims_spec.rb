# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tims do
  it 'get disruptions' do
    lat  = 10.0001
    lng  = -1.0001

    disruption_list = Fixture.disruption
    disruption_stub = double(parsed_response: disruption_list)

    allow(HTTParty).to receive(:get).with('https://data.tfl.gov.uk/tfl/syndication/feeds/tims_feed.xml?app_id=&app_key=').and_return(disruption_stub)

    expect(Tims.new.disruptions.count).to eq(1)
    expect(Tims.new.disruptions.first.latitude).to eq(lng)
    expect(Tims.new.disruptions.first.longitude).to eq(lat)
  end
end
