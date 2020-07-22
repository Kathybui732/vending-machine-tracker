require "rails_helper"

RSpec.describe "Snack Show Page" do
	before :each do
    @owner_1 = Owner.create(name: "Owner 1")
    @machine_1 = Machine.create(location: "Denver", owner: @owner_1)
    @machine_2 = Machine.create(location: "Broomfield", owner: @owner_1)
    @snack_1 = Snack.create(name: "Kit-Kat", price: 1.25)
    @snack_2 = Snack.create(name: "Reecees", price: 1.75)
    @snack_3 = Snack.create(name: "Snickers", price: 1.00)
    MachineSnack.create(machine: @machine_2, snack: @snack_1)
    MachineSnack.create(machine: @machine_2, snack: @snack_3)
    MachineSnack.create(machine: @machine_1, snack: @snack_1)
    MachineSnack.create(machine: @machine_1, snack: @snack_2)
	end

  it "displays the name and price of that snack" do
    visit "/snacks/#{@snack_1.id}"
    expect(page).to have_content("#{@snack_1.name}")
    expect(page).to have_content("#{@snack_1.price}")
  end

  it "a list of locations with vending machines that carry that snack" do
    visit "/snacks/#{@snack_1.id}"
    within(".locations-#{@machine_1.id}") do
      expect(page).to have_content("#{@machine_1.location}")
    end

    within(".locations-#{@machine_2.id}") do
      expect(page).to have_content("#{@machine_2.location}")
    end
  end

  it "the average price for snacks in those vending machines" do
    visit "/snacks/#{@snack_1.id}"
    within(".locations-#{@machine_1.id}") do
      expect(page).to have_content("average price: 1.5")
    end

    within(".locations-#{@machine_2.id}") do
      expect(page).to have_content("average price: 1.13")
    end
  end

  it "a count of the different kinds of items in that vending machine" do
    visit "/snacks/#{@snack_1.id}"
    within(".locations-#{@machine_1.id}") do
      expect(page).to have_content("2 kinds of snacks")
    end

    within(".locations-#{@machine_2.id}") do
      expect(page).to have_content("2 kinds of snack")
    end
  end
end
