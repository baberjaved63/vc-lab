class PeopleController < ApplicationController
  before_action :find_person, only: %i[update]

  def index
    @pagy, @people = pagy(Person.includes(:company).all)
  end

  def update
    respond_to do |format|
      format.js do
        render json: {}, status: :not_found and return unless @person

        @success = @person.update(person_params)
      end
    end
  end

  private

  def find_person
    @person = Person.find_by(id: params[:id])
  end

  def person_params
    params.require(:person).permit(:stage)
  end
end
