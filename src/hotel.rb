class Hotel

  attr_accessor :regular_week_price
  attr_accessor :regular_weekend_price
  attr_accessor :rewards_week_price
  attr_accessor :rewards_weekend_price
  attr_accessor :rate
  attr_accessor :name


  def getOrders orderInfo
    /(Regular|Rewards).*\((\w{3,})\).*\((\w{3,})\).*\((\w{3,})\)/.match(orderInfo)
    orders = {:customerType => $1, :days => [].push($2).push($3).push($4)}
  end

  def generateTotalPrice name, customerType, days
    price = 0
    days.each{ |day|
      if name.eql?("Lakewood")
        if day.eql?("sat") || day.eql?("sun")
          if (customerType.eql?("Regular"))
            price += 90
          else
            price += 80
          end
        else
          if (customerType.eql?("Regular"))
            price += 110
          else
            price += 80
          end
        end
      elsif name.eql?("Bridgewood")
        if day.eql?("sat") || day.eql?("sun")
          if (customerType.eql?("Regular"))
            price += 60
          else
            price += 50
          end
        else
          if (customerType.eql?("Regular"))
            price += 160
          else
            price += 110
          end
        end
      elsif name.eql?("Ridgewood")
        if day.eql?("sat") || day.eql?("sun")
          if (customerType.eql?("Regular"))
            price += 150
          else
            price += 100
          end
        else
          if (customerType.eql?("Regular"))
            price += 220
          else
            price += 40
          end
        end
      end
    }
    return price
  end

  def getResult orderInfo
    orders = getOrders(orderInfo)
    customerType = orders[:customerType]
    days = orders[:days]
    lakewood = bridgewood = ridgewood =0
    hotels = ["Lakewood","Bridgewood","Ridgewood"]
    index = 0
    temp = 0
    hotels.map{ |hotel|
      index += 1
      price = generateTotalPrice(hotel,customerType,days)
      temp = index if temp > price || temp = 0
      {:name => hotel, :price => price}
    }
    hotels[index][:name]
    #if customerType.eql?("Regular")
    #  days.each { |day|
    #    if day.eql?("sat") || day.eql?("sun")
    #      lakewood += 90
    #      bridgewood += 60
    #      ridgewood += 150
    #    else
    #      lakewood += 110
    #      bridgewood += 160
    #      ridgewood += 220
    #    end
    #  }
    #elsif customerType.eql?("Rewards")
    #  days.each { |day|
    #    if day.eql?("sat") || day.eql?("sun")
    #      lakewood += 80
    #      bridgewood += 50
    #      ridgewood += 100
    #    else
    #      lakewood += 80
    #      bridgewood += 110
    #      ridgewood += 40
    #    end
    #  }
    #end
    #temp = (lakewood < bridgewood) ? lakewood : bridgewood
    #totalPrice = temp < ridgewood ? temp : ridgewood
    #if totalPrice.eql?(lakewood)
    #  "Lakewood"
    #elsif totalPrice.eql?(bridgewood)
    #  "Bridgewood"
    #elsif totalPrice.eql?(ridgewood)
    #  "Ridgewood"
    #end
  end
end