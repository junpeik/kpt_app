# encoding: utf-8
require 'rails_helper'

describe "Static Pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('ふりかえり') }
  end
end
