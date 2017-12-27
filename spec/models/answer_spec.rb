require 'rails_helper'

RSpec.describe Answer, type: :model do
    let(:question) { Question.create!(title: "What may be up?", body: "Who knows?", resolved: false) }
    let(:answer) { Answer.create!(body: "You know, same old.", question: question) }
    
    describe "attributes" do
        it "has a body attribute" do
            expect(answer).to have_attributes(body: "You know, same old.")
        end
    end
end
