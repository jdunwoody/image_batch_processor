#encoding: utf-8

require 'pry'

require './lib/index_presenter'

class Generator

  def generate
    navigation_makes = [
      { url: 'MAKE URL PAGE HERE', make: 'NIKON' },
      { url: 'MAKE URL PAGE HERE', make: 'CANON' },
    ]
    view = IndexPresenter.new
    view.navigation_makes = navigation_makes
    view.render
  end

  #def generate_makes(makes)
  #makes.each do |make|
  #end
  #end

  # encode input
  #def generate(makes, models, works)
  #works.each do |work|
  #end
  #end

end
