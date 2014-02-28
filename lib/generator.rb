#encoding: utf-8

require 'pry'

require './lib/presenter'

class Generator

  def generate(works)
    generate_makes(works)
    generate_index(works)
  end

  private

  def generate_index(works)
    navigation_items = [
      { url: 'MAKE URL PAGE HERE', name: 'NIKON' },
      { url: 'MAKE URL PAGE HERE', name: 'CANON' },
    ]
    thumbnail_urls = [
      'url1',
      'url2',
    ]

    view = Presenter.new
    view.navigation_items = navigation_items
    view.thumbnail_urls = thumbnail_urls
    view.render
  end

  def generate_makes(works)
    navigation_items = [
      { url: 'MAKE URL PAGE HERE', name: 'd80' },
      { url: 'MAKE URL PAGE HERE', name: '60d' },
    ]
    thumbnail_urls = [
      'url1',
      'url2',
    ]

    view = Presenter.new
    view.navigation_items = navigation_items
    view.thumbnail_urls = thumbnail_urls
    view.render
  end

end
