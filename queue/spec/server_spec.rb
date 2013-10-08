require './app/server.rb'


# TODO: I don't like that I'm actually opening up real network connections
# for this test. Need to find a better way to mock out the TCPServer object
# in Server. Going to be especially needed when I start testing theLoop

describe "When you create a server object" do

  before do
    @server = Server.new("localhost", 2345)
  end

  after do
    @server.close
  end

  it "should be record the address" do
    @server.address.should eq("localhost")
  end

  it "should record the port" do
    @server.port.should eq(2345)
  end
end

describe "When the server start method is called" do
  it "should wait for a socket to be opened"
end

describe "When a request is sent to the server" do
  it "should read in a request"
  it "should return 'hello world' as a message"
  it "should return http 200"
  it "should return return content of text/plain"
  it "should return a content length of 12"
  it "should respond with connection close"
  it "should close the underlying socket"
end
 
