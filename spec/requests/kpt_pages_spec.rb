# encoding: utf-8
require 'rails_helper'

describe "Kpt Pages" do

  subject { page }

  describe "Index page" do
    # !をつけなければLazy Loadによりエラー
    let!(:kpt) { FactoryGirl.create(:kpt) }
    before { visit kpts_path }

    it { should have_content('ふりかえり一覧') }
    it { should have_link('新規作成', href: new_kpt_path) }
    it { should have_link('編集', href: edit_kpt_path(kpt)) }
    it { should have_link('削除', href: kpt_path(kpt)) }
    it { should have_link("#{simple_time(kpt.created_at)}", href: kpt_path(kpt)) }

    describe "pagination" do
      before(:all) { 30.times {FactoryGirl.create(:kpt) } }
      after(:all) { Kpt.delete_all }

      it { should have_selector('div.pagination') }
      it "should list each user" do
        Kpt.paginate(page: 1).each do |kpt|
          expect(page).to have_selector('li', text: simple_time(kpt.created_at))
        end
      end
    end

    describe "when a delete link is clicked" do
      it "should delete a user" do
        expect do
          click_link('削除', match: :first)
        end.to change(Kpt, :count).by(-1)
      end

      it { should have_content('ふりかえり一覧')}
    end
  end

  describe "Show page" do
    let(:kpt) { FactoryGirl.create(:kpt) }
    before { visit kpt_path(kpt) }

    it { should have_content("#{simple_time(kpt.created_at)}のふりかえり") }
    it { should have_content('Keep') }
    it { should have_content('Problem') }
    it { should have_content('Try') }
  end

  describe "New page" do
    before { visit new_kpt_path }

    let(:submit) { "Create Kpt" }

    it { should have_content('新規作成')}
    it { should have_content('Keep') }
    it { should have_content('Problem') }
    it { should have_content('Try') }

    describe "with invalid information" do
      it "should not create a kpt" do
        expect{ click_button submit }.not_to change(Kpt, :count)
      end

      describe "submit blank kpt" do
        before { click_button submit }
        it { should have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      before do
        fill_in "kpt_keep",     with: "kpt_pages_spec_keep"
        fill_in "kpt_problem",  with: "Problem"
        fill_in "kpt_try",      with: "Try"
      end

      it "should create a kpt" do
        expect{ click_button submit }.to change(Kpt, :count).by(1)
      end

      describe "after saving the kpt" do
        before { click_button submit }
        let(:kpt) { Kpt.find_by(keep: 'kpt_pages_spec_keep') }

        it { should have_link("#{simple_time(kpt.created_at)}", href: kpt_path(kpt)) }
        it { should have_selector('div.alert.alert-success', text: 'created') }
      end
    end
  end

  describe "Edit page" do
    let(:kpt) { FactoryGirl.create(:kpt) }
    before { visit edit_kpt_path(kpt) }

    it { should have_content("編集") }

    describe "with valid information" do
      let(:new_keep) { "Updated Keep" }
      let(:new_problem) { "Updated Problem" }
      let(:new_try) { "Updated Try" }
      before do
        fill_in "kpt_keep",     with: new_keep
        fill_in "kpt_problem",  with: new_problem
        fill_in "kpt_try",      with: new_try
        click_button "Update Kpt"
      end

      it { should have_selector('div.alert.alert-success', text: 'updated') }
      specify { expect(kpt.reload.keep).to eq new_keep }
      specify { expect(kpt.reload.problem).to eq new_problem }
      specify { expect(kpt.reload.try).to eq new_try }
    end
  end
end
