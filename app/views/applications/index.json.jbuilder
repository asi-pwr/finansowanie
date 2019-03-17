# frozen_string_literal: true

json.array! @applications, partial: 'applications/application', as: :application

json.state_change do
  json.selections
  json.action
end

