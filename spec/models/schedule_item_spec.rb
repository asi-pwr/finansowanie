require 'rails_helper'

RSpec.describe ScheduleItem, type: :model do
  it { is_expected.to validate_presence_of(:todo) }
end
