# this is a layout that does not change the input
class IdentityLayout < Layout
  def render(view : String) : String
    return view
  end
end
