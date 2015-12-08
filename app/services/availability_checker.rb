class AvailabilityChecker

  def self.call
    # Send on the 1, 6, 11, 16, 21, 26,
    return unless (Date.today.day - 1) % 5 == 0

    Community.all.each do |community|
      community.listings.non_badge.currently_open.each do |listing|
        availabilities = Availability.
          unbooked(listing).
          select { |a| a[:start_at] > Time.now + 48.hours }

        next if availabilities.size > 3

        PersonMailer.insufficient_availabilities_to_admin(community, listing).deliver
        PersonMailer.insufficient_availabilities_to_author(community, listing).deliver
      end
    end
  end
end