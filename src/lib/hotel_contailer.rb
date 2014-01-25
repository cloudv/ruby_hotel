require '../../src/lib/order'
require '../../src/lib/hotel'
class HotelContainer

  def generateOrder orderInfo
    /(Regular|Rewards).*\((\w{3,})\).*\((\w{3,})\).*\((\w{3,})\)/.match(orderInfo)
    Order.new($1,[].push($2).push($3).push($4))
  end

  def initHotels
    hotels = [{:name => "Lakewood",:rate => 3},{:name => "Bridgewood",:rate => 4},{:name =>"Ridgewood",:rate => 5}]
    hotels.map!{|hotel|
      Hotel.new(hotel[:name],hotel[:rate])
    }
  end

  

  def getResult orderInfo
    hotels = initHotels


    order = generateOrder(orderInfo)
    index = 0
    temp = 0
    resultIndex = 0
    rate = 0
    hotels.map! { |hotel|
      price = hotel.generateTotalPrice(order)
      #price = generateTotalPrice(hotel[:name], order.customerType, order.days)
      index += 1
      if index == 1
        temp = price
        resultIndex = index
        rate = hotel.rate
      end

      if temp > price
        temp = price
        resultIndex = index
        rate = hotel.rate
      elsif temp == price && hotel.rate > rate
        temp = price
        resultIndex = index
        rate = hotel.rate
      end
      {:name => hotel.name, :price => price, :rate => hotel.rate}
    }
    hotels[resultIndex -1][:name]
  end

end