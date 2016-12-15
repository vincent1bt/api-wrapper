require 'rails_helper'

RSpec.describe Page, type: :model do
  it "is valid with valid attributes" do
    page = build(:page)
    expect(page).to be_valid
  end

  it "is invalid without a title" do
    page = Page.new(title: nil)
    expect(page).to_not be_valid
  end

  it "is invalid without a url" do
    page = Page.new(url: nil)
    expect(page).to_not be_valid
  end
end
