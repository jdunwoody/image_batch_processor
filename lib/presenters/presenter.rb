require 'mustache'

module Presenters
  class Presenter < Mustache

    self.template_file = './lib/presenters/template.mustache'

    attr_accessor :navigation_items, :thumbnail_urls, :title

  end
end
