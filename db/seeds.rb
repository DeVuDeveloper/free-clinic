require 'ffaker'

AdminUser.create!(phone: '11111111111', password: 'admin1', password_confirmation: 'admin1')
doctor = Doctor.create!(phone: '22222222222', password: 'doctor', password_confirmation: 'doctor',
                        full_name: FFaker::Name.name, category: FactoryBot.create(:category))
user = User.create!(phone: '33333333333', password: 'user11', password_confirmation: 'user11',
                    full_name: FFaker::Name.name)
appointments = FactoryBot.create_list(:appointment, 2, doctor: doctor, user: user)
FactoryBot.create(:recommendation, appointment: appointments.sample)