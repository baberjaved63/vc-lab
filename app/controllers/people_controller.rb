class PeopleController < ApplicationController
  def index
    @pagy, @people = pagy(Person.includes(:company).all)
  end
end
