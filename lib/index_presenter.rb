require 'mustache'

class IndexPresenter < Mustache

  self.template_file = 'lib/index.mustache'

  attr_accessor :navigation_makes

  def title
    'index'
  end

  def navigation
    navigation_makes.map do |nav|
      {
        url: nav[:url],
        make: nav[:make],
      }
    end
  end

  def thumbnails
    'thumb'
  end
end
