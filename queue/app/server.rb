require 'socket'



class Server
  
  attr_accessor :tcpserver

  def initialize(tcp)
    @tcpserver = tcp
  end

  def close()
    @tcpserver.close
  end


  def start()
    theLoop
  end

  def stop()
    #TBD. ctrl + c is the kill switch for now
  end

  def theLoop()
    # loop infinitely, processing one incoming
    # connection at a time.
    loop do

      # Wait until a client connects, then return a TCPSocket
      # that can be used in a similar fashion to other Ruby
      # I/O objects. (In fact, TCPSocket is a subclass of IO.)
      socket = tcpserver.accept

      # Read the first line of the request (the Request-Line)
      request = socket.gets

      # Log the request to the console for debugging
      STDERR.puts request

      response = "Hello World!\n"

      # We need to include the Content-Type and Content-Length headers
      # to let the client know the size and type of data
      # contained in the response. Note that HTTP is whitespace
      # sensitive, and expects each header line to end with CRLF (i.e. "\r\n")
      socket.print "HTTP/1.1 200 OK\r\n" +
                   "Content-Type: text/plain\r\n" +
                   "Content-Length: #{response.bytesize}\r\n" +
                   "Connection: close\r\n"

      # Print a blank line to separate the header from the response body,
      # as required by the protocol.
      socket.print "\r\n"

      # Print the actual response body, which is just "Hello World!\n"
      socket.print response

      # Close the socket, terminating the connection
      socket.close
    end  	
  end
end
