class Order
  attr_accessor :customerType
  attr_accessor :days

  def initialize customer_type,days
    @customerType = customer_type
    @days = days
  end

end