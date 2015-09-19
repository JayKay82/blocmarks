module ApplicationHelper
  # Got this off of http://stackoverflow.com/questions/5012188/rails-link-to-external-site-url-is-attribute-of-user-table-like-users-websit
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
