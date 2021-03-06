# == Schema Information
#
# Table name: custom_field_values
#
#  id                :integer          not null, primary key
#  custom_field_id   :integer
#  text_value        :text
#  numeric_value     :float
#  date_value        :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  type              :string(255)
#  delta             :boolean          default(TRUE), not null
#  customizable_id   :string(255)
#  customizable_type :string(255)
#

class DropdownFieldValue < OptionFieldValue
  validates_length_of :custom_field_option_selections, :is => 1

  def selected_option_title(locale)
    selected_options.try(:first).try(:title, locale)
  end

  def text_value
    selected_option_title(I18n.locale)
  end
end
