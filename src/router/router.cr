require "../controller/controller"

class Router
  @routes : Hash(String, Controller)

  def initialize(@routes : Hash(String, Controller) = Hash(String, Controller).new)
  end
end
