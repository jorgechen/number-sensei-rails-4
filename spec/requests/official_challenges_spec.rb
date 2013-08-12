require 'spec_helper'

describe "OfficialChallenges" do
  describe "GET /official_challenges" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get official_challenges_path
      response.status.should be(200)
    end
  end
end
