class SubscriptionSerializer
    include JSONAPI::Serializer
    attributes :id, :title, :price, :status, :frequency, :tea_id, :customer_id

    attribute :customer do |subscription|
    {
        id: subscription.customer.id,
        first_name: subscription.customer.first_name,
        last_name: subscription.customer.last_name,
        email: subscription.customer.email,
        address: subscription.customer.address
    }
    end
    
    attribute :tea do |subscription|
    {
        id: subscription.tea.id,
        title: subscription.tea.title,
        description: subscription.tea.description,
        temperature: subscription.tea.temperature,
        brew_time: subscription.tea.brew_time
    }
    end
end
