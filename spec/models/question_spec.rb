require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { Question.create!(title: "What might be up?", body: "Can somebody tell me?", resolved: false) }
  
  describe "attributes" do
      it "has a title, a body and a resolved status" do
          expect(question).to have_attributes(title: "What might be up?", body: "Can somebody tell me?", resolved: false)
      end
  end
end
