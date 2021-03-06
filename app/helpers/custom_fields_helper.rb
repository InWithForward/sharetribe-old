module CustomFieldsHelper
  module_function

  def custom_fields_hash(listing)
    custom_fields = listing.category.custom_fields.map do |field|
      value = listing.answer_for(field)

      text = case value.try(:type)
      when "DropdownFieldValue"
        value.selected_option_title(I18n.locale)
      when "DateFieldValue"
        I18n.l(value.date_value, format: :short_date)
      when "CheckboxFieldValue", "DropdownFieldValue"
        value.selected_options.map { |option| option.title(I18n.locale) }.join(", ")
      when 'NumericFieldValue'
        value.display_value
      else
        value.try(:text_value)
      end

      [field.key, text]
    end

    Hash[custom_fields]
      .symbolize_keys
      .reject { |key, value| key.blank? }
  end

  def field_type_translation(type)
    tranlation_map = {
      "DropdownField" => "admin.custom_fields.field_types.dropdown",
      "TextField" => "admin.custom_fields.field_types.text",
      "NumericField" => "admin.custom_fields.field_types.number",
      "CheckboxField" => "admin.custom_fields.field_types.checkbox_group",
      "DateField" => "admin.custom_fields.field_types.date",
      "TextAreaField" => "admin.custom_fields.field_types.text_area",
      "VideoField" => "admin.custom_fields.field_types.video",
      "GoalField" => "admin.custom_fields.field_types.goal",
      "TagField" => "admin.custom_fields.field_types.tag"
    }

    t(tranlation_map[type])
  end

  def custom_field_dropdown_options(options)
    options.collect { |option| [field_type_translation(option), option] }.insert(0, [t("admin.custom_fields.index.select_one"), nil])
  end

  def goal_value(value)
    prefix = "listings.form.custom_field_partials.goal"

    part_one = t("#{prefix}.part_one")
    part_two = t("#{prefix}.part_two")
    part_three = t("#{prefix}.part_three")

    [
      content_tag(:span, part_one),
      content_tag(:span, value.time, class: "user-entered"),
      content_tag(:span, part_two),
      content_tag(:span, value.action, class: "user-entered"),
      content_tag(:span, value.activity, class: "user-entered"),
      content_tag(:span, part_three),
      content_tag(:span, value.reason, class: "user-entered")
    ].join(" ").html_safe
  end

end
