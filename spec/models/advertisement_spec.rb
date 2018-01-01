require 'rails_helper'

RSpec.describe Advertisement, type: :model do
    let(:advertisement) { Advertisement.create!(title: "New Ad Title", copy: "New Ad Copy", price: "New Ad Price".to_i) }
    
    describe "attributes" do
        it "has title, copy and price attributes" do
            expect(advertisement).to have_attributes(title: "New Ad Title", copy: "New Ad Copy", price: "New Ad Price".to_i)
        end
    end
end
