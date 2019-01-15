# frozen_string_literal: true

json.extract! application, :id, :name, :date, :amount_overall, :created_at, :updated_at
json.url application_url(application, format: :json)
