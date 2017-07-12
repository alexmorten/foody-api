class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  # GET /votes
  def index
    if @votable
      @votes = @votable.votes
    else
      @votes = Vote.all
    end
    render json: @votes
  end

  # GET /votes/1
  def show
    render json: @vote
  end

  # POST /votes
  def create
    @vote = @votable.votes.new vote_params
    @vote.user = @current_user
    @old_vote = @current_user.get_vote_for @votable
    if @old_vote
      if @old_vote.value == @vote.value
        @old_vote.destroy
        render json: {success:"deleted old vote"},status:200
        return
      else
        @old_vote.destroy
      end
    end
    #@current_user.delete_vote_for(@votable)
    if @vote.save
      render json: @vote, status: :created, location: @vote
    else
      Vote.create @old_vote.attributes_hash
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /votes/1
  def update
    if @vote.update(vote_params)
      render json: @vote
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /votes/1
  def destroy
    @vote.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vote_params
      params.require(:vote).permit(:value)
    end
end
