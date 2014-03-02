require './lib/render/url_helper'

module Render
  describe UrlHelper do
    describe '.camera_make_url' do
      it 'transforms the name into just alphabet, numberic characters and dashes for spaces' do
        expect(UrlHelper.camera_make_url('aBc #$% .?/[];\:\"')).to eq('camera-make-aBc.html')
      end
    end
  end
end
