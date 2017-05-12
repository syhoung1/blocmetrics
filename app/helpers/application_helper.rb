module ApplicationHelper
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end
  
  def flash_messages(opt = {})
    flash.each do |message_type, message|
      concat(
        content_tag(:div, message, class: "alert #{bootstrap_class_for(message_type)} fade in") do
          concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
          concat message
        end
      )
    end
    nil
  end
end
