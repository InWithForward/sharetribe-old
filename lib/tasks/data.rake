
# These tasks are one off data migrations
#
namespace :data do
  task populate_custom_field_values_customizable: :environment do
    CustomFieldValue.where('listing_id is not null').each do |custom_field_value|
      custom_field_value.customizable_id = custom_field_value.listing_id
      custom_field_value.customizable_type = Listing.to_s
      custom_field_value.save
    end
  end

  task create_custom_person_text_fields: :environment do
    def create_field(klass, community, name)
      field = klass.new(
        for: Person.to_s,
        name_attributes: { en: name },
        required: false
      ).tap do |field|
        field.community = community
        field.save
      end
    end

    def create_value(klass, field, value, person)
      return unless value
      klass.new(text_value: value).tap do |tf|
        tf.customizable = person
        tf.question = field
        tf.save
      end
    end

    ActiveRecord::Base.transaction do
      community = Community.first

      ask_me = create_field(TextAreaField, community, 'Things you can ask me about')
      signup_reason = create_field(TextAreaField, community, "I've signed up for Kudoz, because")
      description = create_field(TextAreaField, community, "About Me")
      phone_number = create_field(TextField, community, "Phone Number")
      video = create_field(VideoField, community, "Youtube URL")

      Person.all.each do |person|
        p person
        create_value(TextAreaFieldValue, ask_me, person.ask_me, person)
        create_value(TextAreaFieldValue, signup_reason, person.signup_reason, person)
        create_value(TextFieldValue, phone_number, person.phone_number, person)
        create_value(TextAreaFieldValue, description, person.description, person)
        create_value(VideoFieldValue, video, person.video, person)
      end
    end
  end

  task add_roles: :environment do
    community = Community.first
    Role.create(community: community, name: 'Host')
    Role.create(community: community, name: 'Guest')
  end
end
