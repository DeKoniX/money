module DebtsHelper
	def sumDebt(person)
		person.debt.sum(:m)
	end
end
