def get_roadmap
  response = self.class.get('https://www.bloc.io/api/v1/roadmaps/31', headers: { "authorization" => @auth_token})
  JSON.parse response.body
end

def get_checkpoint(checkpoint_id)
  response = self.class.get('https://www.bloc.io/api/v1/checkpoints/' + String(checkpoint_id), headers: { "authorization" => @auth_token})
  JSON.parse response.body
end
