require 'spec_helper'

feature "Application" do
  it "loads the pages" do
    visit '/'
    expect(page).to have_content "SG Bus LoL"
  end
end
