class HomeController < ApplicationController
  def index
    render inertia: "Home/Index"
  end

  def about
    render inertia: "Home/About"
  end
end
