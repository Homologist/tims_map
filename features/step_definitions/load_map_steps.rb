Given("I am on the home page") do
  visit root_path
end

Then("I see the disruptions on the road") do
  # set markers list
  # expect(Map.start(markers).loaded_marker).to eq(markers.count)
  lat = 51.509865
  lng = -0.118092
  ACCEPTED_OFFSET = 0.2
  expect(page).to have_css '#map .gm-style'
  center_lat = page.evaluate_script('handler.getMap().getCenter().lat()')
  expect(center_lat).to be_within(ACCEPTED_OFFSET).of(lat.to_f)

  page.evaluate_script("window.location.reload()")
  center_lng = page.evaluate_script('handler.getMap().getCenter().lng()')
  expect(center_lng).to be_within(ACCEPTED_OFFSET).of(lng.to_f)
end
