class PeopleController < ApplicationController
  def new
    @person = Person.new
    @person.addresses.build(address_type: "home")
    @person.addresses.build(address_type: "work")
  end

  def create
    byebug
    Person.create(person_params)
    byebug
    redirect_to people_path
  end

  def index
    @people = Person.all
  end

  private

  def person_params
    params.require(:person).permit(:name, address_attributes: [:street_address_1, :street_address_2, :city, :state, :zipcode, :type])
  end
end
