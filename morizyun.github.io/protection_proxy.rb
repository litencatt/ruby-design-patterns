class BankAccount
  attr_reader :balance

  def initialize(balance)
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -=amount
  end
end

require 'etc'

# ユーザー認証を担当する防御プロキシ
class BankAccountProxy
  def initialize(real_object, owner_name)
    @real_object = real_object
    @owner_name = owner_name
  end

  def method_missing(name, *args)
    check_access
    @real_object.send(name, *args)
  end

  def balance
    check_access
    @real_object.balance
  end

  def check_access
    if Etc.getlogin != @owner_name
      raise "Illegal accss: #{@owner_name} cannot access account."
    end
  end
end

account = BankAccount.new(100)
proxy = BankAccountProxy.new(account, ENV["USER"])
puts proxy.deposit(50)
puts proxy.withdraw(10)

account = BankAccount.new(100)
proxy = BankAccountProxy.new(account, "no_login_user")
puts proxy.deposit(50)
