# encoding: utf-8
require 'rails_helper'

describe "Kpt Pages" do

  subject { page }

  describe "Index page" do
    # !をつけなければLazy Loadによりエラー
    let!(:kpt) { FactoryGirl.create(:kpt) }
    before { visit root_path }

    it { should have_content('ふりかえり一覧') }
    it { should have_link('新規作成', href: new_kpt_path) }
    it { should have_link("#{kpt.created_at}", href: kpt_path(kpt)) }
  end

  describe "Show page" do
    let(:kpt) { FactoryGirl.create(:kpt) }
    before { visit kpt_path(kpt) }

    it { should have_content("#{kpt.created_at}のふりかえり") }
    it { should have_content('Keep') }
    it { should have_content('Problem') }
    it { should have_content('Try') }
  end

  describe "New page" do
    before { visit new_kpt_path }

    it { should have_content('ふりかえり新規作成')}
    it { should have_content('Keep') }
    it { should have_content('Problem') }
    it { should have_content('Try') }
  end
end
