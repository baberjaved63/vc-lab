module PeopleHelper
  def stages_options(person)
    options_for_select(Person::STAGES, person.stage)
  end
end
