# This object encapsulates the request format for the queue which is
# in JSON. The route is expected to be a string. The payload is expected
# to be a hash.
# 
# {
#   "route" : "some_route_name"
#   "payload" : { an arbitrary JSON object the requested handler knows how to deal with }
# }
# 
# 

require 'json'


class QueueRequest

  attr_accessor :route, :payload

  def initialize(route, payload)
    raise "Not a string" unless route.is_a? String
    raise "Not a hash" unless payload.is_a? Hash

    @route = route #expecting route to be a string
    @payload = payload #expecting payload to be a hash
  end

  def to_json
    hash = { "route" => @route, "payload" => @payload }
    hash.to_json
  end

  def self.from_json(json_str)
    jobj = JSON.parse(json_str)
    QueueRequest.new(jobj["route"], jobj["payload"])
  end
end