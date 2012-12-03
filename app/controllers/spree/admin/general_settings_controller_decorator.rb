Spree::Admin::GeneralSettingsController.class_eval do
  def show_with_extra_preferences
    show_without_extra_preferences
    @preferences << 'admin_email'
  end

  alias_method_chain :show, :extra_preferences

  def edit_with_extra_preferences
    edit_without_extra_preferences
    idx = @preferences.index(:site_url)
    if idx
      @preferences.insert(idx+1, :admin_email)
    else
      @preferences << :admin_email
    end
  end

  alias_method_chain :edit, :extra_preferences
end
