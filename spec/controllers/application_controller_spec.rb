require 'spec_helper'
require 'ostruct'

describe ApplicationController, :type => :controller do
  controller do

  end

  before(:each) do
    @mock_warden = OpenStruct.new
    @controller.request.env['warden'] = @mock_warden
  end

  it "should create an anonymous user for a guest" do
    allow(@mock_warden).to receive(:authenticate).with(anything).and_return(false)

    expect(@controller.current_or_guest_user.email).to match(/guest/)
  end

  it "should use the current user when available" do
    m = double()
    allow(@mock_warden).to receive(:authenticate).with(anything).and_return(m)

    expect(@controller.current_or_guest_user).to eq(m)
  end

end
