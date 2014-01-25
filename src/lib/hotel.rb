class Hotel
  attr_accessor :rate
  attr_accessor :name

  def initialize name, rate
    @rate = rate
    @name = name
  end

  def isRegularCustomer? customerType
    if customerType.eql? "Regular"
      return true
    end
    return false
  end

  def generateTotalPrice order
    customerType = order.customerType
    days = order.days
    price = 0
    days.each { |day|
      if @name.eql?("Lakewood")
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
      elsif @name.eql?("Bridgewood")
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
      elsif @name.eql?("Ridgewood")
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
end
