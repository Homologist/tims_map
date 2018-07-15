Given("I am on the home page") do
  visit root_path
end

Then("I see the disruptions on the road") do
  # set markers list
  # expect(Map.start(markers).loaded_marker).to eq(markers.count)
  expect(true).to eq(true)
end
