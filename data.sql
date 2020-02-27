DROP DATABASE bank;
CREATE DATABASE bank;
CREATE TABLE role (
  role_id SERIAL NOT NULL,
  role_name varchar(255) DEFAULT NULL,
  role_desc varchar(255) DEFAULT NULL,
  PRIMARY KEY (role_id)
);

DROP TABLE IF EXISTS user_details;
CREATE TABLE user_details (
  user_id varchar(255) NOT NULL,
  full_name varchar(255) NOT NULL,
  email_id varchar(255) NOT NULL unique ,
  tier numeric(11) NOT NULL, 
  gender varchar(2) NOT NULL,
  date_of_birth date NOT NULL,
  contact_info varchar(12) NOT NULL unique ,
  address varchar(255) NOT NULL,
  designation_id numeric(11) NOT NULL,
  created timestamp DEFAULT CURRENT_TIMESTAMP,
  updated timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id)
); 

DROP TABLE IF EXISTS account_details;

CREATE TABLE account_details (
  account_id SERIAL NOT NULL,
  account_number numeric(11) NOT NULL,
  user_id varchar(255) NOT NULL,
  account_type numeric(2) NOT NULL,
  interest decimal(5,2),
  balance decimal(10,2) NOT NULL,
  routing_id numeric(11) NOT NULL,
  created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (account_id),
  FOREIGN KEY (user_id) REFERENCES user_details(user_id)
); 

DROP TABLE IF EXISTS transaction_request;
CREATE TABLE transaction_request (
  request_id SERIAL NOT NULL,
  status_id numeric(11) NOT NULL,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP,
  created_by varchar(255) NOT NULL,
  approved_at varchar(255),
  approved_by timestamp null,
  from_account integer NOT NULL,
  to_account integer,
  is_critical numeric(2) NOT NULL DEFAULT 0,
  transaction_value decimal(10,2) NOT NULL,
  type numeric(2) NOT NULL,
  description varchar(255),
  PRIMARY KEY (request_id),
  FOREIGN KEY (from_account) REFERENCES account_details(account_id)
);

DROP TABLE IF EXISTS transaction;
CREATE TABLE transaction (
  transaction_id SERIAL NOT NULL,
  transaction_type numeric(1) NOT NULL,
  comments varchar(255),
  status numeric(1),
  account_id integer NOT NULL,
  current_balance decimal(10,2),
  request_id integer,
  transaction_value decimal(10,2) NOT NULL,
  transaction_timestamp timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (transaction_id),
  FOREIGN KEY (account_id) REFERENCES account_details(account_id),
  FOREIGN KEY (request_id) REFERENCES transaction_request(request_id)
);

DROP TABLE IF EXISTS user_creds;
CREATE TABLE user_creds (
  user_id varchar(255) NOT NULL,
  name varchar(255) NOT NULL,
  email varchar(255) NOT NULL unique ,
  password varchar(255) NOT NULL,
  role_id integer NOT NULL,
  status varchar(255),
  PRIMARY KEY (user_id),
  FOREIGN KEY (user_id) REFERENCES user_details(user_id),
  FOREIGN KEY (role_id) REFERENCES role(role_id)
);

DROP TABLE IF EXISTS auth_role;
CREATE TABLE auth_role(
  user_id varchar(255) NOT NULL,
  otp numeric(11),
  expiry timestamp,
  PRIMARY KEY (user_id),
  FOREIGN KEY (user_id) REFERENCES user_details(user_id)
);

DROP TABLE IF EXISTS admin_log;
CREATE TABLE admin_log (
  id SERIAL NOT NULL,
  log_timestamp timestamp ,
  related_user_id varchar(255) NOT NULL,
  message varchar(255),
  PRIMARY KEY (id)
); 

DROP TABLE IF EXISTS cards_info;
CREATE TABLE cards_info (
  card_id SERIAL NOT NULL,
  card_number numeric(16) NOT NULL,
  account_id integer NOT NULL,
  current_balance decimal(10,2) NOT NULL,
  credit_limit decimal(10,2) NOT NULL,
  type numeric(2) NOT NULL,
  created timestamp DEFAULT CURRENT_TIMESTAMP,
  updated timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (card_id),
  FOREIGN KEY (account_id) REFERENCES account_details(account_id)
);

DROP TABLE IF EXISTS checks;
CREATE TABLE checks (
  check_id SERIAL NOT NULL,
  check_number numeric(16) NOT NULL,
  issued_date timestamp DEFAULT CURRENT_TIMESTAMP,
  account_id integer NOT NULL,
  amount decimal(10,2) NOT NULL,
  PRIMARY KEY (check_id),
  FOREIGN KEY (account_id) REFERENCES account_details(account_id)
);


DROP TABLE IF EXISTS account_request;
CREATE TABLE account_request (
  request_id SERIAL NOT NULL,
  status numeric(11) NOT NULL,
  type numeric(2) NOT NULL,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP,
  approved_at timestamp null,
  created_by varchar(255) NOT NULL,
  approved_by varchar(255),
  comments varchar(255),
  PRIMARY KEY (request_id),
  FOREIGN KEY (created_by) REFERENCES user_details(user_id),
  FOREIGN KEY (approved_by) REFERENCES user_details(user_id)
);

DROP TABLE IF EXISTS help_details;
CREATE TABLE help_details (
  help_id SERIAL NOT NULL,
  user_id numeric(11),
  phone_num varchar(255) NOT NULL,
  email_id varchar(255) NOT NULL,
  title varchar(255) NOT NULL,
  description varchar(255) NOT NULL,
  PRIMARY KEY (help_id)
);
