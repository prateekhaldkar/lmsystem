create database lmsdb;
use lmsdb;
create table states (
    state_id int not null auto_increment primary key,
    state varchar(50) not null
);
create table cities (
    city_id int not null auto_increment primary key,
    city varchar(50) not null,
    state_id int not null,
    constraint fk_cities_states foreign key (state_id) references states(state_id)
);
create table categories (
    category_id int not null auto_increment primary key,
    name char(50) not null
);
create table gender (
    gender_id int not null auto_increment primary key,
    gender_type char(10) not null
);
create table document_types (
    document_type_id int not null auto_increment primary key,
    document_type char(25) not null
);
create table status (
    status_id int not null auto_increment primary key,
    name char(25) not null
);
create table user_types (
    user_type_id int not null auto_increment primary key,
    type char(25) not null
);
create table users (
    user_id int not null auto_increment primary key,
    name char(50) not null,
    email char(255) not null unique,
    password char(255) not null,
    gender_id int null,
    constraint fk_users_gender foreign key (gender_id) references gender(gender_id),
    dob date null,
    city_id int not null,
    constraint fk_users_cities foreign key (city_id) references cities(city_id),
    address varchar(500) null,
    contact char(10) not null unique,
    profile_pic char(255) null,
    verification_code char(6) null,
    status_id int not null default 1,
    constraint fk_users_status foreign key (status_id) references status(status_id),
    document_type_id int null,
    constraint fk_users_document_types foreign key (document_type_id) references document_types(document_type_id),
    document_path char(255) null,
    user_type_id int not null default 3,
    constraint fk_users_user_types foreign key (user_type_id) references user_types(user_type_id)
);
create table libraries (
    library_id int not null auto_increment primary key,
    user_id int not null,
    details varchar(2000) null,
    website char(255) null,
    open_timing time null,
    close_timing time null,
    book_issue_days int null,
    late_fine int null,
    deposit_amount int null,
    constraint fk_libraries_users foreign key (user_id) references users(user_id)
);
create table library_pics (
    library_pic_id int not null auto_increment primary key,
    library_id int not null,
    constraint fk_library_pics_libraries foreign key (library_id) references libraries(library_id),
    pic_path char(255) null
);
create table publishers (
    publisher_id int not null auto_increment primary key,
    user_id int not null,
    constraint fk_publishers_users foreign key (user_id) references users(user_id),
    details varchar(2000) null,
    website char(255) null
);
create table books (
    book_id int not null auto_increment primary key,
    isbn_no char(50) not null,
    title char(100) not null,
    category_id int not null,
    constraint fk_books_categories foreign key (category_id) references categories(category_id),
    publisher_id int not null,
    constraint fk_book_publishers foreign key (publisher_id) references publishers(publisher_id)
);
create table book_editions (
    book_edition_id int not null auto_increment primary key,
    book_id int not null,
    constraint fk_book_editions_books foreign key (book_id) references books(book_id),
    edition char(5) not null,
    published_on date not null,
    price int not null,
    details varchar(2000) not null
);
create table librarians (-------------
    librarian_id int not null auto_increment primary key,
    user_id int not null,
    constraint fk_librarians_users foreign key (user_id) references users(user_id),
    library_id int null,
    constraint fk_librarians_libraries foreign key (library_id) references libraries(library_id),
    status_id int null,
    constraint fk_librarians_status foreign key (status_id) references status(status_id),
    joined_on date null,
    left_on date null default null
);
create table library_books (
    library_book_id int not null auto_increment primary key,
    library_id int not null,
    constraint fk_library_books_libraries foreign key (library_id) references libraries(library_id),
    book_edition_id int not null,
    constraint fk_library_books_book_editions foreign key (book_edition_id) references book_editions(book_edition_id),
    copies int not null,
    books_issued int not null default 0,
    scraped boolean not null default false
);
create table book_authors (
    book_author_id int not null auto_increment primary key,
    book_edition_id int not null,
    constraint fk_book_authors_book_editions foreign key (book_edition_id) references book_editions(book_edition_id),
    user_id int not null,
    constraint fk_book_authors_users foreign key (user_id) references users(user_id)
);
create table memberships (
    membership_id int not null auto_increment primary key,
    user_id int not null,
    constraint fk_memberships_users foreign key (user_id) references users(user_id),
    library_id int not null,
    constraint fk_memberships_libraries foreign key (library_id) references libraries(library_id),
    joined_on date not null,
    left_on date null,
    current_dues int not null default 0
);
create table issued_books (
    issued_book_id int not null auto_increment primary key,
    book_edition_id int not null,
    constraint fk_issued_books_book_editions foreign key (book_edition_id) references book_editions(book_edition_id),
    membership_id int not null,
    constraint issued_books_memberships foreign key (membership_id) references memberships(membership_id),
    issue_date Timestamp not null,
    return_date Timestamp null,
    fine int not null default 0
);
###########################################################################
###########################################################################