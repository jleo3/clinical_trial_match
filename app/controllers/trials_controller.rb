class TrialsController < ApplicationController
  before_action :set_trial, only: [:show, :edit, :update, :destroy]

  # It looks like this is the heart of your search functionality. 
  # There's a fair amount of essential complexity in this method 
  # but some incidental complexity as well 
  # (http://en.wikipedia.org/wiki/Accidental_complexity). More below.
  def index

    @focuses = Focus.all

    # What is params[:pc] and what happens when it's blank? This could be 
    # made more explicit with a method call or better variable naming.
    # This logic should probably be moved either to a private method or, even
    # better, into the model
    unless params[:pc].blank?
      
      # Maplewood [40.73,-74.27]
      # California [34.05,118.25]
      coordinates =  [34.05,-118.25]#Geocoder.coordinates("#{coordinates}, United States")
      @coordinates = [34.05,-118.25]
      session[:coordinates] = coordinates
        if coordinates.blank? || coordinates == [39.49593, -98.990005]      
          raise
        end
    end

    # You really learned how to use scopes, which is awesome! I can see they're 
    # helping to bring some clarity to this tricky search. You can go even 
    # further by moving this to a private method on the model.
    @trials = Trial.search_for(params[:q]).age(params[:age]).control?(params[:vt]).gender(params[:gender]).type(params[:ty]).phase(params[:ph]).fda(params[:fda]).focus(params[:focus]).close_to(coordinates, params[:td]).order(params[:ot]||"title ASC").paginate(:page => params[:page], :per_page => 10)

    # eric's refactoring recommendation -    @sites = Site.near(params[:pc],params[:td]).where(trials_ids: @trial_ids).paginate(:page => params[:page], :per_page => 10)
    # The session object can also store other objects. It looks like you want
    # to construct a temporary object here and hand it off to the session.
    # If it makes sense, you can use a Struct to accomplish this
    # http://www.ruby-doc.org/core-2.0.0/Struct.html
    session[:age] = params[:age]
    session[:vt] = params[:vt]
    session[:gender] = params[:gender]
    session[:pc] = params[:pc]
    session[:td] = params[:td]

    # @trials.each do |trial|
    #   trial.sites.sort_by{|site| site.distance_from(session[:coordinates])}
    # end

    # rescue # Need to name raised error
    #   flash.alert = "Your zip code is not valid!"
    #   render "index"

  end


  def show
    @trial = Trial.find params[:id]
    # @TODO? I'm running distance_from in both the controller and view. Should this just be done in the model??
    # Answer: distance_from is a DateHelper method and is intended to be used
    # in the view. That said, there's nothing wrong with calling it here.
    # The main consideration is whether you're calling it multiple times with
    # the same coordinates. If so, this can be optimized by setting an 
    # instance variable with the results of the distance_from method and calling
    # it from the view instead of repeating the method.
    @sites = @trial.sites.sort_by{|site| site.distance_from(session[:coordinates])}



  end

  def new
    @trial = Trial.new
  end


  def edit
  end


  def create
    @trial = Trial.new(trial_params)

    respond_to do |format|
      if @trial.save
        format.html { redirect_to @trial, notice: 'Trial was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trial }
      else
        format.html { render action: 'new' }
        format.json { render json: @trial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trials/1
  # PATCH/PUT /trials/1.json
  def update
    respond_to do |format|
      if @trial.update(trial_params)
        format.html { redirect_to @trial, notice: 'Trial was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trials/1
  # DELETE /trials/1.json
  def destroy
    @trial.destroy
    respond_to do |format|
      format.html { redirect_to trials_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_trial
    @trial = Trial.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def trial_params
    params.require(:trial).permit(:title, :description, :sponsor, :country, :focus)
  end
end
