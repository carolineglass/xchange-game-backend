# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'httparty'
require 'byebug'
require 'nokogiri'

puts "destroy countries"
Country.destroy_all

puts "destroy items"
Item.destroy_all

puts "destroy conversions"
Conversion.destroy_all

puts "destroy scoreboards"
Scoreboard.destroy_all

puts "create countries(250)"
url = 'http://countryapi.gear.host/v1/Country/getCountries'
response = HTTParty.get(url)
data = response.parsed_response

url2 = 'https://openexchangerates.org/api/latest.json?app_id=d94eb4ec7e764ab2b336585a0deda920'
resp = HTTParty.get(url2)
rate_data = resp.parsed_response

rate_data["rates"].each do |code, rate|
    data["Response"].each do |country|
        if code == country["CurrencyCode"]
            Country.create({
                name: country["Name"],
                currency: country["CurrencyName"],
                flag: country["Flag"],
                code: code,
                currency_symbol: country["CurrencySymbol"],
                rate: rate
            })
        end
    end
end

# data["Response"].each do |country|
#     Country.create({
#         name: country["Name"],
#         currency: country["CurrencyName"],
#         flag: country["FlagPng"],
#         code: country["CurrencyCode"],
#         currency_symbol: country["CurrencySymbol"],
#         rate: nil
#     })
# end


# puts "create items"
# bread = Item.create(name: "Loaf of Bread", price: 2.99, img: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSOxVzQ9gg1BW9muXlcWU7T5G4U-w2kTHumU7EKM5f3fZTo1ESB77Q&usqp=CAc")
# milk = Item.create(name: "Gallon of Milk", price: 4.00, img: "https://pikfly.com/images/products/164/41060.jpg")
# coffee = Item.create(name: "Starbucks Grande Iced Coffee", price: 4.45, img: "https://i.insider.com/5a38216ca8d5b06f068b4579?width=1100&format=jpeg&auto=webp")
# eggs = Item.create(name: "Dozen eggs", price: 2.00, img: "https://cdn11.bigcommerce.com/s-ek50668lzs/images/stencil/1280x1280/products/3012/3276/5514-lg__14388.1577655497.jpg?c=1?imbypass=on&imbypass=on")
# beer = Item.create(name: "Budlight 6 pack", price: 6.50, img: "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcS1Nmn7bq6U6oTfAp10Xc7_54kpdSsykzvqnHZsOuB22-VZclzOKJzs9GVqoocZjH-zZMLpngkassX75xtHfzqGA_CYLaQi&usqp=CAc")
# cereal = Item.create(name: "Cinammon Toast Crunch", price: 5.60, img: "https://i5.walmartimages.com/asr/bed0f375-092e-4a7d-8213-d2d0156e5628_1.7e5d2fc89dae9edc1f6a5f26bb422028.jpeg")
# icecream = Item.create(name: "Vanilla 14fl oz Ice Cream", price: 5.50, img: "https://www.adileepizza.com/wp-content/uploads/2018/12/hdv.jpg")
# watermelon = Item.create(name: "Watermelon", price: 12.99, img: "https://media.istockphoto.com/photos/watermelon-picture-id92006627?k=6&m=92006627&s=612x612&w=0&h=TO8W4xfSanflBPetAOgvZeFV4BXWK53epMR8l5jZ41A=")
# kind = Item.create(name: "Dark Chocolate Nuts & Sea Salt Kind Bar", price: 13.99, img: "https://barbend.com/wp-content/uploads/2019/07/kind-275x275.png")
# pizza = Item.create(name: "Papa John's The Works", price: 17.99, img: "https://www.papajohns.com/static-assets/a/images/web/product/pizzas/the-works-slate-compressed.jpg")

puts "create items"
Item.create(name: "Grapes", price: 3, img: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/237/grapes_1f347.png")
Item.create(name: "Avocados", price: 2, img: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/237/avocado_1f951.png")
Item.create(name: "Glass of Wine", price: 7, img: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/237/wine-glass_1f377.png")
Item.create(name: "Bagel", price: 2, img: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/237/bagel_1f96f.png")
Item.create(name: "Beer", price: 5, img: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/237/beer-mug_1f37a.png")
Item.create(name: "Cocktail", price: 10, img: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/237/tropical-drink_1f379.png")
Item.create(name: "Vanilla Ice Cream", price: 1, img: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/237/soft-ice-cream_1f366.png")
Item.create(name: "Pizza Slice", price: 2, img: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/237/slice-of-pizza_1f355.png")
Item.create(name: "Chocolate Bar", price: 1, img: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/237/chocolate-bar_1f36b.png")
Item.create(name: "Sushi", price: 10, img: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/237/sushi_1f363.png")
Item.create(name: "Teddy Bear", price: 5, img: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/237/teddy-bear_1f9f8.png")
Item.create(name: "Movie Ticket", price: 10, img: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/237/admission-tickets_1f39f.png")
Item.create(name: "Bread", price: 3, img: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/237/bread_1f35e.png")
Item.create(name: "Hot Dog", price: 1, img: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/237/hot-dog_1f32d.png")
Item.create(name: "Cup of Coffee", price: 10, img: "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/237/hot-beverage_2615.png")


puts "create conversions"
100.times do 
    Conversion.create({
        country_id: Country.all.sample.id,
        item_id: Item.all.sample.id,
    })
end

score = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

2.times do
    Scoreboard.create(username: "Josh", score: score.sample)
end

2.times do 
    Scoreboard.create(username: "Caroline", score: score.sample)
end

2.times do 
    Scoreboard.create(username: "Steven", score: score.sample)
end

2.times do 
    Scoreboard.create(username: "Jallen", score: score.sample)
end

2.times do 
    Scoreboard.create(username: "Meghann", score: score.sample)
end


