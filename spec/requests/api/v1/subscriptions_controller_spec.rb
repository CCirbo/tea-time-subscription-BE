require 'rails_helper'

RSpec.describe "Subscription Requests" do
  before(:each) do
    @customer1 = Customer.create!(
        first_name: "Frodo", 
        last_name: "Baggins", 
        email: "frodo@example.com", 
        address: "123 Hobbiton Rd"
        )
    @customer2 = Customer.create!(
        first_name: "Samwise", 
        last_name: "Gamgee", 
        email: "sam@example.com", 
        address: "456 Hobbiton Rd"
        )
    
    @tea1 = Tea.create!(
        title: "Green Tea", 
        description: "Smooth and fresh", 
        temperature: 80, 
        brew_time: 3
        )

    @tea2 = Tea.create!(
        title: "Oolong", 
        description: "Complex and floral",
         temperature: 90, 
         brew_time: 4
         )
    
    @subscription1 = Subscription.create!(
        title: "Monthly Green Tea", 
        price: 15.99, status: "active", 
        frequency: "monthly", 
        customer: @customer1, 
        tea: @tea1
        )

    @subscription2 = Subscription.create!(
        title: "Weekly Oolong Tea", 
        price: 12.99, 
        status: "deactivated",
         frequency: "weekly", 
         customer: @customer1, 
         tea: @tea2)

  end

  describe "Fetch all subscriptions" do
    it "fetches all subscriptions" do
      get '/api/v1/subscriptions'
      subscriptions = JSON.parse(response.body, symbolize_names: true)[:data]
      
      expect(response).to be_successful
      expect(subscriptions.count).to eq(2)
      
      subscriptions.each do |subscription|
        expect(subscription[:type]).to eq("subscription")

        expect(subscription).to have_key(:id)
        expect(subscription[:id]).to be_a(String)

        attributes = subscription[:attributes]

        expect(attributes).to have_key(:title)
        expect(attributes[:title]).to be_a(String)

        expect(attributes).to have_key(:status)
        expect(attributes[:status]).to be_in(["active", "deactivated"])

        expect(attributes).to have_key(:frequency)
        expect(attributes[:frequency]).to be_a(String)

        expect(attributes).to have_key(:price)
        expect(attributes[:price]).to be_a(Float)

        expect(attributes).to have_key(:customer)
        expect(attributes[:customer]).to be_a(Hash)

        expect(attributes).to have_key(:tea)
        expect(attributes[:tea]).to be_a(Hash)
      end
    end
  end

  describe "Fetch one subscription" do
    it "fetches one subscription by its id" do
      get "/api/v1/subscriptions/#{@subscription1.id}"
      subscription = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(subscription[:type]).to eq("subscription")

      expect(subscription).to have_key(:id)
      expect(subscription[:id]).to eq(@subscription1.id.to_s)

      attributes = subscription[:attributes]

      expect(attributes[:title]).to eq(@subscription1.title)
      expect(attributes[:status]).to eq("active")
      expect(attributes[:frequency]).to eq(@subscription1.frequency)
      expect(attributes[:price]).to eq(@subscription1.price)

      expect(attributes[:customer][:id]).to eq(@customer1.id)
      expect(attributes[:tea][:id]).to eq(@tea1.id)
    end

    it "returns an error if subscription not found" do
      get "/api/v1/subscriptions/564"
      
      expect(response).to have_http_status(:not_found)
      error_message = JSON.parse(response.body, symbolize_names: true)

      expect(error_message[:error]).to eq("Subscription not found")
    end
  end

  describe "Update status of subscriptions" do
    it "updates a subscription status to deactivated" do
      headers = { "CONTENT_TYPE" => "application/json" }
      patch "/api/v1/subscriptions/#{@subscription1.id}", headers: headers, params: JSON.generate({ subscription: { status: "deactivated" } })
      updated_subscription = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
      expect(response).to be_successful
      expect(updated_subscription[:status]).to eq("deactivated")
      
      updated_subscription_db = Subscription.find(@subscription1.id)
      expect(updated_subscription[:status]).to eq("deactivated")
    end

    it "updates a subscription status to active" do
      headers = { "CONTENT_TYPE" => "application/json" }
      patch "/api/v1/subscriptions/#{@subscription2.id}", headers: headers, params: JSON.generate({ subscription: { status: "active" } })
      updated_subscription = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
      expect(response).to be_successful
      expect(updated_subscription[:status]).to eq("active")

      updated_subscription_db = Subscription.find(@subscription2.id)
      expect(updated_subscription[:status]).to eq("active")
    end

    it "returns an error for invalid status update" do
      headers = { "CONTENT_TYPE" => "application/json" }
      patch "/api/v1/subscriptions/#{@subscription1.id}", headers: headers, params: JSON.generate({ subscription: { status: "" } })

      expect(response).to have_http_status(:unprocessable_entity)
      error_response = JSON.parse(response.body, symbolize_names: true)

      expect(error_response[:errors]).to include("Status can't be blank")
    end

    it "returns an error if subscription to update is not found" do
      headers = { "CONTENT_TYPE" => "application/json" }
      patch "/api/v1/subscriptions/564", headers: headers, params: JSON.generate({ subscription: { status: "deactivated" } })

      expect(response).to have_http_status(:not_found)
      error_message = JSON.parse(response.body, symbolize_names: true)

      expect(error_message[:error]).to eq("Subscription not found")
    end
  end
end