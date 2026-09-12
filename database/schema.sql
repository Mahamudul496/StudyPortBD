CREATE DATABASE IF NOT EXISTS studyportbd CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE studyportbd;

CREATE TABLE IF NOT EXISTS destinations (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  slug VARCHAR(100) NOT NULL UNIQUE,
  description VARCHAR(255) NOT NULL,
  is_active TINYINT(1) NOT NULL DEFAULT 1,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS universities (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  destination_id INT UNSIGNED NOT NULL,
  name VARCHAR(180) NOT NULL,
  popular_field VARCHAR(120) NOT NULL,
  study_level VARCHAR(60) NOT NULL,
  is_active TINYINT(1) NOT NULL DEFAULT 1,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_university_destination FOREIGN KEY (destination_id) REFERENCES destinations(id)
);

CREATE TABLE IF NOT EXISTS programs (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  university_id INT UNSIGNED NOT NULL,
  title VARCHAR(180) NOT NULL,
  subject VARCHAR(120) NOT NULL,
  study_level VARCHAR(60) NOT NULL,
  is_active TINYINT(1) NOT NULL DEFAULT 1,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_program_university FOREIGN KEY (university_id) REFERENCES universities(id)
);

CREATE TABLE IF NOT EXISTS users (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(150) NOT NULL,
  email VARCHAR(190) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  phone VARCHAR(30) NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS consultation_requests (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  full_name VARCHAR(150) NOT NULL,
  phone VARCHAR(30) NOT NULL,
  email VARCHAR(190) NOT NULL,
  message TEXT NOT NULL,
  status ENUM('new', 'contacted', 'closed') NOT NULL DEFAULT 'new',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT IGNORE INTO destinations (name, slug, description) VALUES
('United Kingdom', 'united-kingdom', 'World-class education and globally recognised degrees.'),
('Canada', 'canada', 'Quality education in a welcoming multicultural environment.'),
('Australia', 'australia', 'Leading universities and diverse study opportunities.'),
('United States', 'united-states', 'Flexible programs and a wide range of institutions.'),
('Germany', 'germany', 'Strong academic reputation and technical programs.'),
('Malaysia', 'malaysia', 'Affordable international education closer to home.');

INSERT IGNORE INTO universities (destination_id, name, popular_field, study_level)
SELECT d.id, seed.name, seed.popular_field, seed.study_level
FROM destinations d
JOIN (
  SELECT 'United Kingdom' AS destination, 'University Profile UK' AS name, 'Computer Science' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Canada', 'University Profile Canada', 'Business Analytics', 'Postgraduate'
  UNION ALL SELECT 'Australia', 'University Profile Australia', 'Engineering', 'Undergraduate'
  UNION ALL SELECT 'Germany', 'University Profile Germany', 'Mechanical Engineering', 'Undergraduate'
) seed ON seed.destination = d.name;

INSERT IGNORE INTO programs (university_id, title, subject, study_level)
SELECT u.id, CONCAT(u.popular_field, ' pathway'), u.popular_field, u.study_level
FROM universities u;
