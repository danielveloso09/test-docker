# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FilterReportsService do
  subject do
    described_class.new(service: service)
  end
  let(:service) { double }

  context '#filter_reports' do
    let(:filter_reports) do
      subject.filter_reports(user: user, filters: filters)
    end
    let(:filters) { {} }
    let(:user) { double }
    let(:reports) { double }

    before do
      allow(service).to receive(:get_reports).and_return(reports)
      allow(reports).to receive(:where)
    end

    it 'delegates the proper attributes to service' do
      expect(service).to receive(:get_reports).with(user: user)

      filter_reports
    end

    context 'with valid filters' do
      context 'with location' do
        let(:filters) { { location: 'location' } }
        it 'delegates the proper attributes to reports' do
          expect(reports).to receive(:where).with(location: 'location')

          filter_reports
        end
      end
    end
  end
end
