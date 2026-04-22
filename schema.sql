USE phone_wrapped;

CREATE TABLE Category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

CREATE TABLE App (
    app_id INT PRIMARY KEY AUTO_INCREMENT,
    app_name VARCHAR(100) NOT NULL,
    category_id INT,
    platform VARCHAR(50), 
    description TEXT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id) ON DELETE CASCADE
);

CREATE TABLE Content (
    content_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content_type VARCHAR(50), 
    genre VARCHAR(50),
    app_id INT,
    release_date DATE,
    additional_info JSON,
    FOREIGN KEY (app_id) REFERENCES App(app_id) ON DELETE CASCADE
);

CREATE TABLE User (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    device_id VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Event (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    content_id INT,
    event_type VARCHAR(50), 
    duration_sec INT CHECK(duration_sec >= 0),
    event_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    device_type VARCHAR(50),
    additional_data JSON,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY (content_id) REFERENCES Content(content_id) ON DELETE CASCADE
);

CREATE TABLE Insight (
    insight_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    category_id INT,
    period_type VARCHAR(50), 
    period_start_date DATE,
    period_end_date DATE,
    summary_json JSON,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    version_number INT DEFAULT 1,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Category(category_id) ON DELETE CASCADE
);

CREATE TABLE Insight_Item (
    insight_item_id INT PRIMARY KEY AUTO_INCREMENT,
    insight_id INT,
    metric_name VARCHAR(100),
    metric_value VARCHAR(100),
    metric_unit VARCHAR(50),
    rank INT,
    FOREIGN KEY (insight_id) REFERENCES Insight(insight_id) ON DELETE CASCADE
);
