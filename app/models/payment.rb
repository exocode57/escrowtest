class Payment < ApplicationRecord
    belongs_to :stuff

    def generate_checksum
 
    
        data = "#{payer_email}|#{payer_name}|#{payer_phone}|#{""}|#{stuff.stuff_code}|#{stuff.stuff_name}|http://127.0.0.1:3010/redirectpage/statuspayment|#{stuff.stuff_price}|#{"e7c5d7eb-3707-4a0b-9f79-5f015941adf7"}"
        puts(data)
        checksum_token = "6d6a89340596f76a0b2ab67bdac31e27d36a30861be194b37d564a6f07c86633"
        OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), checksum_token, data)
    
    end    
end
