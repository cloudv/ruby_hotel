require '../../src/lib/hotel_contailer'
describe HotelContainer do
  before do
    @HotelContainer = HotelContainer.new
    @input1 = 'Regular: 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)'
    @input2 = "Regular: 20Mar2009(fri), 21Mar2009(sat), 22Mar2009(sun)"
    @input3 = "Rewards: 26Mar2009(thur), 27Mar2009(fri), 28Mar2009(sat)"
    @days = ["mon", "tues", "wed"]
  end

  describe "getOrders" do
    it 'should return customerType "Regular" and orders "mon,tues,wed" when input "Regular: 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)"' do
      order = @HotelContainer.generateOrder(@input1)
      order.customerType.should eq "Regular"
      order.days.should eq ['mon', 'tues', 'wed']
    end
  end



  describe "getResult" do

    it 'should return "Lakewood" when input "Regular: 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)"' do
      @HotelContainer.getResult(@input1).should eq "Lakewood"
    end

    it 'should return "Bridgewood" when input "Regular: 20Mar2009(fri),21Mar2009(sat),22Mar2009(sun)"' do
      @HotelContainer.getResult(@input2).should eq "Bridgewood"
    end

    it 'should return "Ridgewood" when input "Rewards: 26Mar2009(thur),27Mar2009(fn),28Mar2009(sat):' do
      @HotelContainer.getResult(@input3).should eq "Ridgewood"
    end
  end

end
