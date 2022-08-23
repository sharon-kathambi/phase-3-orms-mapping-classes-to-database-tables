require 'bundler'
Bundler.require

require_relative '../lib/Aspirant'

DB = { conn: SQLite3::Database.new("db/elections.db") }
