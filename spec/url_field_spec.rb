require 'spec_helper'

class TestModel < ActiveRecord::Base
  url_field :url, :other_url, :another_url
end

describe UrlField do
  before do
    @test_model = TestModel.new
  end

  it 'has a version number' do
    expect(UrlField::VERSION).not_to be nil
  end

  it "should leave well enough alone" do
    @test_model.save
    @test_model.url.should be_nil
  end

  it "should REALLY leave well enough alone" do
    @test_model.url = ""
    @test_model.save
    @test_model.url.should be_nil
  end

  it "should add http://" do
    @test_model.url = "www.example.com"
    @test_model.save
    @test_model.url.should == "http://www.example.com"
  end

  it "should ignore http://" do
    @test_model.url = "http://www.example.com"
    @test_model.save
    @test_model.url.should == "http://www.example.com"
  end

  it "should allow https://" do
    @test_model.url = "https://www.example.com"
    @test_model.save
    @test_model.url.should == "https://www.example.com"
  end

  it "should ignore https://" do
    @test_model.url = "https://www.example.com"
    @test_model.save
    @test_model.url.should == "https://www.example.com"
  end

  it "should ignore HTTP://" do
    @test_model.url = "HTTP://WWW.EXAMPLE.COM"
    @test_model.save
    @test_model.url.should == "HTTP://WWW.EXAMPLE.COM"
  end

  it "should ignore HTTPS://" do
    @test_model.url = "HTTPS://WWW.EXAMPLE.COM"
    @test_model.save
    @test_model.url.should == "HTTPS://WWW.EXAMPLE.COM"
  end

  it "should ignore mailto:" do
    @test_model.url = "mailto:contact@example.com"
    @test_model.save
    @test_model.url.should == "mailto:contact@example.com"
  end

  it "should ignore tel:" do
    @test_model.url = "tel:18475555555"
    @test_model.save
    @test_model.url.should == "tel:18475555555"
  end

  it "should expose the cleaned method" do
    @test_model.url = "www.example.com"
    @test_model.cleaned_url.should == "http://www.example.com"
  end

  it "should work for other_url" do
    @test_model.other_url = "www.example.com"
    @test_model.cleaned_other_url.should == "http://www.example.com"
    @test_model.save
    @test_model.other_url.should == "http://www.example.com"
  end

  it "should work for another_url" do
    @test_model.another_url = "www.example.com"
    @test_model.cleaned_another_url.should == "http://www.example.com"
    @test_model.save
    @test_model.another_url.should == "http://www.example.com"
  end
end
