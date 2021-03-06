module FieldSupport
  def add_value_field
    fill_in 'Name', with: 'shotamatsushima'
    fill_in 'user[email]', with: 'shotatest@gmail.com'
    select 'Southampton', from: 'Favorite team'
    select '三重県', from: 'Address'
    fill_in 'user[password]', with: 1234567890
    fill_in 'user[password_confirmation]', with: 1234567890
  end

  def add_event_value_field
    fill_in 'event[event_name]', with: 'プレミアリーグのイベントです'
    fill_in 'event[description]', with: 'Liverpoolの試合です'
    attach_file "event[image]", "#{Rails.root}/spec/fixtures/top-hero.png"
    fill_in 'address', with: '神奈川県'
    select DateTime.now, form: 'イベント開始日時'
    select DateTime.now.tomorrow, form: 'イベント開始日時'
    select 'Southampton', from: 'イベントチーム'
    fill_in 'event[capacity]', with: 5
  end
end

RSpec.configure do |config|
  config.include FieldSupport
end
