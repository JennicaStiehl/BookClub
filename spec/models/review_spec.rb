require "rails_helper"

describe Review, type: :model do
  describe "Relationships" do
    it { should belong_to :books}
  end
end
