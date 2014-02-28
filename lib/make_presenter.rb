require 'mustache'

class MakePresenter < Mustache

  self.template_file = 'lib/index.mustache'

  attr_accessor :navigation_items, :thumbnail_urls

  def title
    'index'
  end

  def navigation
    navigation_items.map do |nav|
      {
        url: nav[:url],
        name: nav[:name],
      }
    end
  end
end
