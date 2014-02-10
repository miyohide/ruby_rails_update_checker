class Settings::SendAddressesController < ApplicationController
   def index
      saved_data = Settings.unscoped.where(var: 'send_addresses')
      if saved_data.empty?
         @send_addresses = Settings.send_addresses
      else
         @send_addresses = saved_data.first
      end
   end

   def new
   end

   def create
      input_address = Hash[:to, params[:To], :name, params[:Name]]
      puts input_address.inspect
      Settings.send_addresses = Settings.send_addresses << input_address
      redirect_to action: :index
   end
end
