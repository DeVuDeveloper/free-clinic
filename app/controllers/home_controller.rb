# frozen_string_literal: true

class HomeController < ApplicationController
  def welcome
   redirect_to(users_appointments_path) if user = current_user
   redirect_to(doctors_appointments_path) if user = current_doctor
end
end
