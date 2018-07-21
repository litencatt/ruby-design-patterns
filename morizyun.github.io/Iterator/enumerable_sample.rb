class Account
  attr_accessor :name, :balance

  def initialize(name, balance)
    @name = name
    @balance = balance
  end

  def <=>(other)
    @balance <=> other.balance
  end
end

class Portfolio
  include Enumerable

  def initialize
    @accounts = []
  end

  def each(&block)
    @accounts.each(&block)
  end

  def add_account(account)
    @accounts << account
  end
end

portfolio = Portfolio.new
portfolio.add_account(Account.new("account1", 1000))
portfolio.add_account(Account.new("account1", 2000))
portfolio.add_account(Account.new("account1", 3000))
portfolio.add_account(Account.new("account1", 4000))
portfolio.add_account(Account.new("account1", 5000))

puts portfolio.any? { |account| account.balance > 3000 }
puts portfolio.all? { |account| account.balance >= 2000 }
