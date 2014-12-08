class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  # GET /entries.json
  def index
    # @entries = Entry.all
    logger.debug("***index*** entries_controller index param[#{params}]")
    @blog = Blog.find(params[:blog_id])
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    @blog = Blog.find(params[:blog_id])
    logger.debug("***show*** entries_controller new param[#{params}]")
    logger.debug("***show*** @blog[#{@blog}]")
    logger.debug("***show*** blog_id[#{params[:blog_id]}")
    @entry = @blog.entries.find(params[:id])
  end

  # GET /entries/new
  def new
    # @entry = Entry.new
    @blog = Blog.find(params[:blog_id])
    logger.debug("***new*** entries_controller new param[#{params}]")
    logger.debug("***new*** @blog[#{@blog}]")
    logger.debug("***new*** blog_id[#{params[:blog_id]}")
    @entry = @blog.entries.new()
  end

  # GET /entries/1/edit
  def edit
    @blog = Blog.find(params[:blog_id])
    logger.debug("***edit*** entries_controller new param[#{params}]")
    logger.debug("***edit*** @blog[#{@blog}]")
    logger.debug("***edit*** blog_id[#{params[:blog_id]}")
    @entry = @blog.entries.find(params[:id])
  end

  # POST /entries
  # POST /entries.json
  def create
    # @entry = Entry.new(entry_params)
    @blog = Blog.find(params[:blog_id])
    @entry = @blog.entries.new(entry_params)

    respond_to do |format|
      if @entry.save
        logger.debug("entry name[#{@entry.class}]")
        logger.debug("entry  val[#{@entry}]")
        format.html { redirect_to [@blog, @entry], notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: [@blog, @entry] }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
          logger.debug("***update*** @entry[#{@entry}]")
          logger.debug("***update*** @blog[#{@blog}]")
          logger.debug("***update*** entry_params[#{entry_params}]")
        @blog = Blog.find(entry_params[:blog_id])
        format.html { redirect_to [@blog,@entry], notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: [@blog,@entry] }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to blog_entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:title, :body, :blog_id)
    end
end
