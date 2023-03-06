require "csv"

Company.destroy_all

puts "database cleaned"

file_path = Rails.root.join("lib", "crm_data.csv")
person_columns = %w(first_name last_name email phone stage probability)

CSV.foreach(file_path, headers: true) do |row|
  company_name = row["company"].to_s.strip
  company = Company.find_or_create_by(name: company_name)

  person_attributes = row.to_h.slice(*person_columns)
  person_attributes.merge!(company: company) if company.persisted?

  person = Person.find_or_initialize_by(person_attributes)

  puts "person already found: #{person.email}" and next if person.persisted?

  if person.save
    puts "person created: #{person.first_name} #{person.last_name}"
  else
    puts "person not created: #{person.errors.full_messages.to_sentence}"
  end
end

puts Person.count
