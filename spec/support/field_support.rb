module FieldSupport
  def add_value_field
    fill_in 'Name', with: 'shotamatsushima'
    fill_in 'user[email]', with: 'shotatest@gmail.com'
    select 'Southampton', from: 'Favorite team'
    select '三重県', from: 'Address'
    fill_in 'user[password]', with: 1234567890
    fill_in 'user[password_confirmation]', with: 1234567890
  end
end

RSpec.configure do |config|
  config.include FieldSupport
end
