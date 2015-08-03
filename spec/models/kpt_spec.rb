require 'rails_helper'

describe Kpt do

  let(:kpt_content) { FactoryGirl.create(:kpt) }

  subject { kpt_content }

  it { should respond_to(:keep) }
  it { should respond_to(:problem) }
  it { should respond_to(:try) }

  it { should be_valid }
end
