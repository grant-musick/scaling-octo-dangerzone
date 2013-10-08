require './app/server.rb'

describe "When you create a server object" do
  it "should be record the address" do
    server = Server.new("localhost", 2345)
    server.address.should eq("localhost")
  end

  it "should record the port" do
    server = Server.new("localhost", 2345)
    server.port.should eq(2345)
  end
end
