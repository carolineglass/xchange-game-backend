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


