class Snack < ApplicationRecord

  has_many :machine_snacks
  has_many :machines, through: :machine_snacks

  def self.average_price
    price = average(:price).to_f.round(2)
  end

  def self.snacks_count
    Snack.all.count
  end
end
