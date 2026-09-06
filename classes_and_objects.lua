BankAccount = {
    account_number = 0,
    holder_name = "",
    balance = 0.0
}

function BankAccount:deposite(amount)
    self.balance = self.balance + amount
end

function BankAccount:withdraw(amount)
    if amount > self.balance then
        print("Insufficient funds")
    else
        self.balance = self.balance - amount
    end
end

function BankAccount:new(t)
    t = t or {}
    setmetatable(t, self)
    self.__index = self
    return t
end

-- Example usage
account = BankAccount:new({
    account_number = 123456,
    holder_name = "John Doe",
    balance = 0.0
})
account:deposite(1000)
account:withdraw(500)
print("New account object...")
print(account.balance) -- Output: 500.0
