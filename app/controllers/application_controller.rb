class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def art
    page = "https://www.electricobjects.com/artists/pdschatz/artworks/Qb6N"
    require 'nokogiri'
    require 'open-uri'
    html = Nokogiri.HTML(open(page))
    image  = html.at('.artwork-detail_image')["poster"]
    @image = image
  end
  
end
