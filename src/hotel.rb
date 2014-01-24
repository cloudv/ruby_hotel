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

  def isRegularCustomer? customerType
    if customerType.eql? "Regular"
      return true
    end
      return false
  end

  def generateTotalPrice name, customerType, days
    price = 0
    debugger
    days.each { |day|
      if name.eql?("Lakewood")
        if day.eql?("sat") || day.eql?("sun")
          if (isRegularCustomer?(customerType))
            price += 90
          else
            price += 80
          end
        else
          if (isRegularCustomer?(customerType))
            price += 110
          else
            price += 80
          end
        end
      elsif name.eql?("Bridgewood")
        if day.eql?("sat") || day.eql?("sun")
          if (isRegularCustomer?(customerType))
            price += 60
          else
            price += 50
          end
        else
          if (isRegularCustomer?(customerType))
            price += 160
          else
            price += 110
          end
        end
      elsif name.eql?("Ridgewood")
        if day.eql?("sat") || day.eql?("sun")
          if (isRegularCustomer?(customerType))
            price += 150
          else
            price += 40
          end
        else
          if (isRegularCustomer?(customerType))
            price += 220
          else
            price += 100
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
    hotels = [{:name => "Lakewood",:rate => 3},{:name => "Bridgewood",:rate => 4},{:name =>"Ridgewood",:rate => 5}]
    index = 0
    temp = 0
    resultIndex = 0
    rate = 0
    hotels.map! { |hotel|
      price = generateTotalPrice(hotel[:name], customerType, days)
      index += 1
      if index == 1
        temp = price
        resultIndex = index
        rate = hotel[:rate]
      end
      debugger
      if temp > price
        temp = price
        resultIndex = index
        rate = hotel[:rate]
      elsif temp == price && hotel[:rate] > rate
        temp = price
        resultIndex = index
        rate = hotel[:rate]
      end
      {:name => hotel[:name], :price => price, :rate => hotel[:rate]}
    }
    hotels[resultIndex -1][:name]

  end
end