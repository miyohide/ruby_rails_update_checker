class Settings::SendAddressesController < ApplicationController
   def index
      @send_addresses = Settings.unscoped.where(var: 'send_addresses')
      @send_addresses = Settings.send_addresses if @send_addresses.empty?
   end
end
