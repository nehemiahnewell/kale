require 'httparty'
require 'json'
require 'kale/version'
require 'kale/roadmap'

module Kale
  class Kele
    include HTTParty
    include Roadmap

    attr_accessor :auth_token

    def initialize(user, password)
      @url = 'https://www.bloc.io/api/v1'
      get_autherized = self.class.post('https://www.bloc.io/api/v1/sessions/',
                                       query: { email: user, password: password })
      @auth_token = get_autherized['auth_token']
    end

    def get_me
      response = self.class.get('https://www.bloc.io/api/v1/users/me', headers: { 'authorization' => @auth_token })
      JSON.parse response.body
    end

    def get_mentor_availability(mentor_id)
      response = self.class.get('https://www.bloc.io/api/v1/mentors/' + String(mentor_id) + '/student_availability', headers: { 'authorization' => @auth_token })
      (JSON.parse response.body).flatten
    end

    def get_messages(page_id = nil)
      if page_id
        response = self.class.get('https://www.bloc.io/api/v1/message_threads', query: { page: page_id }, headers: { 'authorization' => @auth_token })
      else
        response = self.class.get('https://www.bloc.io/api/v1/message_threads', headers: { 'authorization' => @auth_token })
      end

      JSON.parse response.body
    end
  end
end
