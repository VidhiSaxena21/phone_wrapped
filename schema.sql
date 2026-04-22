USE phone_wrapped;

CREATE TABLE Category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

CREATE TABLE App (
    app_id INT PRIMARY KEY AUTO_INCREMENT,
    app_name VARCHAR(100),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

CREATE TABLE Content (
    content_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    app_id INT,
    FOREIGN KEY (app_id) REFERENCES App(app_id)
);

CREATE TABLE User (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

CREATE TABLE Event (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    content_id INT,
    duration_sec INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (content_id) REFERENCES Content(content_id)
);
