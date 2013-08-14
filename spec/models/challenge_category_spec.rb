require 'spec_helper'

describe ChallengeCategory do
  before do
    @challenge_category = FactoryGirl.create(:challenge_category)
  end

  subject { @challenge_category }

  it { should respond_to(:name) }
  it { should respond_to(:description) }

  it { should be_valid }

  describe 'when name is not present' do
    before { @challenge_category.name = ' ' }
    it { should_not be_valid }
  end
end
