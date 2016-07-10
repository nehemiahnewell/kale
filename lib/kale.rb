require "kale/version"
require 'httparty'

module Kale
  class Kele
    include HTTParty
    
    attr_accessor :authentication_token
    
    def initialize(user, password)
      @api_url = 'https://www.bloc.io/api/v1'
      get_autherized = self.class.post('https://www.bloc.io/api/v1/sessions/',
      :query => { :email => user, :password => password })
      @authentication_token = get_autherized["auth_token"]
    end
  end
end
