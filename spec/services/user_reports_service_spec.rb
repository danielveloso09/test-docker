# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserReportsService do
  context '#get_reports' do
    let(:get_reports) { subject.get_reports(user: user) }
    let!(:normal_user) { User.create!(email: 'user@foo.bar', password: 'foobar') }
    let!(:admin) { User.create!(email: 'admin@foo.bar', password: 'foobar', admin: true) }

    before do
      Report.create!(name: 'Report-1', user: normal_user)
      Report.create!(name: 'Report-2', user: admin)
    end

    context 'with normal user' do
      let(:user) { normal_user }
      it 'returns only reports from current user' do
        expect(get_reports).to eq(normal_user.reports)
      end
    end

    context 'with admin user' do
      let(:user) { admin }
      it 'returns all reports' do
        expect(get_reports).to eq(Report.all)
      end
    end
  end
end
