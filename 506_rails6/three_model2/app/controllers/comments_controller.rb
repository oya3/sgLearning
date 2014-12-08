class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    # @comments = Comment.all
      logger.debug("***comment index*** #{params}")
    @blog = Blog.find(params[:blog_id])
    @entry = Entry.find(params[:entry_id])
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    logger.debug("***comment show*** #{params}")
    @blog = Blog.find(params[:blog_id])
    @entry = Entry.find(params[:entry_id])
    @comment = @entry.comments.find(params[:id])
  end

  # GET /comments/new
  def new
    # @comment = Comment.new
    logger.debug("***comment new*** #{params}")
    @blog = Blog.find(params[:blog_id])
    @entry = Entry.find(params[:entry_id])
    @comment = @entry.comments.new()
  end

  # GET /comments/1/edit
  def edit
    logger.debug("***comment edit*** #{params}")
    @blog = Blog.find(params[:blog_id])
    @entry = Entry.find(params[:entry_id])
    @comment = @entry.comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    # @comment = Comment.new(comment_params)
    logger.debug("***comment create*** #{params}")
    logger.debug("***comment create comment_params*** #{comment_params}")
    @blog = Blog.find(params[:blog_id])
    @entry = Entry.find(params[:entry_id])
    @comment = @entry.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@blog,@entry,@comment], notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: [@blog,@entry,@comment] }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
      logger.debug("***comment update*** #{params}")
      logger.debug("***comment update comment_params*** #{comment_params}")
      @blog = Blog.find(params[:blog_id])
      @entry = Entry.find(params[:entry_id])

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to [@blog,@entry,@comment], notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: [@blog,@entry,@comment] }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
      logger.debug("***comment destroy*** #{params}")
      @blog = Blog.find(params[:blog_id])
      @entry = Entry.find(params[:entry_id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to blog_entry_path(@blog,@entry), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      logger.debug("***comment set_comment*** #{params}")
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      logger.debug("***comment comment_params*** #{params}")
      params.require(:comment).permit(:body, :status, :entry_id)
    end
end
