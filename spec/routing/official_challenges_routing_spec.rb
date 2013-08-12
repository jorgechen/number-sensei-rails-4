require "spec_helper"

describe OfficialChallengesController do
  describe "routing" do

    it "routes to #index" do
      get("/official_challenges").should route_to("official_challenges#index")
    end

    it "routes to #new" do
      get("/official_challenges/new").should route_to("official_challenges#new")
    end

    it "routes to #show" do
      get("/official_challenges/1").should route_to("official_challenges#show", :id => "1")
    end

    it "routes to #edit" do
      get("/official_challenges/1/edit").should route_to("official_challenges#edit", :id => "1")
    end

    it "routes to #create" do
      post("/official_challenges").should route_to("official_challenges#create")
    end

    it "routes to #update" do
      put("/official_challenges/1").should route_to("official_challenges#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/official_challenges/1").should route_to("official_challenges#destroy", :id => "1")
    end

  end
end
