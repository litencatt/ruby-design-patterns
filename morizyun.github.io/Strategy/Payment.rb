class Order
  attr_reader :method, :amount

  def initialize(method, ammout)
    @method = method
    @amount = amount
  end

  def pay
    @method.exec_pay
  end
end

class PaymentMethod
  def pay
    raise NotImplemetedError
  end
end

class CreditCard < PaymentMethod
  def exec_pay
    puts 'pay with card'
  end
end

class PayPal < PaymentMethod
  def exec_pay
    puts 'pay with paypal'
  end
end

order = Order.new(CreditCard.new, 1000)
order.pay

order = Order.new(PayPal.new, 1000)
order.pay
