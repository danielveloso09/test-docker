# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ReportsController, type: :controller do
  context '#filter' do
    subject do
      get :filter, params: { location: 'foo' }
    end

    context 'with loggein user' do
      let(:current_user) do
        User.create!(email: 'foo@bar.com', password: 'foobar')
      end

      before do
        sign_in current_user
      end

      it 'filter action should be success' do
        subject

        assert_response :success
      end

      context 'delegates' do
        let(:filter_service) { double }
        before do
          allow_any_instance_of(FilterReportsFactory).to receive(:create_service).and_return(filter_service)
          allow(filter_service).to receive(:filter_reports)
        end

        it 'proper attributes to service' do
          expect(filter_service)
            .to receive(:filter_reports)
            .with(user: current_user, filters: { location: 'foo'} )

          subject
        end
      end

    end

    context 'with loggedout user' do
      it 'should redirect' do
        subject

        expect(response).to redirect_to('http://test.host/users/sign_in')
      end
    end
  end
end
