# frozen_string_literal: true

require 'shrine'
require 'image_processing/mini_magick'

case Rails.env
when 'development'
  require 'shrine/storage/file_system'

  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),
    store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads')
  }
when 'production'
  require "cloudinary"
  require "shrine/storage/cloudinary"
  Cloudinary.config(
  cloud_name: ENV['CLOUD_NAME'],
  api_key:    ENV['CLOUD_API_KEY'],
  api_secret: ENV['CLOUD_API_SECRET'],
  )
  Shrine.storages = {
  cache: Shrine::Storage::Cloudinary.new(prefix: "cache"), # for direct uploads
  store: Shrine::Storage::Cloudinary.new(prefix: "rails_uploads"),
  }
when 'test'
  require 'shrine/storage/memory'

  Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new
  }
end

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data
Shrine.plugin :determine_mime_type
Shrine.plugin :validation_helpers
Shrine.plugin :derivatives, create_on_promote: true
Shrine.plugin :default_url
