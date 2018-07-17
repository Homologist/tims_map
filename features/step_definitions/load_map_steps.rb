Given("I am on the home page") do
  @center_lat  = 51.509865
  @center_lng  = -0.118092
  @lat  = 50.509865
  @lng  = -1.118092

  @list = [Disruption.new(@lng, @lat)]
  Tims.any_instance.stub(:disruptions).and_return(@list)
  visit root_path
end

Then("I see the disruptions on the road") do
  ACCEPTED_OFFSET = 0.2
  expect(page).to have_css '#map .gm-style'
  sleep(0.2)

  center_lat = page.evaluate_script('map.getCenter().lat()')
  expect(center_lat).to be_within(ACCEPTED_OFFSET).of(@center_lat.to_f)

  center_lng = page.evaluate_script('map.getCenter().lng()')
  expect(center_lng).to be_within(ACCEPTED_OFFSET).of(@center_lng.to_f)

  hash = page.evaluate_script('hash')
  expect(hash['lng']).to be_within(ACCEPTED_OFFSET).of(@lng)
  expect(hash['lat']).to be_within(ACCEPTED_OFFSET).of(@lat)
end
