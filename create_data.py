import random
import json

# Define users
users = ['Ankit', 'Tarak', 'Priyanka', 'Ravi', 'David', 'Venkat', 'Harshita', 'Kader']

# Define provided food items
foods_provided = [
    'Chicken Biryani', 'Paneer Butter Masala', 'Dosa', 'Idli', 'Vada', 'Samosa', 'Butter Chicken', 'Gulab Jamun', 
    'Ras Malai', 'Rajma Chawal', 'Fish Curry', 'Chicken 65', 'Mutton Rogan Josh', 'Palak Paneer', 'Chole Bhature', 
    'Malai Kofta', 'Aloo Paratha', 'Hyderabadi Biryani', 'Pesarattu', 'Chicken Chettinad', 'Egg Curry', 'Kadhi Chawal', 
    'Poha', 'Upma', 'Rava Dosa', 'Bisi Bele Bath', 'Pongal', 'Chicken Tikka', 'Tandoori Chicken', 'Paneer Tikka', 
    'Shahi Paneer', 'Pav Bhaji', 'Matar Paneer', 'Kadai Chicken', 'Fish Fry', 'Mutton Biryani', 'Keema Naan', 
    'Bhindi Masala', 'Baingan Bharta', 'Aloo Gobi', 'Gajar Ka Halwa', 'Puran Poli', 'Sabudana Khichdi', 'Sambar', 
    'Rasam', 'Aloo Tikki', 'Momos', 'Chilli Chicken', 'Spring Rolls', 'Hakka Noodles', 'Manchurian', 'Chowmein', 
    'Dimsum', 'Peking Duck', 'Sushi', 'Ramen', 'Tempura', 'Bibimbap', 'Kimchi', 'Tacos', 'Burrito', 'Enchiladas', 
    'Quesadilla', 'Nachos', 'Guacamole', 'Falafel', 'Hummus', 'Shawarma', 'Baklava', 'Tzatziki', 'Gyro', 'Moussaka', 
    'Pad Thai', 'Tom Yum Soup', 'Green Curry', 'Red Curry', 'Satay', 'Som Tum', 'Pho', 'Banh Mi', 'Laksa', 'Gyoza', 
    'Doner Kebab', 'Pide', 'Dolma', 'Khachapuri', 'Borscht', 'Pelmeni', 'Ceviche', 'Feijoada', 'Empanadas', 'Arepas'
]

# Define sample comments
comments = [
    "Excellent taste, would order again!",
    "Good, but could use a bit more spice.",
    "Not bad, but not great either.",
    "Didn't like the flavor.",
    "Perfectly cooked!",
    "A bit too salty for my taste.",
    "Very flavorful and delicious.",
    "Average quality, nothing special.",
    "Loved it! Highly recommend.",
    "Not up to the mark."
]

# Generate feedback data
formatted_feedback_data = []

for food in foods_provided:
    for user in users:
        rating = round(random.uniform(1.0, 5.0), 1)
        comment = random.choice(comments)
        
        feedback = {
            "request_type": "give_feedback",
            "food_name": food,
            "rating": rating,
            "comment": comment
        }
        
        formatted_feedback_data.append(feedback)

# Convert to JSON format
formatted_feedback_json = json.dumps(formatted_feedback_data, indent=4)

# Write to a JSON file
with open('formatted_provided_food_dummy_feedback.json', 'w') as file:
    file.write(formatted_feedback_json)
