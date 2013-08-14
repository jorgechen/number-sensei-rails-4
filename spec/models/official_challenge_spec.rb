require 'spec_helper'

describe OfficialChallenge do
  before do
    @official_challenge = FactoryGirl.create(:official_challenge)
  end

  subject { @official_challenge }

  it { should respond_to(:upload) }
  it { should respond_to(:name) }
  it { should respond_to(:release_date) }
  it { should respond_to(:grade_level) }
  it { should respond_to(:difficulty) }
  it { should respond_to(:event) }
  it { should respond_to(:category) }
  it { should respond_to(:location) }

  it { should be_valid }

  describe 'when name is not present' do
    before { @official_challenge.name = ' ' }
    it { should_not be_valid }
  end
end
