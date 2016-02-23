class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items

  def self.parse_parameters(params)
    binding.pry
  end
end