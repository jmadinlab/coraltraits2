
puts "******* Creating Users *******"

users = User.create!([
  {first_name: "Joshua", last_name: "Madin", email: "jmadin@hawaii.edu", password: "corals", password_confirmation: "corals", contributor: true, editor: true, admin: true, activated: true, activated_at: Time.zone.now},
  {first_name: "Daniel", last_name: "Gomez Gras", email: "danielgomezgras@ucm.es", password: "corals", password_confirmation: "corals", contributor: true, editor: true, admin: true, activated: true, activated_at: Time.zone.now}
])

puts "******* Creating Valuetypes *******"

Valuetype.create!([
  {user_id: 1, value_type_name: "Raw value", value_type_description: "", has_precision: false},
  {user_id: 1, value_type_name: "Mean", value_type_description: "", has_precision: true},
  {user_id: 1, value_type_name: "Median", value_type_description: "", has_precision: true},
  {user_id: 1, value_type_name: "Maximum", value_type_description: "", has_precision: false},
  {user_id: 1, value_type_name: "Minimum", value_type_description: "", has_precision: false},
  {user_id: 1, value_type_name: "Model derived", value_type_description: "", has_precision: true},
  {user_id: 1, value_type_name: "Expert opinion", value_type_description: "", has_precision: true},
  {user_id: 1, value_type_name: "Group opinion", value_type_description: "", has_precision: true}
])

puts "******* Creating Precisiontypes *******"

Precisiontype.create!([
  {user_id: 1, precision_type_name: "Standard error", precision_type_description: "", has_range: false},
  {user_id: 1, precision_type_name: "Standard deviation", precision_type_description: "", has_range: false},
  {user_id: 1, precision_type_name: "Confidence interval", precision_type_description: "", has_range: false},
  {user_id: 1, precision_type_name: "Range", precision_type_description: "", has_range: true},
  {user_id: 1, precision_type_name: "Not given", precision_type_description: "", has_range: false}
])

puts "******* Creating Traitclasses *******"

Traitclass.create!([
  {user_id: 1, class_name: "Biomechanical", class_description: "", contextual: false},
  {user_id: 1, class_name: "Conservation", class_description: "", contextual: false},
  {user_id: 1, class_name: "Contextual", class_description: "", contextual: true},
  {user_id: 1, class_name: "Ecological", class_description: "", contextual: false},
  {user_id: 1, class_name: "Geographical", class_description: "", contextual: false},
  {user_id: 1, class_name: "Morphological", class_description: "", contextual: false},
  {user_id: 1, class_name: "Phylogenetic", class_description: "", contextual: false},
  {user_id: 1, class_name: "Physiological", class_description: "", contextual: false},
  {user_id: 1, class_name: "Reproductive", class_description: "", contextual: false},
  {user_id: 1, class_name: "Stoichiometric", class_description: "", contextual: false}
])


# Trait.create!([
#   {user_id: 1, trait_name: "Length", trait_description: "Value as measured by observer.", standard_id: 1, traitclass_id: 1}
# ])
#
# puts "******* Creating Species *******"
#
# Specie.create!([
#   {user_id: 1, specie_name: "Acropora hyacinthus", specie_description: "", aphia_id: "", approved: true}
# ])
#
# puts "******* Creating Locations *******"
#
# Location.create!([
#   {user_id: 1, location_name: "Lizard Island", latitude: -14.670499, longitude: 145.458706, location_description: "", approved: true}
# ])
#
# puts "******* Creating Resource *******"
#
# Resource.create!([
#   {user_id: 1, doi_isbn: "10.1038/nature05328", approved: true}
# ])
#
# puts "******* Creating Method *******"
#
# Methodology.create!([
#   {user_id: 1, methodology_name: "Tape measure", methodology_description: "", approved: true}
# ])
#
# # Methodologiestrait.create!([
# #   {trait_id: 1, methodology_id: 1}
# # ])
#
# puts "******* Creating Observation / Measurement *******"
#
# Observation.create!([
#   {user_id: 1, specie_id: 1, location_id: 1, resource_id: 1, access: true, approved: true,
#     measurements_attributes: [{user_id: 1, observation_id: 1, trait_id: 1, standard_id: 1, methodology_id: 1, value: 10.3, valuetype_id: 2, precision: 1.1, precisiontype_id: 1, replicates: 14, measurement_description: ""}]
#   }
# ])

# Measurement.create!([
#   {user_id: 1, observation_id: 1, trait_id: 1, standard_id: 1, methodology_id: 1, value: 10.3, valuetype_id: 2, precision: 1.1, precisiontype_id: 1, replicates: 14, measurement_description: ""}
# ])
