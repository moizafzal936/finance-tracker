module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      notice: "alert-success",
      alert: "alert-danger",
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end
