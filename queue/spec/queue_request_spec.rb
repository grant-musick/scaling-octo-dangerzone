require './app/queue_request'


describe QueueRequest do

  context "When a QueueRequest is created from JSON" do
    before do
      @req = QueueRequest.from_json('{ "route" : "route1", "payload" : { "test" : "key" } }')
    end
    
    it "should store the route" do
      @req.route.should eq("route1")
    end

    it "should store the payload" do
      @req.payload.should eq({ "test" => "key" })
    end
  end


  context "When it is turned into JSON" do
    before do
      @req = QueueRequest.new("route1", { "test" => "key" })
    end

    it "should set the route correctly" do
      json_str = @req.to_json
      jobj = JSON.parse(json_str)
      jobj["route"].should eq("route1")
    end

    it "should set the payload correctly" do
      json_str = @req.to_json
      jobj = JSON.parse(json_str)
      jobj["payload"].should eq({ "test" => "key" })
    end
  end


  context "When it is created via constructor" do
    before do
      @req = QueueRequest.new("route1", { "test" => "key" })
    end
    it "should set the route correctly" do
      @req.route.should eq("route1")
    end
    it "should set the payload correctly" do
      @req.payload.should eq({ "test" => "key" })
    end
  end
end


