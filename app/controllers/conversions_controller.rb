class ConversionsController < ApplicationController
  require 'date'
  require 'money/bank/currencylayer_bank'
  def index
    @conversions = Conversion.where(user: current_user) 
  end
  
  def new
    @conversion = Conversion.new
  end
  
  def create
    @conversion = Conversion.new(strong_params)
    @conversion.user = current_user
    @conversion.date = Date.today
    @conversion.result = convertion(@conversion.amount, @conversion.from_currency, @conversion.to_currency)
    @conversion.save ? (redirect_to new_conversion_path) : (render :new)
  end
  def destroy
    @conversion = Conversion.find(params[:id])
    @conversion.destroy
    redirect_to conversions_path
  end
  private
  def strong_params
    params.require(:conversion).permit(:from_currency, :to_currency, :amount)
  end

  def convertion(amount, from, to)
    return nil if amount.class == String || amount == nil
    mclb = Money::Bank::CurrencylayerBank.new
    mclb.access_key = ENV["CURRENCY_TOKEN"]
    mclb.update_rates
    rate = mclb.get_rate(from, to)
    (amount * rate.round(2)).round(2)
  end
end
