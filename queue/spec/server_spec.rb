require './app/server.rb'


# TODO: I don't like that I'm actually opening up real network connections
# for this test. Need to find a better way to mock out the TCPServer object
# in Server. Going to be especially needed when I start testing theLoop

describe "When you call close on a Server object" do
  it "should close the TCPServer passed into it during creation" do
    mock_tcpserver = double("tcpserver")
    mock_tcpserver.should_receive(:close)
    server = Server.new(mock_tcpserver)
    server.close
  end
end

describe "When the server start method is called" do

  before do
    @tcpserver = double("tcpserver")
    @server = Server.new(@tcpserver)
  end

  it "should wait for a socket to be opened" do
    # Throw an exception to short circuit out of the loop
    # accept is a blocking call but don't want to go further
    @tcpserver.should_receive(:accept).and_raise("BOOM!")
    begin
      @server.start
    rescue => e
      e.message.should eq("BOOM!") #Just checking to be pedantic about it
    end
  end
end


describe "When a request is sent to the server" do
  before do
    @tcpserver = TCPServer.new("localhost", 2345)
    @server = Server.new(@tcpserver)
  end

  after do
    @server.close
  end

  it "should read in a request"
  it "should return 'hello world' as a message"
  it "should return http 200"
  it "should return return content of text/plain"
  it "should return a content length of 12"
  it "should respond with connection close"
  it "should close the underlying socket"
end
 
