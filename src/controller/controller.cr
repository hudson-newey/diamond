require "../layout/layout"

abstract class Controller
  @layout : Layout

  def initialize(layout : Layout)
    @layout = layout
  end

  abstract def get(ctx) : String
  abstract def post(ctx) : String
  abstract def put(ctx) : String
  abstract def patch(ctx) : String
  abstract def delete(ctx) : String
end
