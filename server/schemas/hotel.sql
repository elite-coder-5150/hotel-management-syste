use `hotel_management_system`;


create table `booking`
(
    `booking_id`     int(11)      not null auto_increment,
    `room_id`        int(11)      not null,
    `customer_id`    int(11)      not null,
    `check_in`       date         not null,
    `check_out`      date         not null,
    `payment_status` varchar(244) not null,
    `booking_status` varchar(255) not null,
    primary key (`booking_id`)
);

create table `room`
(
    `room_id`     int(11)                      not null auto_increment,
    `room_type`   varchar(255)                 not null,
    `room_price`  int(22)                      not null,
    `room_status` enum ('available', 'booked') not null default 'available',
    primary key (`room_id`)
);

create table `customer`
(
    `customer_id`  int(11)                    not null auto_increment,
    `name`         varchar(255)               NOT NULL,
    `email`        varchar(255)               NOT NULL,
    `phone`        varchar(255)               NOT NULL,
    `address`      varchar(255)               NOT NULL,
    `password`     varchar(255)               NOT NULL,
    `points`       int(11)                    NOT NULL default 0,
    `status`       enum ('active','inactive') NOT NULL,
    `credit_limit` int(11)                    NOT NULL default 300,
    PRIMARY KEY (`customer_id`)
);

alter table `customer`
    add column `avatar` varchar(255) not null after `name`;

alter table `customer`
    add column `avatar_url` varchar(255) not null after `avatar`;

create table `blocked_customer`
(
    `blocked_customer_id` int(11)      NOT NULL AUTO_INCREMENT,
    `customer_id`         int(11)      NOT NULL,
    `blocked_by`          int(11)      NOT NULL,
    `reason`              varchar(255) NOT NULL,
    `avatar`              varchar(255) NOT NULL,
    `avatar_url`          varchar(255) NOT NULL,
    `date`                date         NOT NULL,
    foreign key (customer_id) references customer (customer_id),

    PRIMARY KEY (`blocked_customer_id`)
);

/*
    * the follow table are for the shop section of the site
    *
    * in the follow schemas, the customers table has columns:
    *   customer_id,
    8   avatar
    *   email
    *   phone
    *   address
    *   password
    *   points
    *   status
    *   credit_limit
    *   first_name
    *   last_name
    *

*/

create table `orders`
(
    `order_id`     int(11)                      not null auto_increment,
    `customer_id`  int(11)                      not null,
    `room_id`      int(11)                      not null,
    `order_date`   date                         not null,
    `order_time`   time                         not null,
    `order_status` enum ('pending','delivered') not null default 'pending',
    primary key (`order_id`)
);

create table order_items
(
    order_item_id int(11) not null auto_increment,
    order_id      int(11) not null,
    product_id    int(11) not null,
    quantity      int(11) not null,
    price         int(11) not null,
    primary key (order_item_id)
);

create table `products`
(
    `product_id`     int(11)                          not null auto_increment,
    `product_name`   varchar(255)                     not null,
    `product_price`  int(11)                          not null,
    `product_image`  varchar(255)                     not null,
    `product_status` enum ('available','unavailable') not null default 'available',
    primary key (`product_id`)
);

