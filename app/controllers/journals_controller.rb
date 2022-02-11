class JournalsController < ApplicationController

  before_action :dependent => :destroy

  def index
    @categories = Category.all

    cat = params[:cat]
    if !cat.nil?
      @journals = Journal.where(:category_id => cat)
    else
      @journals = Journal.all
    end
  end

  def show
    @journal = Journal.find(params[:id])
    @categories = Category.all
  end

  def new
    @journal = Journal.new
  end

  def create
    @journal = Journal.create(journal_params)

    if @journal.save
      redirect_to @journal
    else
      render :new
    end
  end

  def edit
    @journal = Journal.find(params[:id])
  end

  def update
    @journal = Journal.find(params[:id])
    
    if @journal.update(journal_params)
      redirect_to @journal
    else
      render :edit
    end
  end
    
  def destroy
    @journal = Journal.find(params[:id])

    @journal.destroy
    redirect_to :dependent => :destroy
  end

  private
  def journal_params
    params.require(:journal).permit(:title, :content, :category_id)
  end

end
