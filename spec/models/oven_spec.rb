require 'rails_helper'

describe Oven do
  subject { Oven.new }

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_one(:cookie) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:user) }
  end

  describe "when cook the cookie" do
    it "Change the status of the cookie to finished" do
      oven = FactoryGirl.build(:oven)
      cookie = FactoryGirl.create(:cookie, storage: oven)
      cookie.storage.cook
      cookie.reload
      expect(cookie.status).to eq("finished")
    end
  end

end
