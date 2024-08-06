USE foodApp;
DROP TABLE `User`;
DROP TABLE `Menu`;
DROP TABLE `Food`;
DROP TABLE `Feedback`;
DROP TABLE `Notification`;
DROP TABLE `Notificationtype`;
DROP TABLE `RecommendedFood`;
drop TABLE `Vote`;

DROP TABLE `LoginAttempts`;

DROP TABLE `DiscardedFood`;


CREATE TABLE User(
    user_id VARCHAR(30),
    user_name VARCHAR(30),
    password VARCHAR(18),
    role VARCHAR(10),
    spice_level VARCHAR(100) NULL,
    tooth_type VARCHAR(100) NULL,
    foodie_type VARCHAR(100) NULL,
    preffered_type VARCHAR(100) NULL,
    PRIMARY KEY(user_id)
)


CREATE TABLE Menu (
    menu_id INT PRIMARY KEY,
    menu_name VARCHAR(100) NOT NULL,
    Timestamp DATETIME NOT NULL
);
INSERT INTO Menu (menu_id, menu_name, Timestamp) VALUES
(1, "MainMenu", NOW());

CREATE TABLE Food (
    food_name VARCHAR(100)  PRIMARY KEY NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    availability_status BOOLEAN NOT NULL,
    avg_rating DECIMAL(3, 2) NOT NULL,
    avg_sentiment VARCHAR(10) DEFAULT 'Neutral',
    food_type VARCHAR(100) NOT NULL,
    menu_id INT,
    spice_level VARCHAR(30) NOT NULL,
    is_sweet BOOLEAN NOT NULL,
    region VARCHAR(30) NOT NULL,
    FOREIGN KEY (menu_id) REFERENCES Menu(menu_id)
);

CREATE TABLE SentimentMapping (
    sentiment VARCHAR(300) PRIMARY KEY,
    sentiment_value DECIMAL(3, 2) NOT NULL
);
INSERT INTO SentimentMapping (sentiment, sentiment_value) VALUES ('Positive', 1.0);
INSERT INTO SentimentMapping (sentiment, sentiment_value) VALUES ('Neutral', 0.0);
INSERT INTO SentimentMapping (sentiment, sentiment_value) VALUES ('Negative', -1.0);


CREATE TABLE Vote (
    user_id VARCHAR(30),
    have_voted BOOLEAN,
    food_name VARCHAR(30),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (food_name) REFERENCES Food(food_name) ON DELETE CASCADE
);

CREATE TABLE RecommendedFood (
    food_name VARCHAR(100),
    total_vote INT,
    FOREIGN KEY (food_name) REFERENCES Food(food_name) ON DELETE CASCADE
);

CREATE TABLE Feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(300) NOT NULL,
    rating FLOAT NOT NULL,
    sentiment VARCHAR(300),
    user_id VARCHAR(30),
    food_name VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (food_name) REFERENCES Food(food_name) ON DELETE CASCADE,
    UNIQUE (user_id, food_name) 
);


CREATE TABLE Notificationtype (
    notification_type_id INT PRIMARY KEY,
    notification_type VARCHAR(100) NOT NULL
);

CREATE TABLE Notification (
    notification_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(30),
    notification_type_id INT,
    Timestamp DATETIME NOT NULL,
    food_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (notification_type_id) REFERENCES Notificationtype(notification_type_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (food_name) REFERENCES Food(food_name) ON DELETE CASCADE
);

CREATE TABLE LoginAttempts (
    login_attemp_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(30),
    attempt_type VARCHAR(10) NOT NULL,
    status BOOLEAN NOT NULL,
    Timestamp DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE DiscardedFood (
    food_name VARCHAR(100),
    avg_rating DECIMAL(3, 2) NOT NULL,
    avg_sentiment VARCHAR(10) DEFAULT 'Neutral',
    FOREIGN KEY (food_name) REFERENCES Food(food_name) ON DELETE CASCADE
);

CREATE TABLE AuditFeedback (
    user_id VARCHAR(30),
    food_name VARCHAR(100),
    didnt_liked VARCHAR(250) NOT NULL,
    like_to_taste VARCHAR(600) NOT NULL,
    recipe VARCHAR(600) NOT NULL,
    FOREIGN KEY (food_name) REFERENCES Food(food_name) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

INSERT INTO Food (food_name, price, availability_status, avg_rating, food_type, menu_id, spice_level, is_sweet, region) VALUES 
('Chicken Biryani', 250, TRUE, 0, 'Non Veg', 1, 'High', False, 'North Indian'),
('Paneer Butter Masala', 200, TRUE, 0, 'Veg', 1, 'Medium', False, 'North Indian'),
('Dosa', 80, TRUE, 0, 'Veg', 1, 'Low', False, 'South Indian'),
('Idli', 50, TRUE, 0, 'Veg', 1, 'Low', False, 'South Indian'),
('Vada', 60, TRUE, 0, 'Veg', 1, 'Low', False, 'South Indian'),
('Samosa', 30, TRUE, 0, 'Veg', 1, 'Medium', False, 'North Indian'),
('Butter Chicken', 300, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'North Indian'),
('Gulab Jamun', 50, TRUE, 0, 'Veg', 1, 'Low', True, 'North Indian'),
('Ras Malai', 70, TRUE, 0, 'Veg', 1, 'Low', True, 'North Indian'),
('Rajma Chawal', 150, TRUE, 0, 'Veg', 1, 'Low', False, 'North Indian'),
('Fish Curry', 200, TRUE, 0, 'Non Veg', 1, 'High', False, 'South Indian'),
('Chicken 65', 180, TRUE, 0, 'Non Veg', 1, 'High', False, 'South Indian'),
('Mutton Rogan Josh', 350, TRUE, 0, 'Non Veg', 1, 'High', False, 'North Indian'),
('Palak Paneer', 180, TRUE, 0, 'Veg', 1, 'Low', False, 'North Indian'),
('Chole Bhature', 120, TRUE, 0, 'Veg', 1, 'Medium', False, 'North Indian'),
('Malai Kofta', 220, TRUE, 0, 'Veg', 1, 'Low', False, 'North Indian'),
('Aloo Paratha', 100, TRUE, 0, 'Veg', 1, 'Low', False, 'North Indian'),
('Hyderabadi Biryani', 300, TRUE, 0, 'Non Veg', 1, 'High', False, 'South Indian'),
('Pesarattu', 70, TRUE, 0, 'Veg', 1, 'Low', False, 'South Indian'),
('Chicken Chettinad', 220, TRUE, 0, 'Non Veg', 1, 'High', False, 'South Indian'),
('Egg Curry', 150, TRUE, 0, 'Egg', 1, 'Medium', False, 'North Indian'),
('Kadhi Chawal', 130, TRUE, 0, 'Veg', 1, 'Low', False, 'North Indian'),
('Poha', 50, TRUE, 0, 'Veg', 1, 'Low', False, 'North Indian'),
('Upma', 60, TRUE, 0, 'Veg', 1, 'Low', False, 'South Indian'),
('Rava Dosa', 80, TRUE, 0, 'Veg', 1, 'Low', False, 'South Indian'),
('Bisi Bele Bath', 120, TRUE, 0, 'Veg', 1, 'Medium', False, 'South Indian'),
('Pongal', 90, TRUE, 0, 'Veg', 1, 'Low', False, 'South Indian'),
('Chicken Tikka', 200, TRUE, 0, 'Non Veg', 1, 'High', False, 'North Indian'),
('Tandoori Chicken', 250, TRUE, 0, 'Non Veg', 1, 'High', False, 'North Indian'),
('Paneer Tikka', 180, TRUE, 0, 'Veg', 1, 'Medium', False, 'North Indian'),
('Shahi Paneer', 220, TRUE, 0, 'Veg', 1, 'Low', False, 'North Indian'),
('Pav Bhaji', 100, TRUE, 0, 'Veg', 1, 'Medium', False, 'North Indian'),
('Matar Paneer', 180, TRUE, 0, 'Veg', 1, 'Low', False, 'North Indian'),
('Kadai Chicken', 220, TRUE, 0, 'Non Veg', 1, 'High', False, 'North Indian'),
('Fish Fry', 180, TRUE, 0, 'Non Veg', 1, 'High', False, 'South Indian'),
('Mutton Biryani', 350, TRUE, 0, 'Non Veg', 1, 'High', False, 'South Indian'),
('Keema Naan', 150, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'North Indian'),
('Bhindi Masala', 140, TRUE, 0, 'Veg', 1, 'Low', False, 'North Indian'),
('Baingan Bharta', 160, TRUE, 0, 'Veg', 1, 'Low', False, 'North Indian'),
('Aloo Gobi', 120, TRUE, 0, 'Veg', 1, 'Low', False, 'North Indian'),
('Gajar Ka Halwa', 100, TRUE, 0, 'Veg', 1, 'Low', True, 'North Indian'),
('Puran Poli', 80, TRUE, 0, 'Veg', 1, 'Low', True, 'South Indian'),
('Sabudana Khichdi', 70, TRUE, 0, 'Veg', 1, 'Low', False, 'South Indian'),
('Sambar', 60, TRUE, 0, 'Veg', 1, 'Medium', False, 'South Indian'),
('Rasam', 50, TRUE, 0, 'Veg', 1, 'Medium', False, 'South Indian'),
('Aloo Tikki', 40, TRUE, 0, 'Veg', 1, 'Medium', False, 'North Indian'),
('Momos', 80, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'Other'),
('Chilli Chicken', 200, TRUE, 0, 'Non Veg', 1, 'High', False, 'Other'),
('Spring Rolls', 90, TRUE, 0, 'Veg', 1, 'Medium', False, 'Other'),
('Hakka Noodles', 120, TRUE, 0, 'Veg', 1, 'Medium', False, 'Other'),
('Manchurian', 110, TRUE, 0, 'Veg', 1, 'High', False, 'Other'),
('Chowmein', 100, TRUE, 0, 'Veg', 1, 'Medium', False, 'Other'),
('Dimsum', 150, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'Other'),
('Peking Duck', 300, TRUE, 0, 'Non Veg', 1, 'High', False, 'Other'),
('Sushi', 200, TRUE, 0, 'Non Veg', 1, 'Low', False, 'Other'),
('Ramen', 180, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'Other'),
('Tempura', 170, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'Other'),
('Bibimbap', 200, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'Other'),
('Kimchi', 70, TRUE, 0, 'Veg', 1, 'High', False, 'Other'),
('Tacos', 120, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'Other'),
('Burrito', 150, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'Other'),
('Enchiladas', 160, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'Other'),
('Quesadilla', 140, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'Other'),
('Nachos', 100, TRUE, 0, 'Veg', 1, 'Medium', False, 'Other'),
('Guacamole', 90, TRUE, 0, 'Veg', 1, 'Low', False, 'Other'),
('Falafel', 100, TRUE, 0, 'Veg', 1, 'Medium', False, 'Other'),
('Hummus', 70, TRUE, 0, 'Veg', 1, 'Low', False, 'Other'),
('Shawarma', 120, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'Other'),
('Baklava', 110, TRUE, 0, 'Veg', 1, 'Low', True, 'Other'),
('Tzatziki', 60, TRUE, 0, 'Veg', 1, 'Low', False, 'Other'),
('Gyro', 130, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'Other'),
('Moussaka', 140, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'Other'),
('Pad Thai', 150, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'Other'),
('Tom Yum Soup', 100, TRUE, 0, 'Non Veg', 1, 'High', False, 'Other'),
('Green Curry', 140, TRUE, 0, 'Non Veg', 1, 'High', False, 'Other'),
('Red Curry', 140, TRUE, 0, 'Non Veg', 1, 'High', False, 'Other'),
('Satay', 110, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'Other'),
('Som Tum', 80, TRUE, 0, 'Veg', 1, 'High', False, 'Other'),
('Pho', 160, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'Other'),
('Banh Mi', 120, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'Other'),
('Laksa', 150, TRUE, 0, 'Non Veg', 1, 'High', False, 'Other'),
('Gyoza', 100, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'Other'),
('Doner Kebab', 140, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'Other'),
('Pide', 130, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'Other'),
('Dolma', 90, TRUE, 0, 'Veg', 1, 'Low', False, 'Other'),
('Khachapuri', 110, TRUE, 0, 'Veg', 1, 'Low', False, 'Other'),
('Borscht', 80, TRUE, 0, 'Veg', 1, 'Low', False, 'Other'),
('Pelmeni', 100, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'Other'),
('Ceviche', 140, TRUE, 0, 'Non Veg', 1, 'Low', False, 'Other'),
('Feijoada', 160, TRUE, 0, 'Non Veg', 1, 'High', False, 'Other'),
('Empanadas', 90, TRUE, 0, 'Non Veg', 1, 'Medium', False, 'Other'),
('Arepas', 70, TRUE, 0, 'Veg', 1, 'Medium', False, 'Other');

INSERT INTO User (user_id, user_name, password, role) VALUES 
(10, 'Ravi', 'ravi_employee', 'Employee'),
(11, 'David', 'david_employee', 'Employee'),
(12, 'Venkat', 'venkat_employee', 'Employee'),
(13, 'Harshita', 'harshita_employee', 'Employee');

INSERT INTO Notificationtype (notification_type_id, notification_type) VALUES
(1, "ADD_ITEM"),
(2, "REMOVE_ITEM"),
(3, "FOOD_AVAILABILITY_CHANGED"),
(4, "FOOD_AUDIT");

