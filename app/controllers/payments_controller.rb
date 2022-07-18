class PaymentsController < ApplicationController
  before_action :get_stuff
  before_action :set_payment, only: %i[ show edit update destroy ]

  # GET /payments or /payments.json
  def index
    @payments = @stuff.payments
  end

  # GET /payments/1 or /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = @stuff.payments.new
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments or /payments.json
  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      Rails.logger.debug("loading checksum #{@payment.generate_checksum}")
      
      params_api = {
        uid: "e7c5d7eb-3707-4a0b-9f79-5f015941adf7",
        checksum: @payment.generate_checksum,
        buyer_email: @payment.payer_email,
        buyer_name: @payment.payer_name,
        buyer_phone: @payment.payer_phone,
        order_number: @stuff.stuff_code,
        product_description: @stuff.stuff_name,
        transaction_amount: @stuff.stuff_price,
        callback_url: "",
        redirect_url: "",
        token: "osjbg2SM9p1q4v-PyYqb",
        redirect_post: "true"
        
       }

      redirect_post('https://sandbox.securepay.my/api/v1/payments',            # URL, looks understandable
        params: params_api)                
      end

  end

  # PATCH/PUT /payments/1 or /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to payment_url(@payment), notice: "Payment was successfully updated." }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url, notice: "Payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def get_stuff
      @stuff = Stuff.find(params[:stuff_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = @stuff.payments.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_params
      params.require(:payment).permit(:payer_email, :payer_name, :payer_address, :payer_phone, :stuff_id)
    end
end
