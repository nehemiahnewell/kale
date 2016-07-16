module Roadmap
  API_ENDPOINT = 'https://www.bloc.io/api/v1'.freeze

  def get_roadmap(roadmap_id)
    response = self.class.get("#{API_ENDPOINT}/roadmaps/#{roadmap_id}",
                              headers: { 'authorization' => @auth_token })
    JSON.parse response.body
  end

  def get_checkpoint(checkpoint_id)
    response = self.class.get("#{API_ENDPOINT}/checkpoints/#{checkpoint_id}",
                              headers: { 'authorization' => @auth_token })
    JSON.parse response.body
  end
end
