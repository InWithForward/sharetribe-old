# == Schema Information
#
# Table name: availabilities
#
#  id              :integer          not null, primary key
#  listing_id      :integer
#  start_at_hour   :integer
#  start_at_minute :integer
#  end_at_hour     :integer
#  end_at_minute   :integer
#  dow             :integer
#  date            :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  recurring       :boolean          default(FALSE)
#
# Indexes
#
#  index_availabilities_on_date        (date)
#  index_availabilities_on_listing_id  (listing_id)
#

require 'spec_helper'

describe Availability do
  describe "unbooked" do
    let!(:listing) { FactoryGirl.create(:listing) }
    let!(:availability) do
      FactoryGirl.create(:availability,
                         listing: listing,
                         start_at: start_at,
                         end_at: end_at,
                         date: start_at.to_date)
    end

    let(:start_at) { Time.now + 2.days }
    let(:end_at) { start_at + 1.hour }

    subject { described_class.unbooked(listing) }

    it 'returns availabilty' do
      expect(subject[0][:start_at].hour).to eql(availability.start_at_hour)
      expect(subject[0][:end_at].hour).to eql(availability.end_at_hour)
    end

    def create_booking(d)
      start_at = Time.new(d.year, d.month, d.day, availability.start_at_hour, availability.start_at_minute, 0)
      end_at = Time.new(d.year, d.month, d.day, availability.end_at_hour, availability.end_at_minute, 0)

      FactoryGirl.create(:booking,
                          confirmed: true,
                          transaction: transaction,
                          start_at: start_at,
                          end_at: end_at)

    end

    context 'when the slot is already booked' do
      let!(:transaction) { FactoryGirl.create(:transaction, listing: listing) }
      let!(:booking) { create_booking(availability.date) }

      it 'is empty' do
        expect(subject).to eql([])
      end
    end
  end
end
