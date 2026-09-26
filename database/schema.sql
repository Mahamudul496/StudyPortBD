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
  CONSTRAINT fk_university_destination FOREIGN KEY (destination_id) REFERENCES destinations(id),
  UNIQUE KEY uniq_university_name (name)
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
  CONSTRAINT fk_program_university FOREIGN KEY (university_id) REFERENCES universities(id),
  UNIQUE KEY uniq_program_per_university (university_id, title)
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


-- Real university names, matching the lists shown on each destination page
-- (universities/uk.php, canada.php, australia.php, usa.php, germany.php, malaysia.php),
-- so the homepage program search returns authentic, consistent results.
INSERT IGNORE INTO universities (destination_id, name, city, region, established_year, official_website, popular_field, study_level)
SELECT d.id, seed.name, seed.city, seed.region, seed.established_year, seed.official_website, seed.popular_field, seed.study_level
FROM destinations d
JOIN (
  SELECT 'United Kingdom' AS destination, 'University of Aberdeen' AS name, 'Aberdeen' AS city, 'Scotland' AS region, 1495 AS established_year, 'https://www.abdn.ac.uk/' AS official_website, 'Computer Science' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'Abertay University' AS name, 'Dundee' AS city, 'Scotland' AS region, 1888 AS established_year, 'https://www.abertay.ac.uk/' AS official_website, 'Business Analytics' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'Aberystwyth University' AS name, 'Aberystwyth' AS city, 'Wales' AS region, 1872 AS established_year, 'https://www.aber.ac.uk/' AS official_website, 'Business' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'Anglia Ruskin University' AS name, 'Cambridge' AS city, 'England' AS region, 1858 AS established_year, 'https://www.aru.ac.uk/' AS official_website, 'Engineering' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'Aston University' AS name, 'Birmingham' AS city, 'England' AS region, 1895 AS established_year, 'https://www.aston.ac.uk/' AS official_website, 'Health Sciences' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of Bath' AS name, 'Bath' AS city, 'England' AS region, 1886 AS established_year, 'https://www.bath.ac.uk/' AS official_website, 'Computer Science' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of Birmingham' AS name, 'Birmingham' AS city, 'England' AS region, 1825 AS established_year, 'https://www.birmingham.ac.uk/' AS official_website, 'Business Analytics' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'Birmingham City University' AS name, 'Birmingham' AS city, 'England' AS region, 1843 AS established_year, 'https://www.bcu.ac.uk/' AS official_website, 'Business' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'Bournemouth University' AS name, 'Bournemouth' AS city, 'England' AS region, 1992 AS established_year, 'https://www.bournemouth.ac.uk/' AS official_website, 'Engineering' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of Bradford' AS name, 'Bradford' AS city, 'England' AS region, 1832 AS established_year, 'https://www.bradford.ac.uk/' AS official_website, 'Health Sciences' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of Bristol' AS name, 'Bristol' AS city, 'England' AS region, 1595 AS established_year, 'https://www.bristol.ac.uk/' AS official_website, 'Computer Science' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'Brunel University London' AS name, 'London' AS city, 'England' AS region, 1798 AS established_year, 'https://www.brunel.ac.uk/' AS official_website, 'Business Analytics' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of Cambridge' AS name, 'Cambridge' AS city, 'England' AS region, 1209 AS established_year, 'https://www.cam.ac.uk/' AS official_website, 'Business' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'Cardiff University' AS name, 'Cardiff' AS city, 'Wales' AS region, 1883 AS established_year, 'https://www.cardiff.ac.uk/' AS official_website, 'Engineering' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'Coventry University' AS name, 'Coventry' AS city, 'England' AS region, 1970 AS established_year, 'https://www.coventry.ac.uk/' AS official_website, 'Health Sciences' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'Cranfield University' AS name, 'Cranfield' AS city, 'England' AS region, 1946 AS established_year, 'https://www.cranfield.ac.uk/' AS official_website, 'Computer Science' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'Durham University' AS name, 'Durham' AS city, 'England' AS region, 1832 AS established_year, 'https://www.durham.ac.uk/' AS official_website, 'Business Analytics' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of Edinburgh' AS name, 'Edinburgh' AS city, 'Scotland' AS region, 1583 AS established_year, 'https://www.ed.ac.uk/' AS official_website, 'Business' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of Exeter' AS name, 'Exeter' AS city, 'England' AS region, 1855 AS established_year, 'https://www.exeter.ac.uk/' AS official_website, 'Engineering' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of Glasgow' AS name, 'Glasgow' AS city, 'Scotland' AS region, 1451 AS established_year, 'https://www.gla.ac.uk/' AS official_website, 'Health Sciences' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'Heriot-Watt University' AS name, 'Edinburgh' AS city, 'Scotland' AS region, 1821 AS established_year, 'https://www.hw.ac.uk/' AS official_website, 'Computer Science' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'Imperial College London' AS name, 'London' AS city, 'England' AS region, 1907 AS established_year, 'https://www.imperial.ac.uk/' AS official_website, 'Business Analytics' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'King''s College London' AS name, 'London' AS city, 'England' AS region, 1829 AS established_year, 'https://www.kcl.ac.uk/' AS official_website, 'Business' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'Lancaster University' AS name, 'Lancaster' AS city, 'England' AS region, 1964 AS established_year, 'https://www.lancaster.ac.uk/' AS official_website, 'Engineering' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of Leeds' AS name, 'Leeds' AS city, 'England' AS region, 1904 AS established_year, 'https://www.leeds.ac.uk/' AS official_website, 'Health Sciences' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of Leicester' AS name, 'Leicester' AS city, 'England' AS region, 1921 AS established_year, 'https://le.ac.uk/' AS official_website, 'Computer Science' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of Liverpool' AS name, 'Liverpool' AS city, 'England' AS region, 1881 AS established_year, 'https://www.liverpool.ac.uk/' AS official_website, 'Business Analytics' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'London School of Economics' AS name, 'London' AS city, 'England' AS region, 1895 AS established_year, 'https://www.lse.ac.uk/' AS official_website, 'Business' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'Loughborough University' AS name, 'Loughborough' AS city, 'England' AS region, 1909 AS established_year, 'https://www.lboro.ac.uk/' AS official_website, 'Engineering' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of Manchester' AS name, 'Manchester' AS city, 'England' AS region, 1824 AS established_year, 'https://www.manchester.ac.uk/' AS official_website, 'Health Sciences' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'Newcastle University' AS name, 'Newcastle' AS city, 'England' AS region, 1963 AS established_year, 'https://www.ncl.ac.uk/' AS official_website, 'Computer Science' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of Nottingham' AS name, 'Nottingham' AS city, 'England' AS region, 1881 AS established_year, 'https://www.nottingham.ac.uk/' AS official_website, 'Business Analytics' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of Oxford' AS name, 'Oxford' AS city, 'England' AS region, 1096 AS established_year, 'https://www.ox.ac.uk/' AS official_website, 'Business' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of Portsmouth' AS name, 'Portsmouth' AS city, 'England' AS region, 1908 AS established_year, 'https://www.port.ac.uk/' AS official_website, 'Engineering' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'Queen Mary University of London' AS name, 'London' AS city, 'England' AS region, 1785 AS established_year, 'https://www.qmul.ac.uk/' AS official_website, 'Health Sciences' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'Queen''s University Belfast' AS name, 'Belfast' AS city, 'Northern Ireland' AS region, 1845 AS established_year, 'https://www.qub.ac.uk/' AS official_website, 'Computer Science' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of Reading' AS name, 'Reading' AS city, 'England' AS region, 1892 AS established_year, 'https://www.reading.ac.uk/' AS official_website, 'Business Analytics' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of Sheffield' AS name, 'Sheffield' AS city, 'England' AS region, 1905 AS established_year, 'https://www.sheffield.ac.uk/' AS official_website, 'Business' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of Southampton' AS name, 'Southampton' AS city, 'England' AS region, 1862 AS established_year, 'https://www.southampton.ac.uk/' AS official_website, 'Engineering' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of St Andrews' AS name, 'St Andrews' AS city, 'Scotland' AS region, 1413 AS established_year, 'https://www.st-andrews.ac.uk/' AS official_website, 'Health Sciences' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of Strathclyde' AS name, 'Glasgow' AS city, 'Scotland' AS region, 1796 AS established_year, 'https://www.strath.ac.uk/' AS official_website, 'Computer Science' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of Surrey' AS name, 'Guildford' AS city, 'England' AS region, 1966 AS established_year, 'https://www.surrey.ac.uk/' AS official_website, 'Business Analytics' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of Sussex' AS name, 'Brighton' AS city, 'England' AS region, 1961 AS established_year, 'https://www.sussex.ac.uk/' AS official_website, 'Business' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'Swansea University' AS name, 'Swansea' AS city, 'Wales' AS region, 1920 AS established_year, 'https://www.swansea.ac.uk/' AS official_website, 'Engineering' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'Ulster University' AS name, 'Belfast' AS city, 'Northern Ireland' AS region, 1968 AS established_year, 'https://www.ulster.ac.uk/' AS official_website, 'Health Sciences' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University College London' AS name, 'London' AS city, 'England' AS region, 1826 AS established_year, 'https://www.ucl.ac.uk/' AS official_website, 'Computer Science' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of Warwick' AS name, 'Coventry' AS city, 'England' AS region, 1965 AS established_year, 'https://warwick.ac.uk/' AS official_website, 'Business Analytics' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United Kingdom' AS destination, 'University of York' AS name, 'York' AS city, 'England' AS region, 1963 AS established_year, 'https://www.york.ac.uk/' AS official_website, 'Business' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Canada' AS destination, 'University of Alberta' AS name, 'Edmonton' AS city, 'Alberta' AS region, 1908 AS established_year, 'https://www.ualberta.ca/' AS official_website, 'Engineering' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Canada' AS destination, 'University of Calgary' AS name, 'Calgary' AS city, 'Alberta' AS region, 1966 AS established_year, 'https://ucalgary.ca/' AS official_website, 'Health Sciences' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Canada' AS destination, 'University of British Columbia' AS name, 'Vancouver' AS city, 'British Columbia' AS region, 1908 AS established_year, 'https://www.ubc.ca/' AS official_website, 'Computer Science' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Canada' AS destination, 'Simon Fraser University' AS name, 'Burnaby' AS city, 'British Columbia' AS region, 1965 AS established_year, 'https://www.sfu.ca/' AS official_website, 'Business Analytics' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Canada' AS destination, 'University of Victoria' AS name, 'Victoria' AS city, 'British Columbia' AS region, 1963 AS established_year, 'https://www.uvic.ca/' AS official_website, 'Business' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Canada' AS destination, 'University of Manitoba' AS name, 'Winnipeg' AS city, 'Manitoba' AS region, 1877 AS established_year, 'https://umanitoba.ca/' AS official_website, 'Engineering' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Canada' AS destination, 'McGill University' AS name, 'Montreal' AS city, 'Quebec' AS region, 1821 AS established_year, 'https://www.mcgill.ca/' AS official_website, 'Health Sciences' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Canada' AS destination, 'Université de Montréal' AS name, 'Montreal' AS city, 'Quebec' AS region, 1878 AS established_year, 'https://umontreal.ca/' AS official_website, 'Computer Science' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Canada' AS destination, 'Dalhousie University' AS name, 'Halifax' AS city, 'Nova Scotia' AS region, 1818 AS established_year, 'https://www.dal.ca/' AS official_website, 'Business Analytics' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Canada' AS destination, 'University of Ottawa' AS name, 'Ottawa' AS city, 'Ontario' AS region, 1848 AS established_year, 'https://www.uottawa.ca/' AS official_website, 'Business' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Canada' AS destination, 'Queen’s University' AS name, 'Kingston' AS city, 'Ontario' AS region, 1841 AS established_year, 'https://www.queensu.ca/' AS official_website, 'Engineering' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Canada' AS destination, 'Toronto Metropolitan University' AS name, 'Toronto' AS city, 'Ontario' AS region, 1948 AS established_year, 'https://www.torontomu.ca/' AS official_website, 'Health Sciences' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Canada' AS destination, 'University of Toronto' AS name, 'Toronto' AS city, 'Ontario' AS region, 1827 AS established_year, 'https://www.utoronto.ca/' AS official_website, 'Computer Science' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Canada' AS destination, 'University of Waterloo' AS name, 'Waterloo' AS city, 'Ontario' AS region, 1957 AS established_year, 'https://uwaterloo.ca/' AS official_website, 'Business Analytics' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Canada' AS destination, 'Western University' AS name, 'London' AS city, 'Ontario' AS region, 1878 AS established_year, 'https://www.uwo.ca/' AS official_website, 'Business' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Australia' AS destination, 'Australian National University' AS name, 'Canberra' AS city, 'Australian Capital Territory' AS region, 1946 AS established_year, 'https://www.anu.edu.au/' AS official_website, 'Engineering' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Australia' AS destination, 'University of Canberra' AS name, 'Canberra' AS city, 'Australian Capital Territory' AS region, 1990 AS established_year, 'https://www.canberra.edu.au/' AS official_website, 'Health Sciences' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Australia' AS destination, 'University of Melbourne' AS name, 'Melbourne' AS city, 'Victoria' AS region, 1853 AS established_year, 'https://www.unimelb.edu.au/' AS official_website, 'Computer Science' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Australia' AS destination, 'Monash University' AS name, 'Melbourne' AS city, 'Victoria' AS region, 1958 AS established_year, 'https://www.monash.edu/' AS official_website, 'Business Analytics' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Australia' AS destination, 'RMIT University' AS name, 'Melbourne' AS city, 'Victoria' AS region, 1887 AS established_year, 'https://www.rmit.edu.au/' AS official_website, 'Business' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Australia' AS destination, 'Deakin University' AS name, 'Geelong' AS city, 'Victoria' AS region, 1974 AS established_year, 'https://www.deakin.edu.au/' AS official_website, 'Engineering' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Australia' AS destination, 'University of Sydney' AS name, 'Sydney' AS city, 'New South Wales' AS region, 1850 AS established_year, 'https://www.sydney.edu.au/' AS official_website, 'Health Sciences' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Australia' AS destination, 'University of New South Wales' AS name, 'Sydney' AS city, 'New South Wales' AS region, 1949 AS established_year, 'https://www.unsw.edu.au/' AS official_website, 'Computer Science' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Australia' AS destination, 'University of Technology Sydney' AS name, 'Sydney' AS city, 'New South Wales' AS region, 1988 AS established_year, 'https://www.uts.edu.au/' AS official_website, 'Business Analytics' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Australia' AS destination, 'Macquarie University' AS name, 'Sydney' AS city, 'New South Wales' AS region, 1964 AS established_year, 'https://www.mq.edu.au/' AS official_website, 'Business' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Australia' AS destination, 'University of Queensland' AS name, 'Brisbane' AS city, 'Queensland' AS region, 1909 AS established_year, 'https://www.uq.edu.au/' AS official_website, 'Engineering' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Australia' AS destination, 'Queensland University of Technology' AS name, 'Brisbane' AS city, 'Queensland' AS region, 1989 AS established_year, 'https://www.qut.edu.au/' AS official_website, 'Health Sciences' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Australia' AS destination, 'University of Adelaide' AS name, 'Adelaide' AS city, 'South Australia' AS region, 1874 AS established_year, 'https://www.adelaide.edu.au/' AS official_website, 'Computer Science' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Australia' AS destination, 'University of Western Australia' AS name, 'Perth' AS city, 'Western Australia' AS region, 1911 AS established_year, 'https://www.uwa.edu.au/' AS official_website, 'Business Analytics' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Australia' AS destination, 'Curtin University' AS name, 'Perth' AS city, 'Western Australia' AS region, 1966 AS established_year, 'https://www.curtin.edu.au/' AS official_website, 'Business' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United States' AS destination, 'California Institute of Technology' AS name, 'Pasadena' AS city, 'California' AS region, 1891 AS established_year, 'https://www.caltech.edu/' AS official_website, 'Engineering' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United States' AS destination, 'Stanford University' AS name, 'Stanford' AS city, 'California' AS region, 1885 AS established_year, 'https://www.stanford.edu/' AS official_website, 'Health Sciences' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United States' AS destination, 'University of California, Berkeley' AS name, 'Berkeley' AS city, 'California' AS region, 1868 AS established_year, 'https://www.berkeley.edu/' AS official_website, 'Computer Science' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United States' AS destination, 'University of California, Los Angeles' AS name, 'Los Angeles' AS city, 'California' AS region, 1919 AS established_year, 'https://www.ucla.edu/' AS official_website, 'Business Analytics' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United States' AS destination, 'Harvard University' AS name, 'Cambridge' AS city, 'Massachusetts' AS region, 1636 AS established_year, 'https://www.harvard.edu/' AS official_website, 'Business' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United States' AS destination, 'Massachusetts Institute of Technology' AS name, 'Cambridge' AS city, 'Massachusetts' AS region, 1861 AS established_year, 'https://www.mit.edu/' AS official_website, 'Engineering' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United States' AS destination, 'University of Michigan' AS name, 'Ann Arbor' AS city, 'Michigan' AS region, 1817 AS established_year, 'https://umich.edu/' AS official_website, 'Health Sciences' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United States' AS destination, 'Columbia University' AS name, 'New York' AS city, 'New York' AS region, 1754 AS established_year, 'https://www.columbia.edu/' AS official_website, 'Computer Science' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United States' AS destination, 'New York University' AS name, 'New York' AS city, 'New York' AS region, 1831 AS established_year, 'https://www.nyu.edu/' AS official_website, 'Business Analytics' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United States' AS destination, 'University of Pennsylvania' AS name, 'Philadelphia' AS city, 'Pennsylvania' AS region, 1740 AS established_year, 'https://www.upenn.edu/' AS official_website, 'Business' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'United States' AS destination, 'University of Chicago' AS name, 'Chicago' AS city, 'Illinois' AS region, 1890 AS established_year, 'https://www.uchicago.edu/' AS official_website, 'Engineering' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'United States' AS destination, 'Princeton University' AS name, 'Princeton' AS city, 'New Jersey' AS region, 1746 AS established_year, 'https://www.princeton.edu/' AS official_website, 'Health Sciences' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Germany' AS destination, 'Freie Universität Berlin' AS name, 'Berlin' AS city, 'Berlin' AS region, 1948 AS established_year, 'https://www.fu-berlin.de/' AS official_website, 'Computer Science' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Germany' AS destination, 'Humboldt University of Berlin' AS name, 'Berlin' AS city, 'Berlin' AS region, 1810 AS established_year, 'https://www.hu-berlin.de/' AS official_website, 'Business Analytics' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Germany' AS destination, 'Technical University of Munich' AS name, 'Munich' AS city, 'Bavaria' AS region, 1868 AS established_year, 'https://www.tum.de/' AS official_website, 'Business' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Germany' AS destination, 'Ludwig Maximilian University of Munich' AS name, 'Munich' AS city, 'Bavaria' AS region, 1472 AS established_year, 'https://www.lmu.de/' AS official_website, 'Engineering' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Germany' AS destination, 'Goethe University Frankfurt' AS name, 'Frankfurt' AS city, 'Hesse' AS region, 1914 AS established_year, 'https://www.goethe-university-frankfurt.de/' AS official_website, 'Health Sciences' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Germany' AS destination, 'RWTH Aachen University' AS name, 'Aachen' AS city, 'North Rhine-Westphalia' AS region, 1870 AS established_year, 'https://www.rwth-aachen.de/' AS official_website, 'Computer Science' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Germany' AS destination, 'University of Bonn' AS name, 'Bonn' AS city, 'North Rhine-Westphalia' AS region, 1818 AS established_year, 'https://www.uni-bonn.de/' AS official_website, 'Business Analytics' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Germany' AS destination, 'University of Cologne' AS name, 'Cologne' AS city, 'North Rhine-Westphalia' AS region, 1388 AS established_year, 'https://www.uni-koeln.de/' AS official_website, 'Business' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Germany' AS destination, 'Heidelberg University' AS name, 'Heidelberg' AS city, 'Baden-Württemberg' AS region, 1386 AS established_year, 'https://www.uni-heidelberg.de/' AS official_website, 'Engineering' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Germany' AS destination, 'University of Freiburg' AS name, 'Freiburg' AS city, 'Baden-Württemberg' AS region, 1457 AS established_year, 'https://www.uni-freiburg.de/' AS official_website, 'Health Sciences' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Germany' AS destination, 'TU Dresden' AS name, 'Dresden' AS city, 'Saxony' AS region, 1828 AS established_year, 'https://tu-dresden.de/' AS official_website, 'Computer Science' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Germany' AS destination, 'University of Stuttgart' AS name, 'Stuttgart' AS city, 'Baden-Württemberg' AS region, 1829 AS established_year, 'https://www.uni-stuttgart.de/' AS official_website, 'Business Analytics' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Malaysia' AS destination, 'Universiti Teknologi Malaysia' AS name, 'Johor Bahru' AS city, 'Johor' AS region, 1972 AS established_year, 'https://www.utm.my/' AS official_website, 'Business' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Malaysia' AS destination, 'University of Malaya' AS name, 'Kuala Lumpur' AS city, 'Kuala Lumpur' AS region, 1949 AS established_year, 'https://www.um.edu.my/' AS official_website, 'Engineering' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Malaysia' AS destination, 'Universiti Kebangsaan Malaysia' AS name, 'Bangi' AS city, 'Selangor' AS region, 1970 AS established_year, 'https://www.ukm.my/' AS official_website, 'Health Sciences' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Malaysia' AS destination, 'Universiti Putra Malaysia' AS name, 'Serdang' AS city, 'Selangor' AS region, 1971 AS established_year, 'https://upm.edu.my/' AS official_website, 'Computer Science' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Malaysia' AS destination, 'Universiti Sains Malaysia' AS name, 'George Town' AS city, 'Penang' AS region, 1969 AS established_year, 'https://www.usm.my/' AS official_website, 'Business Analytics' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Malaysia' AS destination, 'Universiti Teknologi MARA' AS name, 'Shah Alam' AS city, 'Selangor' AS region, 1956 AS established_year, 'https://uitm.edu.my/' AS official_website, 'Business' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Malaysia' AS destination, 'International Islamic University Malaysia' AS name, 'Gombak' AS city, 'Selangor' AS region, 1983 AS established_year, 'https://www.iium.edu.my/' AS official_website, 'Engineering' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Malaysia' AS destination, 'Taylor’s University' AS name, 'Subang Jaya' AS city, 'Selangor' AS region, 1969 AS established_year, 'https://university.taylors.edu.my/' AS official_website, 'Health Sciences' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Malaysia' AS destination, 'Sunway University' AS name, 'Subang Jaya' AS city, 'Selangor' AS region, 2004 AS established_year, 'https://sunway.edu.my/' AS official_website, 'Computer Science' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Malaysia' AS destination, 'Universiti Malaysia Sarawak' AS name, 'Kota Samarahan' AS city, 'Sarawak' AS region, 1992 AS established_year, 'https://www.unimas.my/' AS official_website, 'Business Analytics' AS popular_field, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Malaysia' AS destination, 'Multimedia University' AS name, 'Cyberjaya' AS city, 'Selangor' AS region, 1996 AS established_year, 'https://www.mmu.edu.my/' AS official_website, 'Business' AS popular_field, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Malaysia' AS destination, 'UCSI University' AS name, 'Kuala Lumpur' AS city, 'Kuala Lumpur' AS region, 1986 AS established_year, 'https://www.ucsiuniversity.edu.my/' AS official_website, 'Engineering' AS popular_field, 'Postgraduate' AS study_level
) seed ON seed.destination = d.name;

-- Two or more sample programs per university, covering the subject/level
-- filters offered in the homepage search form.
INSERT IGNORE INTO programs (university_id, title, subject, study_level)
SELECT u.id, seed.title, seed.subject, seed.study_level
FROM universities u
JOIN (
  SELECT 'University of Aberdeen' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Aberdeen' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Aberdeen' AS university, 'Business Analytics (Foundation)' AS title, 'Business Analytics' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'University of Aberdeen' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'Abertay University' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Abertay University' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Aberystwyth University' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Aberystwyth University' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Anglia Ruskin University' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Anglia Ruskin University' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Aston University' AS university, 'Health Sciences (Undergraduate)' AS title, 'Health Sciences' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Aston University' AS university, 'Business Analytics (Postgraduate)' AS title, 'Business Analytics' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Aston University' AS university, 'Computer Science (Foundation)' AS title, 'Computer Science' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'University of Bath' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Bath' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Bath' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'University of Birmingham' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Birmingham' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Birmingham City University' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Birmingham City University' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Bournemouth University' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Bournemouth University' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Bournemouth University' AS university, 'Health Sciences (Foundation)' AS title, 'Health Sciences' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'University of Bradford' AS university, 'Health Sciences (Undergraduate)' AS title, 'Health Sciences' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Bradford' AS university, 'Business Analytics (Postgraduate)' AS title, 'Business Analytics' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Bristol' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Bristol' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Bristol' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'Brunel University London' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Brunel University London' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Cambridge' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Cambridge' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Cambridge' AS university, 'Engineering (Foundation)' AS title, 'Engineering' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'Cardiff University' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Cardiff University' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Coventry University' AS university, 'Health Sciences (Undergraduate)' AS title, 'Health Sciences' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Coventry University' AS university, 'Business Analytics (Postgraduate)' AS title, 'Business Analytics' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Cranfield University' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Cranfield University' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Cranfield University' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'Durham University' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Durham University' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Durham University' AS university, 'Business (Foundation)' AS title, 'Business' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'University of Edinburgh' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Edinburgh' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Exeter' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Exeter' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Glasgow' AS university, 'Health Sciences (Undergraduate)' AS title, 'Health Sciences' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Glasgow' AS university, 'Business Analytics (Postgraduate)' AS title, 'Business Analytics' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Heriot-Watt University' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Heriot-Watt University' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Heriot-Watt University' AS university, 'Business Analytics (Foundation)' AS title, 'Business Analytics' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'Heriot-Watt University' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'Imperial College London' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Imperial College London' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'King''s College London' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'King''s College London' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Lancaster University' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Lancaster University' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Leeds' AS university, 'Health Sciences (Undergraduate)' AS title, 'Health Sciences' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Leeds' AS university, 'Business Analytics (Postgraduate)' AS title, 'Business Analytics' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Leeds' AS university, 'Computer Science (Foundation)' AS title, 'Computer Science' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'University of Leicester' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Leicester' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Leicester' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'University of Liverpool' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Liverpool' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'London School of Economics' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'London School of Economics' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Loughborough University' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Loughborough University' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Loughborough University' AS university, 'Health Sciences (Foundation)' AS title, 'Health Sciences' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'University of Manchester' AS university, 'Health Sciences (Undergraduate)' AS title, 'Health Sciences' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Manchester' AS university, 'Business Analytics (Postgraduate)' AS title, 'Business Analytics' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Newcastle University' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Newcastle University' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Newcastle University' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'University of Nottingham' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Nottingham' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Oxford' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Oxford' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Oxford' AS university, 'Engineering (Foundation)' AS title, 'Engineering' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'University of Portsmouth' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Portsmouth' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Queen Mary University of London' AS university, 'Health Sciences (Undergraduate)' AS title, 'Health Sciences' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Queen Mary University of London' AS university, 'Business Analytics (Postgraduate)' AS title, 'Business Analytics' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Queen''s University Belfast' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Queen''s University Belfast' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Queen''s University Belfast' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'University of Reading' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Reading' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Reading' AS university, 'Business (Foundation)' AS title, 'Business' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'University of Sheffield' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Sheffield' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Southampton' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Southampton' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of St Andrews' AS university, 'Health Sciences (Undergraduate)' AS title, 'Health Sciences' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of St Andrews' AS university, 'Business Analytics (Postgraduate)' AS title, 'Business Analytics' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Strathclyde' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Strathclyde' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Strathclyde' AS university, 'Business Analytics (Foundation)' AS title, 'Business Analytics' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'University of Strathclyde' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'University of Surrey' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Surrey' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Sussex' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Sussex' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Swansea University' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Swansea University' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Ulster University' AS university, 'Health Sciences (Undergraduate)' AS title, 'Health Sciences' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Ulster University' AS university, 'Business Analytics (Postgraduate)' AS title, 'Business Analytics' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Ulster University' AS university, 'Computer Science (Foundation)' AS title, 'Computer Science' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'University College London' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University College London' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University College London' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'University of Warwick' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Warwick' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of York' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of York' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Alberta' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Alberta' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Alberta' AS university, 'Health Sciences (Foundation)' AS title, 'Health Sciences' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'University of Calgary' AS university, 'Health Sciences (Undergraduate)' AS title, 'Health Sciences' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Calgary' AS university, 'Business Analytics (Postgraduate)' AS title, 'Business Analytics' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of British Columbia' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of British Columbia' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of British Columbia' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'Simon Fraser University' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Simon Fraser University' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Victoria' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Victoria' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Victoria' AS university, 'Engineering (Foundation)' AS title, 'Engineering' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'University of Manitoba' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Manitoba' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'McGill University' AS university, 'Health Sciences (Undergraduate)' AS title, 'Health Sciences' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'McGill University' AS university, 'Business Analytics (Postgraduate)' AS title, 'Business Analytics' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Université de Montréal' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Université de Montréal' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Université de Montréal' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'Dalhousie University' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Dalhousie University' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Dalhousie University' AS university, 'Business (Foundation)' AS title, 'Business' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'University of Ottawa' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Ottawa' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Queen’s University' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Queen’s University' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Toronto Metropolitan University' AS university, 'Health Sciences (Undergraduate)' AS title, 'Health Sciences' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Toronto Metropolitan University' AS university, 'Business Analytics (Postgraduate)' AS title, 'Business Analytics' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Toronto' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Toronto' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Toronto' AS university, 'Business Analytics (Foundation)' AS title, 'Business Analytics' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'University of Toronto' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'University of Waterloo' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Waterloo' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Western University' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Western University' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Australian National University' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Australian National University' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Canberra' AS university, 'Health Sciences (Undergraduate)' AS title, 'Health Sciences' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Canberra' AS university, 'Business Analytics (Postgraduate)' AS title, 'Business Analytics' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Canberra' AS university, 'Computer Science (Foundation)' AS title, 'Computer Science' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'University of Melbourne' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Melbourne' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Melbourne' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'Monash University' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Monash University' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'RMIT University' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'RMIT University' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Deakin University' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Deakin University' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Deakin University' AS university, 'Health Sciences (Foundation)' AS title, 'Health Sciences' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'University of Sydney' AS university, 'Health Sciences (Undergraduate)' AS title, 'Health Sciences' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Sydney' AS university, 'Business Analytics (Postgraduate)' AS title, 'Business Analytics' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of New South Wales' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of New South Wales' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of New South Wales' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'University of Technology Sydney' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Technology Sydney' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Macquarie University' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Macquarie University' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Macquarie University' AS university, 'Engineering (Foundation)' AS title, 'Engineering' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'University of Queensland' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Queensland' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Queensland University of Technology' AS university, 'Health Sciences (Undergraduate)' AS title, 'Health Sciences' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Queensland University of Technology' AS university, 'Business Analytics (Postgraduate)' AS title, 'Business Analytics' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Adelaide' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Adelaide' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Adelaide' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'University of Western Australia' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Western Australia' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Western Australia' AS university, 'Business (Foundation)' AS title, 'Business' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'Curtin University' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Curtin University' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'California Institute of Technology' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'California Institute of Technology' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Stanford University' AS university, 'Health Sciences (Undergraduate)' AS title, 'Health Sciences' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Stanford University' AS university, 'Business Analytics (Postgraduate)' AS title, 'Business Analytics' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of California, Berkeley' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of California, Berkeley' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of California, Berkeley' AS university, 'Business Analytics (Foundation)' AS title, 'Business Analytics' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'University of California, Berkeley' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'University of California, Los Angeles' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of California, Los Angeles' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Harvard University' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Harvard University' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Massachusetts Institute of Technology' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Massachusetts Institute of Technology' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Michigan' AS university, 'Health Sciences (Undergraduate)' AS title, 'Health Sciences' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Michigan' AS university, 'Business Analytics (Postgraduate)' AS title, 'Business Analytics' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Michigan' AS university, 'Computer Science (Foundation)' AS title, 'Computer Science' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'Columbia University' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Columbia University' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Columbia University' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'New York University' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'New York University' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Pennsylvania' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Pennsylvania' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Chicago' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Chicago' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Chicago' AS university, 'Health Sciences (Foundation)' AS title, 'Health Sciences' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'Princeton University' AS university, 'Health Sciences (Undergraduate)' AS title, 'Health Sciences' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Princeton University' AS university, 'Business Analytics (Postgraduate)' AS title, 'Business Analytics' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Freie Universität Berlin' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Freie Universität Berlin' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Freie Universität Berlin' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'Humboldt University of Berlin' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Humboldt University of Berlin' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Technical University of Munich' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Technical University of Munich' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Technical University of Munich' AS university, 'Engineering (Foundation)' AS title, 'Engineering' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'Ludwig Maximilian University of Munich' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Ludwig Maximilian University of Munich' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Goethe University Frankfurt' AS university, 'Health Sciences (Undergraduate)' AS title, 'Health Sciences' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Goethe University Frankfurt' AS university, 'Business Analytics (Postgraduate)' AS title, 'Business Analytics' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'RWTH Aachen University' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'RWTH Aachen University' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'RWTH Aachen University' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'University of Bonn' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Bonn' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Bonn' AS university, 'Business (Foundation)' AS title, 'Business' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'University of Cologne' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Cologne' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Heidelberg University' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Heidelberg University' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Freiburg' AS university, 'Health Sciences (Undergraduate)' AS title, 'Health Sciences' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Freiburg' AS university, 'Business Analytics (Postgraduate)' AS title, 'Business Analytics' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'TU Dresden' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'TU Dresden' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'TU Dresden' AS university, 'Business Analytics (Foundation)' AS title, 'Business Analytics' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'TU Dresden' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'University of Stuttgart' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Stuttgart' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Universiti Teknologi Malaysia' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Universiti Teknologi Malaysia' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'University of Malaya' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'University of Malaya' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Universiti Kebangsaan Malaysia' AS university, 'Health Sciences (Undergraduate)' AS title, 'Health Sciences' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Universiti Kebangsaan Malaysia' AS university, 'Business Analytics (Postgraduate)' AS title, 'Business Analytics' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Universiti Kebangsaan Malaysia' AS university, 'Computer Science (Foundation)' AS title, 'Computer Science' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'Universiti Putra Malaysia' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Universiti Putra Malaysia' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Universiti Putra Malaysia' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'Universiti Sains Malaysia' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Universiti Sains Malaysia' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Universiti Teknologi MARA' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Universiti Teknologi MARA' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'International Islamic University Malaysia' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'International Islamic University Malaysia' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'International Islamic University Malaysia' AS university, 'Health Sciences (Foundation)' AS title, 'Health Sciences' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'Taylor’s University' AS university, 'Health Sciences (Undergraduate)' AS title, 'Health Sciences' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Taylor’s University' AS university, 'Business Analytics (Postgraduate)' AS title, 'Business Analytics' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Sunway University' AS university, 'Computer Science (Undergraduate)' AS title, 'Computer Science' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Sunway University' AS university, 'Business (Postgraduate)' AS title, 'Business' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Sunway University' AS university, 'Engineering (PhD)' AS title, 'Engineering' AS subject, 'PhD' AS study_level
  UNION ALL SELECT 'Universiti Malaysia Sarawak' AS university, 'Business Analytics (Undergraduate)' AS title, 'Business Analytics' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Universiti Malaysia Sarawak' AS university, 'Engineering (Postgraduate)' AS title, 'Engineering' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Multimedia University' AS university, 'Business (Undergraduate)' AS title, 'Business' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'Multimedia University' AS university, 'Health Sciences (Postgraduate)' AS title, 'Health Sciences' AS subject, 'Postgraduate' AS study_level
  UNION ALL SELECT 'Multimedia University' AS university, 'Engineering (Foundation)' AS title, 'Engineering' AS subject, 'Foundation' AS study_level
  UNION ALL SELECT 'UCSI University' AS university, 'Engineering (Undergraduate)' AS title, 'Engineering' AS subject, 'Undergraduate' AS study_level
  UNION ALL SELECT 'UCSI University' AS university, 'Computer Science (Postgraduate)' AS title, 'Computer Science' AS subject, 'Postgraduate' AS study_level
) seed ON seed.university = u.name;
