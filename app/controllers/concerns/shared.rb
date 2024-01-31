# frozen_string_literal: true

# Path: app/controllers/concerns/shared.rb
# This the module for the shared methods. It is used in the application controller.
module Shared
  extend ActiveSupport::Concern

  def password_regex
    /
      \A # The string must
        (?=.*[a-z]) # contain at least 1 lowercase alphabetical character
        (?=.*[A-Z]) # contain at least 1 uppercase alphabetical character
        (?=.*[0-9]) # contain at least 1 numeric character
        (?=.*[!@#$%^&*]) # contain at least one special character
        .{8,}   # Be eight characters or longer
      \z
    /x
  end
end
