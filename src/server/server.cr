require "http/server"
require "../router/router"
require "../controller/controller"

class DiamondServer
  @port : Int32
  @server : HTTP::Server
  @router : Router
  @routes : Hash(String, Controller)

  def initialize(@router : Router, @port : Int32 = 3000)
    @routes = @router.@routes

    server = HTTP::Server.new do |context|
      context.response.content_type = "text/html"

      activated_route = context.request.path
      virtual_route = activated_route
      virtual_route = 404 if !routes.has_key?(activated_route)
      puts "#{activated_route} -> #{virtual_route}"

      page_controller = routes[virtual_route]

      if context.request.method == "GET"
        context.response.print page_controller.get(context)
      elsif context.request.method == "POST"
        context.response.print page_controller.post(context)
      elsif context.request.method == "PUT"
        context.response.print page_controller.put(context)
      elsif context.request.method == "PATCH"
        context.response.print page_controller.patch(context)
      elsif context.request.method == "DELETE"
        context.response.print page_controller.delete(context)
      end
    end
  end

  def start
    address = @server.bind_tcp port
    puts "Website Started at http://#{address}/"

    @server.listen
  end
end
