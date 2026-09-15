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
  city VARCHAR(100) NULL,
  region VARCHAR(100) NULL,
  established_year SMALLINT UNSIGNED NULL,
  official_website VARCHAR(255) NULL,
  popular_field VARCHAR(120) NOT NULL,
  study_level VARCHAR(60) NOT NULL,
  is_active TINYINT(1) NOT NULL DEFAULT 1,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_university_destination FOREIGN KEY (destination_id) REFERENCES destinations(id)
);

ALTER TABLE universities
  ADD COLUMN IF NOT EXISTS city VARCHAR(100) NULL AFTER name,
  ADD COLUMN IF NOT EXISTS region VARCHAR(100) NULL AFTER city,
  ADD COLUMN IF NOT EXISTS established_year SMALLINT UNSIGNED NULL AFTER region,
  ADD COLUMN IF NOT EXISTS official_website VARCHAR(255) NULL AFTER established_year;

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

INSERT IGNORE INTO universities (destination_id, name, city, region, established_year, official_website, popular_field, study_level)
SELECT d.id, seed.name, seed.city, seed.region, seed.established_year, seed.official_website, seed.popular_field, seed.study_level
FROM destinations d
JOIN (
  SELECT 'United Kingdom' AS destination, 'University of Oxford' AS name, 'Oxford' AS city, 'England' AS region, 1096 AS established_year, 'https://www.ox.ac.uk/' AS official_website, 'Computer Science' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Canada', 'University of Toronto', 'Toronto', 'Ontario', 1827, 'https://www.utoronto.ca/', 'Business Analytics', 'Postgraduate'
  UNION ALL SELECT 'Australia', 'University of Melbourne', 'Melbourne', 'Victoria', 1853, 'https://www.unimelb.edu.au/', 'Engineering', 'Undergraduate'
  UNION ALL SELECT 'United States', 'Harvard University', 'Cambridge', 'Massachusetts', 1636, 'https://www.harvard.edu/', 'Business Analytics', 'Postgraduate'
  UNION ALL SELECT 'Germany', 'Technical University of Munich', 'Munich', 'Bavaria', 1868, 'https://www.tum.de/', 'Mechanical Engineering', 'Undergraduate'
  UNION ALL SELECT 'Malaysia', 'University of Malaya', 'Kuala Lumpur', 'Kuala Lumpur', 1949, 'https://www.um.edu.my/', 'Computer Science', 'Undergraduate'
) seed ON seed.destination = d.name;

INSERT IGNORE INTO programs (university_id, title, subject, study_level)
SELECT u.id, CONCAT(u.popular_field, ' pathway'), u.popular_field, u.study_level
FROM universities u;
