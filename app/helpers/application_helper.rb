# frozen_string_literal: true

# Path: app/helpers/application_helper.rb
# This is the helper for the application.
module ApplicationHelper
  def avatar_nil?(image, preferences)
    return get_svg('svg/avatar.svg', { color: preferences }) if image.nil?

    image_tag("avatars/#{image}")
  end

  def get_svg(filename, options = {})
    options = options[:color]
    file = File.read(Rails.root.join('app', 'assets', 'images', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    svg['fill'] = options if options.present?
    doc.to_html.html_safe
  end
end
