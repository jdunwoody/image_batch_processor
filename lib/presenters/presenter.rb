require 'mustache'

module Presenters
  class Presenter < Mustache

    self.template_file = './lib/presenters/template.mustache'

    attr_accessor :navigation_items, :thumbnail_urls, :title

    def navigation
      navigation_items.map do |nav|
        {
          url: URI.escape(nav[:url]),
          name: nav[:name],
        }
      end
    end

  end
end
