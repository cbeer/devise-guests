require 'spec_helper'
require 'ostruct'

describe ApplicationController do
  controller do

  end

  before(:each) do
    @mock_warden = OpenStruct.new
    @controller.request.env['warden'] = @mock_warden
  end

  it "should create an anonymous user for a guest" do
    @mock_warden.stub(:authenticate).with(anything).and_return(false)

    @controller.current_or_guest_user.email.should =~ /guest/
  end

  it "should use the current user when available" do
    m = double()
    @mock_warden.stub(:authenticate).with(anything).and_return(m)

    @controller.current_or_guest_user.should == m
  end

end
