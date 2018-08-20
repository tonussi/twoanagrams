# frozen_string_literal: true

# Extending String class with a numeric? method
class String
  def numeric?
    !Float(self).nil?
  rescue StandardError
    false
  end
end
