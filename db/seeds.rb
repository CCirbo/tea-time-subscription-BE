# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Subscription.destroy_all
Customer.destroy_all
Tea.destroy_all

english_breakfast = Tea.create!(
  title: "English Breakfast", 
  description: "Strong and bold", 
  temperature: 100, 
  brew_time: 3
)

green_tea = Tea.create!(
  title: "Green Tea", 
  description: "Fresh and smooth", 
  temperature: 80, 
  brew_time: 2
)
earl_grey = Tea.create!(
  title: "Earl Grey", 
  description: "Citrusy and aromatic", 
  temperature: 95, 
  brew_time: 4
)

oolong = Tea.create!(
  title: "Oolong", 
  description: "Complex and floral", 
  temperature: 90, 
  brew_time: 3
)

herbal = Tea.create!(
  title: "Herbal Tea",
   description: "Caffeine-free and calming", 
   temperature: 100, 
   brew_time: 5
)

chai = Tea.create!(
  title: "Chai", 
  description: "Spicy and warming", 
  temperature: 100, 
  brew_time: 5
)


customer1 = Customer.create!(
    first_name: "Merry", 
    last_name: "Brandybuck", 
    email: "merry@example.com", 
    address: "123 Shire Lane, Hobbiton, ME, 12345"
    )

customer2 = Customer.create!(
    first_name: "Frodo", 
    last_name: "Baggins", 
    email: "frodo@example.com", 
    address: "456 Hobbiton Rd, Hobbiton, ME, 12345"
    )

customer3 = Customer.create!(
    first_name: "Samwise", 
    last_name: "Gamgee", 
    email: "sam@example.com", 
    address: "789 Westfarthing St, Bywater, ME, 12345"
    )

customer4 = Customer.create!(
    first_name: "Pippin", 
    last_name: "Took", 
    email: "pippin@example.com", 
    address: "101 Tookborough Ave, Tuckborough, ME, 12345"
    )

customer5 = Customer.create!(
    first_name: "Aragorn", 
    last_name: "Elessar", 
    email: "aragorn@example.com", 
    address: "246 Ranger Way, Rivendell, ME, 12345"
    )

customer6 = Customer.create!(
    first_name: "Legolas", 
    last_name: "Greenleaf", 
    email: "legolas@example.com", 
    address: "135 Elven Path, Mirkwood, ME, 12345"
    )


    subscription1 = Subscription.create!(
        title: "Monthly Green Tea", 
        price: 15.99, 
        status: "active", 
        frequency: "monthly", 
        customer_id: customer1.id, 
        tea_id: green_tea.id
      )
      
      subscription2 = Subscription.create!(
        title: "Weekly Black Tea", 
        price: 7.99, 
        status: "active", 
        frequency: "weekly", 
        customer_id: customer2.id, 
        tea_id: english_breakfast.id
      )
      
      subscription3 = Subscription.create!(
        title: "Bi-Weekly Earl Grey", 
        price: 12.99, 
        status: "deactivated", 
        frequency: "bi-weekly", 
        customer_id: customer3.id, 
        tea_id: earl_grey.id
      )
      
      subscription4 = Subscription.create!(
        title: "Monthly Chai Tea", 
        price: 16.99, 
        status: "active", 
        frequency: "monthly", 
        customer_id: customer4.id, 
        tea_id: chai.id
      )
      
      subscription5 = Subscription.create!(
        title: "Weekly Herbal Tea", 
        price: 6.99, 
        status: "deactivated", 
        frequency: "weekly", 
        customer_id: customer5.id, 
        tea_id: herbal.id
      )
      
      subscription6 = Subscription.create!(
        title: "Quarterly Oolong Tea", 
        price: 19.99, 
        status: "active", 
        frequency: "quarterly", 
        customer_id: customer6.id, 
        tea_id: oolong.id
      )
      Subscription.create!(
  title: "Monthly Green Tea", 
  price: 15.99, 
  status: "active", 
  frequency: "monthly", 
  customer_id: customer1.id, 
  tea_id: green_tea.id
)

Subscription.create!(
  title: "Weekly English Breakfast", 
  price: 10.99, 
  status: "active", 
  frequency: "weekly", 
  customer_id: customer1.id, 
  tea_id: english_breakfast.id
)

Subscription.create!(
  title: "Quarterly Earl Grey", 
  price: 20.99, 
  status: "deactivated", 
  frequency: "quarterly", 
  customer_id: customer2.id, 
  tea_id: earl_grey.id
)

Subscription.create!(
  title: "Monthly Herbal Tea", 
  price: 12.99, 
  status: "active", 
  frequency: "monthly", 
  customer_id: customer2.id, 
  tea_id: herbal.id
)

Subscription.create!(
  title: "Weekly Chai", 
  price: 8.99, 
  status: "active", 
  frequency: "weekly", 
  customer_id: customer1.id, 
  tea_id: chai.id
)

Subscription.create!(
  title: "Bi-Weekly Oolong", 
  price: 14.99, 
  status: "deactivated", 
  frequency: "bi-weekly", 
  customer_id: customer2.id, 
  tea_id: oolong.id
)
    
#       # CustomerSubscriptions
# CustomerSubscription.create!(
#     customer: customer1, 
#     subscription: subscription1, 
#     status: "active"
# )

# CustomerSubscription.create!(
#     customer: customer2, 
#     subscription: subscription2, 
#     status: "active"
# )

# CustomerSubscription.create!(
#     customer: customer3, 
#     subscription: subscription3, 
#     status: "canceled"
# )

# CustomerSubscription.create!(
#     customer: customer4, 
#     subscription: subscription4, 
#     status: "active"
# )

# CustomerSubscription.create!(
#     customer: customer5, 
#     subscription: subscription5, 
#     status: "paused"
# )

# CustomerSubscription.create!(
#     customer: customer6, 
#     subscription: subscription6, 
#     status: "active"
# )
    
# SubscriptionTea.create!(
#   subscription: subscription1, 
#   tea: green_tea
# )

# SubscriptionTea.create!(
#   subscription: subscription2, 
#   tea: english_breakfast
# )

# SubscriptionTea.create!(
#   subscription: subscription3, 
#   tea: earl_grey
# )

# SubscriptionTea.create!(
#   subscription: subscription4, 
#   tea: chai
# )

# SubscriptionTea.create!(
#   subscription: subscription5, 
#   tea: herbal
# )

# SubscriptionTea.create!(
#   subscription: subscription6, 
#   tea: oolong
# )



