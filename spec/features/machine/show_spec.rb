require "rails_helper"

RSpec.describe "Machine show page" do
  before :each do
    @owner_1 = Owner.create(name: "Owner 1")
    @machine_1 = Machine.create(location: "Denver", owner: @owner_1)
    @snack_1 = Snack.create(name: "Kit-Kat", price: 1.25)
    @snack_2 = Snack.create(name: "Reecees", price: 1.75)
    MachineSnack.create(machine: @machine_1, snack: @snack_1)
    MachineSnack.create(machine: @machine_1, snack: @snack_2)
  end

  it "displays the name of all the snacks associated with that vending machine along with their price" do
    visit "/machines/#{@machine_1.id}"
    within(".snacks-#{@snack_1.id}") do
      expect(page).to have_content("Snack: #{@snack_1.name}")
      expect(page).to have_content("Price: #{@snack_1.price}")
    end

    within(".snacks-#{@snack_2.id}") do
      expect(page).to have_content("Snack: #{@snack_2.name}")
      expect(page).to have_content("Price: #{@snack_2.price}")
    end
  end

  it "displays an average price for all of the snacks in that machine" do
    visit "machines/#{@machine_1.id}"
    expect(page).to have_content("Average snack price: 1.5")
  end
end
