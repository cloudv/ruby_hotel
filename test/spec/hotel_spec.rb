require '../src/hotel'

describe Hotel do
  before do
    @hotel_lakewood = Hotel.new("Lakewood",3)
    @order1 = Order.new("Regular",["mon", "tues", "wed"])
    @order2 = Order.new("Rewards",["thur", "fri", "sat"])
  end
  describe "generateTotalPrice" do
    it 'shoudl return "330" when name is Lakewood and customerType "Regular" days["mon","tues","wed"]' do
      @hotel_lakewood.generateTotalPrice(@order1).should eq 330
    end

    it 'should return "240" when @input3 for "Lakewood"' do
      @hotel_lakewood.generateTotalPrice(@order2).should eq 240
    end
  end
end
