--uc-1
CREATE DATABASE AddressBookService;
USE AddressBookService;

--uc-2
--Ability to create a Address Book Table with first and last names, address, city, state, zip, phone number and email as its attributes

CREATE TABLE address_book(
	id int IDENTITY(1,1) PRIMARY KEY,
	firstName varchar(50),
	lastName varchar(50),
	adderss varchar(50),
	city varchar(50),
	state varchar(50),
	zip int,
	phone bigint,
	email varchar(255)
);

--uc-3
--Ability to insert new Contacts to Address Book
INSERT INTO address_book VALUES('John', 'Doe', 'Knowhere', 'somewhere', 'anywhere', 123456, 7894561230, 'john.doe@email.com');

INSERT INTO address_book 
VALUES
	('Jack', 'Doe', 'Knowhere', 'somewhere', 'anywhere', 654321, 3216549870, 'jack.doe@email.com'),
	('Jill', 'Doe', 'Knowhere', 'somewhere', 'anywhere', 362514, 3698521470, 'jill.doe@email.com');

--uc-4
--Ability to edit existing contact person using their name
UPDATE address_book SET firstName='Jane' where firstName='John';

--uc-5
--Ability to delete a person using person's name
DELETE FROM address_book where firstName='Jane';

--uc-6
--Ability to Retrieve Person belonging to a City or State from the Address Book
SELECT * FROM address_book where city = 'jackSCity';

--uc-7
--Ability to understand the size of address book by City and State
SELECT COUNT(id) AS 'size' FROM address_book;

--uc-8
--Ability to retrieve entries sorted alphabetically by Person’s name for a given city
INSERT INTO address_book (firstName, lastName, city)
VALUES
	('Johnson', 'Doe', 'somewhere'),
	('Tom', 'Doe', 'Knowhere'),
	('Harry', 'Doe', 'Knowhere'),
	('Simon', 'Doe', 'Knowhere');

SELECT * FROM address_book where city='Knowhere' ORDER BY firstName;
SELECT * FROM address_book where city='Knowhere' ORDER BY firstName DESC;

--uc-9
--Ability to identify each Address Book with name and Type
--Type: Family, Friends, Profession,
--TODO: (FirstName + LastName) -> name
ALTER TABLE address_book ADD name VARCHAR(255);
ALTER TABLE address_book ADD type VARCHAR(255) not null default 'Friends';

--uc-10
--Ability to identify each Address Book with name and Type
--Type: Family, Friends, Profession,
SELECT COUNT(id) AS 'Type' FROM address_book WHERE address_book.type='Friends';
SELECT COUNT(id) AS 'Type' FROM address_book WHERE address_book.type='Family';

--uc-11
--Ability to add person to both Friend and Family
INSERT INTO address_book (name, type) 
VALUES
	('Jason Doe', 'Family'),
	('Mason Doe', 'Friends');

SELECT * FROM address_book