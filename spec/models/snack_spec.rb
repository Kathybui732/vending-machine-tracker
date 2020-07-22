require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe 'relationships' do
    it { should have_many :machine_snacks }
    it { should have_many(:machines).through(:machine_snacks) }
  end

  describe 'methods' do
    before :each do
      @owner_1 = Owner.create(name: "Owner 1")
      @machine_1 = Machine.create(location: "Denver", owner: @owner_1)
      @snack_1 = Snack.create(name: "Kit-Kat", price: 1.25)
      @snack_2 = Snack.create(name: "Reecees", price: 1.75)
      MachineSnack.create(machine: @machine_1, snack: @snack_1)
      MachineSnack.create(machine: @machine_1, snack: @snack_2)
    end

    it "#average_price" do
      expect(Snack.average_price).to eq(1.5)
    end
  end
end
