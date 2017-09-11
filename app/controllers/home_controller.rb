class HomeController < ApplicationController
  def show
    # Gets the html from the views: folder/page
    render template: "home/home"
  end
end
