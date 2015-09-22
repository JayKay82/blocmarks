module ApplicationHelper
  require 'embedly'
  require 'json'

  # http://stackoverflow.com/questions/28622912/using-embedly-with-rails
  def get_thumbnail_for(url)
    embedly_api = Embedly::API.new(key: ENV['EMBEDLY_API_KEY'])
    obj = embedly_api.oembed :url => url
    (obj.first.thumbnail_url)
  end

  # http://stackoverflow.com/questions/5012188/rails-link-to-external-site-url-is-attribute-of-user-table-like-users-websit
  def url_with_protocol(url)
    /^http/i.match(url) ? url : "http://#{url}"
  end

  def form_group_tag(errors, &block)
     if errors.any?
       content_tag :div, capture(&block), class: 'field has-error'
     else
       content_tag :div, capture(&block), class: 'field'
     end
   end
end
