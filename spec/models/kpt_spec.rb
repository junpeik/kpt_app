require 'rails_helper'

describe Kpt do

  let(:kpt) { FactoryGirl.create(:kpt) }

  subject { kpt }

  it { should respond_to(:keep) }
  it { should respond_to(:problem) }
  it { should respond_to(:try) }

  it { should be_valid }

  describe "when keep is not present" do
    before { kpt.keep = " " }
    it { should_not be_valid }
  end

  describe "when problem is not present" do
    before { kpt.problem = " " }
    it { should_not be_valid }
  end

  describe "when try is not present" do
    before { kpt.try = " " }
    it { should_not be_valid }
  end

  describe "keep accepts more than 256 characters" do
    before { kpt.keep = "a" * 300 }
    it { should be_valid }
  end

  describe "problem accepts more than 256 characters" do
    before { kpt.problem = "a" * 300 }
    it { should be_valid }
  end

  describe "try accepts more than 256 characters" do
    before { kpt.try = "a" * 300 }
    it { should be_valid }
  end
end
