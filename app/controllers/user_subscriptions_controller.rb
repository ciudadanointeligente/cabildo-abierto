class UserSubscriptionsController < ApplicationController
  before_action :set_user_subscription, only: [:show, :edit, :update, :destroy]

  # GET /user_subscriptions
  def index
    @user_subscriptions = UserSubscription.all
  end

  # GET /user_subscriptions/1
  def show
  end

  # GET /user_subscriptions/new
  def new
    @user_subscription = UserSubscription.new
  end

  # GET /user_subscriptions/1/edit
  def edit
  end

  # POST /user_subscriptions
  def create
    @user_subscription = UserSubscription.new(user_subscription_params)
    @user_subscription.confirmed = false

    if @user_subscription.save
      redirect_to @user_subscription, notice: 'User subscription was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /user_subscriptions/1
  def update
    if @user_subscription.update(user_subscription_params)
      redirect_to @user_subscription, notice: 'User subscription was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /user_subscriptions/1
  def destroy
    @user_subscription.destroy
    redirect_to user_subscriptions_url, notice: 'User subscription was successfully destroyed.'
  end

  def subscribe
    @user = params[:user_email]
    @bill = Bill.get(ENV['billit'] + "#{params[:bill]}", 'application/json')

    # Añadir bill to subscriptions
    @user_subscription = UserSubscription.new
    @user_subscription.user_email = @user
    @user_subscription.bill = @bill.uid
    @user_subscription.confirmed = false
    @user_subscription.save

    salida = @user_subscription.user_email + " subscribes to " + @user_subscription.bill
    render text: salida
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_subscription
      @user_subscription = UserSubscription.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_subscription_params
      params.require(:user_subscription).permit(:user_email, :bill, :confirmed)
    end
end