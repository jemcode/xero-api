require 'spec_helper'

describe Xero::Api::Attachment do

  let(:api){ Xero::Api.new(creds.to_h) }

  it 'for an invoice is successfully created' do
    use_cassette("xero_api/attachment/create_for_invoice", record: :none) do
      file_name = 'connect_xero_button_blue_2x.png'
      resp = api.upload_attachment(:invoices, id: '9eb7b996-4ac6-4cf8-8ee8-eb30d6e572e3', 
                                   file_name: file_name, content_type: 'image/png',
                                   attachment: "#{__dir__}/../../../example/public/#{file_name}")
      expect(resp["Id"]).to_not be nil
    end
  end

end