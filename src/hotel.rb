class Hotel

  def fake
    afn(1)
  end

  def afn arg
    "a"
  end

  def getResult orderInfo
    /(Regular|Rewards).*\((\w{3,})\).*\((\w{3,})\).*\((\w{3,})\)/.match(orderInfo)
    customerType = $1;
    days = [].push($2).push($3).push($4)
    lakewood = bridgewood = ridgewood =0
    if customerType.eql?("Regular")
      days.each{ |day|
        if day.eql?("sat") || day.eql?("sun")
                  lakewood += 90
                  bridgewood += 60
                  ridgewood += 150
                else
                  lakewood += 110
                  bridgewood += 160
                  ridgewood += 220
                end
      }
    elsif customerType.eql?("Rewards")
      days.each{ |day|
        if day.eql?("sat") || day.eql?("sun")
                  lakewood += 80
                  bridgewood += 50
                  ridgewood += 100
                else
                  lakewood += 80
                  bridgewood += 110
                  ridgewood += 40
                end
      }
    end
    temp = (lakewood < bridgewood)?lakewood : bridgewood
    totalPrice = temp < ridgewood ? temp : ridgewood
    if totalPrice.eql?(lakewood)
      "Lakewood"
    elsif totalPrice.eql?(bridgewood)
      "Bridgewood"
    elsif totalPrice.eql?(ridgewood)
      "Ridgewood"
    end
  end
end