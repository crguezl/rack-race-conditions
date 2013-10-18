require 'pp'

class Persistence

  def call(env)
    
    res = Rack::Response.new
    req = Rack::Request.new env

    @some_key ||= 0
    @some_key = @some_key + 1 if req.path == '/'

    res.write("@some_key = #{@some_key}\n")

    res.finish
  end

end

run Persistence.new

