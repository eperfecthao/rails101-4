moudle FlashesHelper
  FLASHES_CLASSES = { alert: "danger", notice: "success", warning: "warning"}.freeze

  def falsh_class(key)
    FLASHES_CLASSES.fetch key.to_sym, key
  end

  def user_facing_flashes
    flash.to_hash.slice "alert", "notice", "warning"
  end
