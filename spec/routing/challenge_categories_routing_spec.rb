require "spec_helper"

describe ChallengeCategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/challenge_categories").should route_to("challenge_categories#index")
    end

    it "routes to #new" do
      get("/challenge_categories/new").should route_to("challenge_categories#new")
    end

    it "routes to #show" do
      get("/challenge_categories/1").should route_to("challenge_categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/challenge_categories/1/edit").should route_to("challenge_categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/challenge_categories").should route_to("challenge_categories#create")
    end

    it "routes to #update" do
      put("/challenge_categories/1").should route_to("challenge_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/challenge_categories/1").should route_to("challenge_categories#destroy", :id => "1")
    end

  end
end
