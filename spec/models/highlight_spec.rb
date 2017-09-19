# == Schema Information
#
# Table name: highlights
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Highlight, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
