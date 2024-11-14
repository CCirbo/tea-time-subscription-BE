class Api::V1::SubscriptionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
  def index
    subscriptions = Subscription.all
    render json: SubscriptionSerializer.new(subscriptions)
  end
  
  def show
    subscription = Subscription.find(params[:id])
    render json: SubscriptionSerializer.new(subscription)
  
  end

  def update
    subscription = Subscription.find(params[:id])

    if subscription.update(subscription_params)
      render json: SubscriptionSerializer.new(subscription)
    else
      render json: { errors: subscription.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:status)
  end

  def not_found
    render json: { error: 'Subscription not found' }, status: :not_found
  end
end