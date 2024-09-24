require "../controller.cr"
require "../../layout/inbuilt/identity_layout"

# this controller reads a file and returns it without
# any modification
# it can be useful for serving static files such as
# images, css, js, etc.
class StaticController < Controller
  @file_path : String

  def initialize(@file_path : String)
    super(IdentityLayout.new)
  end

  def get(ctx) : String
    return File.read(@file_path)
  end

  def post(ctx) : String
    return ""
  end

  def put(ctx) : String
    return ""
  end

  def patch(ctx) : String
    return ""
  end

  def delete(ctx) : String
    return ""
  end
end
