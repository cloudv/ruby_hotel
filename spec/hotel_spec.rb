require '../src/hotel'

describe Hotel do
  #before do
  #  hotel = Hotel.new
  #end

  it 'should return "Lakewood" when input "Regular: 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)"' do
    hotel = Hotel.new
    hotel.getResult("Regular: 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)").should eq "Lakewood"
  end

  it 'should return "Bridgewood" when input "Regular: 20Mar2009(fri),21Mar2009(sat),22Mar2009(sun)"' do
    hotel = Hotel.new
    hotel.getResult("Regular: 20Mar2009(fri), 21Mar2009(sat), 22Mar2009(sun)").should eq "Bridgewood"
  end

  it 'should return "Ridgewood" when input "Rewards: 26Mar2009(thur),27Mar2009(fn),28Mar2009(sat):' do
    hotel = Hotel.new
    hotel.getResult("Rewards: 26Mar2009(thur), 27Mar2009(fri), 28Mar2009(sat)").should eq "Ridgewood"
  end

  it 'should put a' do
    hotel = Hotel.new
    #hotel.stub(:fake)
    hotel.stub(:afn).and_return("a")
    hotel.fake
  end

end
