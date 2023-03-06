class PeopleController < ApplicationController
  before_action :find_person, only: %i[edit update destroy]

  def index
    @q = Person.includes(:company).ransack(params[:q])
    @pagy, @people = pagy(@q.result)
  end

  def update
    respond_to do |format|
      format.js do
        render json: {}, status: :not_found and return unless @person

        @success = @person.update(person_params)
      end

      format.html do
        if @person.update(person_params)
          redirect_to people_path
        else
          render :edit
        end
      end
    end
  end

  def new
    @person = Person.new
  end

  def edit
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to people_path
    else
      render :new
    end
  end

  def destroy
    @person.destroy
    redirect_to people_path
  end

  private

  def find_person
    @person = Person.find_by(id: params[:id])
  end

  def person_params
    params.require(:person).permit(:stage)
  end
end
