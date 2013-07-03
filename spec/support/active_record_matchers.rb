RSpec::Matchers.define :have_a_valid_field do |expected|
  match do |actual|
    actual.valid?  # trigger validations to populate errors()
    actual.errors[expected].empty?
  end
end

RSpec::Matchers.define :have_an_invalid_field do |expected|
  match do |actual|
    actual.valid?  # trigger validations to populate errors()
    !actual.errors[expected].empty?
  end
end
