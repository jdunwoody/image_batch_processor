require 'mustache'

module Render
  class Presenter < Mustache

    self.template_file = './lib/render/page.mustache'

    attr_accessor :navigation_items, :thumbnail_urls, :title

  end
end
