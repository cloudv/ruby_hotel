require '../src/hotel'

describe Hotel do
  before do
    @hotel = Hotel.new
    @input1 = 'Regular: 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)'
    @input2 = "Regular: 20Mar2009(fri), 21Mar2009(sat), 22Mar2009(sun)"
    @input3 = "Rewards: 26Mar2009(thur), 27Mar2009(fri), 28Mar2009(sat)"
    @days = ["mon", "tues", "wed"]
  end

  describe "getOrders" do
    it 'should return customerType "Regular" and orders "mon,tues,wed" when input "Regular: 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)"' do
      orders = @hotel.getOrders(@input1)
      orders[:customerType].should eq "Regular"
      orders[:days].should eq ['mon', 'tues', 'wed']
    end
  end

  describe "generateTotalPrice" do
    it 'shoudl return "330" when name is Lakewood and customerType "Regular" days["mon","tues","wed"]' do
      @hotel.generateTotalPrice("Lakewood", "Regular", ["mon", "tues", "wed"]).should eq 330
    end

    it 'should return "240" when @input3 for "Lakewood"' do
      @hotel.generateTotalPrice("Lakewood","Rewards",["thur","fri","sat"]).should eq 240
    end
  end

  describe "getResult" do

    it 'should return "Lakewood" when input "Regular: 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)"' do
      @hotel = Hotel.new
      @hotel.getResult(@input1).should eq "Lakewood"
    end

    it 'should return "Bridgewood" when input "Regular: 20Mar2009(fri),21Mar2009(sat),22Mar2009(sun)"' do
      @hotel = Hotel.new
      @hotel.getResult(@input2).should eq "Bridgewood"
    end

    it 'should return "Ridgewood" when input "Rewards: 26Mar2009(thur),27Mar2009(fn),28Mar2009(sat):' do
      @hotel = Hotel.new
      @hotel.getResult(@input3).should eq "Ridgewood"
    end
  end

end
