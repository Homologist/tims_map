Given("I am on the home page") do
  @lat  = 51.509865
  @lng  = -0.118092

  @list = [Disruption.new(@lat, @lng)]
  Tims.any_instance.stub(:get_disruptions).and_return(@list)
  visit root_path
end

Then("I see the disruptions on the road") do
  ACCEPTED_OFFSET = 0.2
  expect(page).to have_css '#map .gm-style'

  center_lat = page.evaluate_script('map.getCenter().lat()')
  expect(center_lat).to be_within(ACCEPTED_OFFSET).of(@lat.to_f)

  page.evaluate_script("window.location.reload()")
  center_lng = page.evaluate_script('map.getCenter().lng()')
  expect(center_lng).to be_within(ACCEPTED_OFFSET).of(@lng.to_f)
end
