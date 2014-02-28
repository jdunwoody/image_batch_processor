require 'mustache'

class Presenter < Mustache

  self.template_file = 'lib/index.mustache'

  attr_accessor :navigation_items, :thumbnail_urls

  def title
    'index'
  end

  def navigation
    navigation_items.map do |nav|
      {
        url: URI.escape(nav[:url]),
        name: nav[:name],
      }
    end
  end


end
