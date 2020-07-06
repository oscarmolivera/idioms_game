module ApplicationHelper
  include Pagy::Frontend
  def toastr_flash_messages
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      type = 'info' if type == 'info'
      type = 'warning' if type == 'warning'
      text = "<script>toastr.#{type}('#{message}', '#{type.upcase}', {closeButton:true, progressBar: true});</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join('\n').html_safe
  end

  def active_link_to(name = nil, options = nil, html_options = nil, &block)
    active_class = html_options[:active] || "active"
    html_options.delete(:active)
    html_options[:class] = "#{html_options[:class]} #{active_class}" if current_page?(options)
    link_to(name, options, html_options, &block)
  end
end
