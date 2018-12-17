# frozen_string_literal: true

every 1.day, at: '8:00 pm' do
  rake 'webflix:payment'
end
