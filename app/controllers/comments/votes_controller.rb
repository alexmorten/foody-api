class Comments::VotesController <VotesController
    before_action :set_votable

    private
        def set_votable
            @votable = Comment.find(params[:comment_id])
        end
end
