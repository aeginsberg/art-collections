class ArtController < ApplicationController

	require 'nokogiri'
	require 'open-uri'

	require "google_drive"

	session = GoogleDrive::Session.from_config("config.json")

	ws = session.spreadsheet_by_key("1cdbNpXWKIGQ1of2zmy6WkuH1Tu1G9KvAHrpZ-vVGd0U").worksheets[0]

	p ws[2, 1]

	def index
		list = [
		"https://www.electricobjects.com/artists/pdschatz/artworks/Qb6N",
		"https://www.electricobjects.com/artists/pdschatz/artworks/5BKJ",
		]

		image_list = {}
		list.each do |url|
			page = url
			html = Nokogiri.HTML(open(page))
			image  = html.at('.artwork-detail_image')["poster"]
			title = html.at_css('title').text
			image_list[title] = image
		end
		@image_list = image_list

	end
	
end
