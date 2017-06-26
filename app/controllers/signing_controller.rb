class SigningController < ApplicationController
  before_action :authenticate_user!
  def index

     filename = params[:filename]

     if !filename
       render json: {error:'No filename specified'},status:422
       return
     end
    options = {
      key: "uploads/#{SecureRandom.uuid}/${filename}",
      success_action_status: '201',
      acl: 'public-read'
    }
    presigned_post = S3_TEMP_BUCKET.presigned_post(options)
    if presigned_post
      render plain: { presignedPost: { fields: presigned_post.fields, url: presigned_post.url } }.to_json, status: 200, content_type: 'application/json'
    else
      render plain: { error: 'No presigned urls.' }.to_json, status: 422, content_type: 'application/json'
    end
  end
end
