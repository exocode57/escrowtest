json.extract! payment, :id, :payer_email, :payer_name, :payer_address, :payer_phone, :stuff_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
