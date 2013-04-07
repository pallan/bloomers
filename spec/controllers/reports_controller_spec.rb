require 'spec_helper'

describe ReportsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'product_count'" do
    it "returns http success" do
      get 'product_count'
      response.should be_success
    end
  end

end
