Given("I am on the home page") do
  @lat  = 51.509865
  @lng  = -0.118092
  @lat1 = 51.509865
  @lng1 = -0.118092

  @list = [Disruption.new(@lat, @lng), Disruption.new(@lat1, @lng1)]
  Tims.any_instance.stub(:get_disruptions).and_return(@list)
  visit root_path
end

Then("I see the disruptions on the road") do
  marker_list     = page.evaluate_script("marker_list")
  ACCEPTED_OFFSET = 0.2
  expect(page).to have_css '#map .gm-style'
  center_lat = page.evaluate_script('handler.getMap().getCenter().lat()')
  expect(center_lat).to be_within(ACCEPTED_OFFSET).of(@lat.to_f)

  page.evaluate_script("window.location.reload()")
  center_lng = page.evaluate_script('handler.getMap().getCenter().lng()')
  expect(center_lng).to be_within(ACCEPTED_OFFSET).of(@lng.to_f)

  page.evaluate_script("window.location.reload()")
  expect(@list.count).to eq(marker_list.count)
end
