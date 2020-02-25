DROP DATABASE bank;
CREATE DATABASE bank;

DROP TABLE IF EXISTS bank.user;
CREATE TABLE bank.user (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  full_name varchar(255) NOT NULL,
  email_id varchar(255) NOT NULL unique ,
  gender varchar(2) NOT NULL,
  date_of_birth date NOT NULL,
  contact_info varchar(12) NOT NULL unique ,
  address varchar(255) NOT NULL,
  user_category int(2) NOT NULL,
  created timestamp DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (id)
); 


DROP TABLE IF EXISTS bank.employee;
CREATE TABLE bank.employee
(
    e_id int(11) unsigned NOT NULL AUTO_INCREMENT,
    e_tier int(11) unsigned NOT NULL,
    designation_id int(11) NOT NULL,
    contact_info_no varchar(255) NOT NULL unique ,
    e_name varchar(255) NOT NULL,
    gender varchar(255) NOT NULL,
    age int(11) NOT NULL,
    email varchar(255) NOT NULL unique ,
    address varchar(255) NOT NULL,
    created timestamp DEFAULT CURRENT_TIMESTAMP(),
    updated timestamp DEFAULT CURRENT_TIMESTAMP(),
    PRIMARY KEY (e_id)
);

CREATE TABLE bank.account_details (
  a_id int(11) unsigned NOT NULL AUTO_INCREMENT,
  id int(11) unsigned NOT NULL,
  account_type int(2) NOT NULL,
  rate_of_interest decimal(5,2),
  current_balance decimal(10,2) NOT NULL,
  routing_id int(11) NOT NULL,
  created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  updated timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (a_id),
  FOREIGN KEY (id) REFERENCES bank.user(id)
); 
CREATE TABLE bank.transaction_request (
  request_no int(11) NOT NULL AUTO_INCREMENT,
  created_date timestamp DEFAULT CURRENT_TIMESTAMP(),
  status int(11) NOT NULL,
  comments varchar(255),
  type int(2) NOT NULL,
  transaction_value decimal(10,2) NOT NULL,
  is_critical int(2) NOT NULL DEFAULT 0,
  created_by varchar(255) NOT NULL,
  approved_by varchar(255),
  approved_date timestamp null,
  from_account int(11) unsigned NOT NULL,
  to_account int(11) unsigned,
  description varchar(255),
  PRIMARY KEY (request_no),
  FOREIGN KEY (from_account) REFERENCES bank.account_details(a_id)
);

DROP TABLE IF EXISTS bank.transaction;
CREATE TABLE bank.transaction (
  transaction_id int(11) unsigned NOT NULL AUTO_INCREMENT,
  transaction_value decimal(10,2) NOT NULL,
  transaction_timestamp timestamp DEFAULT CURRENT_TIMESTAMP(),
  transaction_type int(1) NOT NULL,
  comments varchar(255),
  status int(1),
  a_id int(11) unsigned NOT NULL,
  current_balance decimal(10,2),
  request_no int(11),
  PRIMARY KEY (transaction_id),
  FOREIGN KEY (a_id) REFERENCES bank.account_details(a_id),
  FOREIGN KEY (request_no) REFERENCES bank.transaction_request(request_no)
);

CREATE TABLE bank.role (
  role_id int(11) NOT NULL AUTO_INCREMENT,
  role_name varchar(255) DEFAULT NULL,
  role_desc varchar(255) DEFAULT NULL,
  PRIMARY KEY (role_id)
);

CREATE TABLE bank.user_creds (
  user_id int(11) NOT NULL AUTO_INCREMENT,
  given_name varchar(255) NOT NULL,
  sur_name varchar(255) NOT NULL,
  email varchar(255) NOT NULL unique ,
  password varchar(255) NOT NULL,
  status varchar(255),
  otp int(11),
  expiry timestamp,
  PRIMARY KEY (user_id)
);

CREATE TABLE bank.user_role (
  user_id int(11) NOT NULL,
  role_id int(11) NOT NULL,
  PRIMARY KEY (user_id,role_id),
  KEY FK_user_role (role_id),
  CONSTRAINT FK_user FOREIGN KEY (user_id) REFERENCES user_creds (user_id),
  CONSTRAINT FK_user_role FOREIGN KEY (role_id) REFERENCES role (role_id)
) ;


DROP TABLE IF EXISTS bank.admin_log;
CREATE TABLE bank.admin_log (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  log_timestamp timestamp ,
  related_user_id varchar(255) NOT NULL,
  message varchar(255),
  PRIMARY KEY (id)
); 

DROP TABLE IF EXISTS bank.cards_info;
CREATE TABLE bank.cards_info (
  card_id int(11) unsigned NOT NULL AUTO_INCREMENT,
  a_id int(11) unsigned NOT NULL,
  current_balance decimal(10,2) NOT NULL,
  credit_limit decimal(10,2) NOT NULL,
  type int(2) NOT NULL,
  created timestamp DEFAULT CURRENT_TIMESTAMP(),
  updated timestamp DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (card_id),
  FOREIGN KEY (a_id) REFERENCES bank.account_details(a_id)
);


DROP TABLE IF EXISTS bank.checks;
CREATE TABLE bank.checks (
  check_id int(11) unsigned NOT NULL AUTO_INCREMENT,
  issued_date timestamp DEFAULT CURRENT_TIMESTAMP(),
  a_id int(11) unsigned NOT NULL,
  amount decimal(10,2) NOT NULL,
  PRIMARY KEY (check_id),
  FOREIGN KEY (a_id) REFERENCES bank.account_details(a_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS  bank.account_request;
CREATE TABLE bank.account_request (
  request_no int(11) NOT NULL AUTO_INCREMENT,
  created_date timestamp DEFAULT CURRENT_TIMESTAMP(),
  status int(11) NOT NULL,
  type int(2) NOT NULL,
  value VARCHAR(1024),
  user VARCHAR(1024),
  created_source varchar(255) NOT NULL,
  approved_source varchar(255),
  approved_date timestamp null,
  comments varchar(255),
  employee VARCHAR(1024),
  role int(2) NOT NULL,
  PRIMARY KEY (request_no)
);

DROP TABLE IF EXISTS bank.help_details;
CREATE TABLE bank.help_details (
  help_id int(11) unsigned NOT NULL AUTO_INCREMENT,
  user_id int(11),
  phone_num varchar(255) NOT NULL,
  email_id varchar(255) NOT NULL,
  title varchar(255) NOT NULL,
  description varchar(255) NOT NULL,
  PRIMARY KEY (help_id)
);


