class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
  
    if @question.save
      flash[:notice] = "Question was saved. Yee hoo."
      redirect_to @question
    else
      flash.now[:alert] = "There was an error saving your question. Why? Good question."
      render :new
    end
  end
  
  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.resolved = params[:question][:resolved]
    
    if @question.save
      flash[:notice] = "\"#{@question.title}\" was saved successfully."
      render :show
    else
      flash.now[:alert] = "There was an error saving your question."
      render :edit
    end
  end
  
  def destroy
    @question = Question.find(params[:id])
    
    if @question.destroy
      flash[:notice] = "Your question was successfully deleted."
      redirect_to questions_path
    else
      flash.now[:alert] = "There was an error deleting your question."
      render :show
    end
  end
end
