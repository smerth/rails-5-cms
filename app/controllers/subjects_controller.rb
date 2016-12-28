class SubjectsController < ApplicationController

  layout 'admin'

   before_action :confirm_logged_in
  # before_action :find_subjects, :only => [:new, :create, :edit, :update]
  before_action :set_subject_count, :only => [:new, :create, :edit, :update]

  def index
    logger.debug("*** Testing the logger: the Index action is about to run ***")
    @subjects = Subject.all.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => 'Default'})
    # counts the existing subjects plus the one we are creating with this action to give a total count for subjects.
    # @subject_count = Subject.count + 1
  end

  def create
    # Instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    # Save the object
    if @subject.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Subject created successfully."
      redirect_to(subjects_path)
    else
      # If save fails, redisplay the form so user can fix problems
      # @subject_count = Subject.count + 1
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    # @subject_count = Subject.count
  end

  def update
    # Find a object using form parameters
    @subject = Subject.find(params[:id])
    # Update the object
    if @subject.update_attributes(subject_params)
      # If update succeeds, redirect to the show action
      flash[:notice] = "Subject updated successfully."
      redirect_to(subject_path(@subject))
    else
      # If update fails, redisplay the form so user can fix problems
      # @subject_count = Subject.count
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    # Find a object using form parameters
    @subject = Subject.find(params[:id])
    # Destroy the object
    @subject.destroy
    # If destroy succeeds, redirect to the index action
    flash[:notice] = "Subject '#{@subject.name}' destroyed successfully."
    redirect_to(subjects_path)
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible, :created_at)
  end

  def set_subject_count
    @subject_count = Subject.count
    if params[:action] == 'new' || params[:action] == 'create'
      @subject_count += 1
    end
  end

end
