require 'spec_helper'
require 'chamberevents/read'

module Chamberevents
  describe Read, :online => true do
    let(:cut) {Read}
    it {Read.current.should have_at_least(10).items}
  end
end
