# 3-50 모든 고객을 삭제하시오.
# DELETE	FROM	Customer;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Customer;
SET SQL_SAFE_UPDATES = 1;


# 3-49 Customer 테이블에서 고객번호가 5인 고객을 삭제하시오.
DELETE	FROM	Customer
WHERE	custid=5;

SELECT * FROM Customer;

# 3-48 Customer 테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 변경하시오.
UPDATE	Customer
SET		address=(SELECT		address
				 FROM		Customer
                 WHERE		name='김연아')
WHERE	name = '박세리';

# 3-47 Customer 테이블에서 고객번호가 5인 고객의 주소를 ‘대한민국 부산’으로 변경하시오.
UPDATE Customer
SET address = '대한민국 부산'
WHERE custid = 5;

# 3-46 수입도서 목록(Imported_book)을 Book 테이블에 모두 삽입하시오.
INSERT	INTO		Book(bookid, bookname, price, publisher)
		SELECT			 bookid, bookname, price, publisher
		FROM			 Imported_book;


# 3-45 Book 테이블에 새로운 도서 ‘스포츠 의학’을 삽입하시오. 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 미정이다.
INSERT INTO		Book (bookid, bookname, publisher)
VALUES			(14, '스포츠 의학', '한솔의학서적');

# 3-44 Book 테이블에 새로운 도서 ‘스포츠 의학’을 삽입하시오. 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 90,000원이다.
INSERT INTO		Book (bookid, bookname, publisher, price)
VALUES			(11, '스포츠 의학', '한솔의학서적', 90000);


# 3-43 NewCustomer 테이블을 삭제하시오. 만약 삭제가 거절된다면 원인을 파악하고 관련된 테이블을 같이 삭제하시오.
# (NewOrders 테이블이 NewCustomer를 참조하고 있음)

-- 먼저 NewOrders 테이블을 삭제
DROP TABLE NewOrders;

-- 그런 다음 NewCustomer 테이블을 삭제
DROP TABLE NewCustomer;


# 3-42 NewBook 테이블을 삭제하시오.
DROP TABLE NewBook;

# 3-41 NewBook 테이블의 bookid 속성을 기본키로 변경하시오.
ALTER TABLE		NewBook
ADD PRIMARY KEY	(bookid);

# 3-40 NewBook 테이블의 bookid 속성에 NOT NULL 제약조건을 적용하시오.
ALTER TABLE		NewBook
MODIFY			bookid		INT		NOT NULL;

# 3-39 NewBook 테이블의 isbn 속성을 삭제하시오
ALTER TABLE NewBook DROP COLUMN isbn;

# 3-38 NewBook 테이블의 isbn 속성의 데이터 타입을 NUMBER형으로 변경하시오.
-- MySQL에서 NUMBER 데이터 타입은 지원되지 않습니다. 대신, 숫자를 저장하기 위해 INT, DECIMAL, FLOAT, DOUBLE 등의 데이터 타입을 사용할 수 있습니다.
# ALTER TABLE NewBook MODIFY isbn NUMBER;
ALTER TABLE NewBook MODIFY isbn INT;

# 3-37 NewBook 테이블에 VARCHAR2(13)의 자료형을 가진 isbn 속성을 추가하시오
-- MySQL에서는 VARCHAR2 타입을 지원하지 않습니다. 대신, VARCHAR 타입을 사용해야 합니다.
# ALTER TABLE NewBook ADD isbn VARCHAR2(13);
ALTER TABLE NewBook ADD isbn VARCHAR(13);

# 3-36 다음과 같은 속성을 가진 NewOrders 테이블을 생성하시오.
-- orderid(주문번호) - NUMBER, 기본키
-- custid(고객번호) - NUMBER, NOT NULL 제약조건, 외래키(NewCustomer.custid, 연쇄삭제) bookid(도서번호) - NUMBER, NOT NULL 제약조건
-- saleprice(판매가격) - NUMBER
-- orderdate(판매일자) - DATE

CREATE TABLE	NewOrders (
    orderid		INT		PRIMARY KEY,
    custid		INT 	NOT NULL,
    bookid		INT 	NOT NULL,
    saleprice	DECIMAL(10,2),  -- 가격이므로 DECIMAL 타입을 사용했습니다. 필요에 따라 조정할 수 있습니다.
    orderdate	DATE,
    FOREIGN KEY (custid) REFERENCES NewCustomer(custid) ON DELETE CASCADE
);


# 3-35  질의 3-35 다음과 같은 속성을 가진 NewCustomer 테이블을 생성하시오
-- custid(고객번호)	– NUMBER, 기본키
-- name(이름)		– VARCHAR2(40)
-- address(주소)		– VARCHAR2(40)
-- phone(전화번호)	– VARCHAR2(30)

CREATE TABLE	NewCustomer (
    custid		INT				PRIMARY KEY,
    name		VARCHAR(40),
    address		VARCHAR(40),
    phone		VARCHAR(30)
);


# bookname은 NULL 값을 가질 수 없고, publisher는 같은 값이 있으면 안 된다. price에 값이 입력되지 않을 경우
# 기본값 10000을 저장한다. 또 가격은 최소 1,000원 이상으로 한다.

CREATE TABLE	NewBook (
    bookname	VARCHAR(20) NOT NULL,
    publisher	VARCHAR(20) NOT NULL UNIQUE,
    price		DECIMAL(10,2) DEFAULT 10000 CHECK(price >= 1000),
    PRIMARY KEY (bookname, publisher)
);

# 3-34 다음과 같은 속성을 가진 NewBook 테이블을 생성하시오 정수형은 NUMBER를, 문자형은 가변형 문자타입인 VARCHAR2를 사용
# bookid(도서번호) – NUMBER bookname(도서이름) – VARCHAR2(20) publisher(출판사) – VARCHAR2(20) price(가격) – NUMBER
-- NUMBER는 Oracle 데이터 타입입니다. MySQL에서는 INT 또는 DECIMAL과 같은 타입을 사용해야 합니다.

CREATE TABLE NewBook (
    bookname VARCHAR(20),
    publisher VARCHAR(20),
    price DECIMAL(10,2),
    PRIMARY KEY	(bookname, ppublisher)
);

CREATE TABLE	NewBook (
    bookid		INT,
    bookname	VARCHAR(20),
    publisher	VARCHAR(20),
    price		DECIMAL(10,2),  -- 정밀도와 스케일을 지정
    PRIMARY KEY	(bookid)
);

CREATE TABLE NewBook (
    bookid INT,
    bookname VARCHAR(20),
    publisher VARCHAR(20),
    price DECIMAL(10,2)  -- 정밀도와 스케일을 지정
);

# 3-33 주문이 있는 고객의 이름과 주소를 보이시오.
SELECT	name, address
FROM	Customer cs
WHERE	EXISTS (SELECT	*
				FROM	Orders od
				WHERE	cs.custid=od.custid);

# 3-32 도서를 주문하지 않은 고객의 이름을 보이시오.
-- MINUS 연산자는 Oracle에서 사용되는 연산자로, MySQL에서는 지원하지 않음
-- MySQL에서 동일한 작업을 수행하려면 LEFT JOIN 또는 NOT IN과 같은 다른 접근 방식을 사용
SELECT name
FROM Customer
WHERE custid NOT IN (SELECT custid FROM Orders);


# 3-31 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오.
SELECT	b1.bookname
FROM	Book b1
WHERE	b1.price > (SELECT	avg(b2.price)
					FROM	Book b2
                    WHERE	b2.publisher=b1.publisher);

# 3-30 대한 미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오.
SELECT	name
FROM	Customer
WHERE	custid IN(SELECT	custid
				  FROM		Orders
                  WHERE		bookid IN(SELECT	bookid
									  FROM		Book
                                      WHERE		publisher='대한미디어'));

# 3-29 도서를 구매한 적이 있는 고객의 이름을 검색하시오.
SELECT	name
FROM	Customer
WHERE	custid IN	(SELECT custid
					FROM Orders);

# 3-28 가장 비싼 도서의 이름을 보이시오.
SELECT	bookname
FROM	Book
WHERE	price=(SELECT MAX(price)
				FROM Book);

# 3-27 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오.
SELECT	Customer.name, saleprice
FROM	Customer	LEFT OUTER JOIN Orders
					ON Customer.custid-Orders.custid;

# 3-26 가격이 20,000원인 도서를 주문한 고객의 이름과 도의 이름을 구하시오.
SELECT	Customer.name, book.bookname
FROM	Customer, Orders, Book
WHERE	Customer.custid=Orders .custid AND Orders.bookid=Book.bookid
				 AND Book. price=20000;

# 3-25 고객의 이름과 고객이 주문한 도서의 이름을 구하시오.
SELECT	Customer.name, Book.bookname
FROM	Customer, Orders, Book
where	Customer.custid = Orders.custid AND Orders.bookid=Book.bookid;

# 3-24 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정의하시오.
SELECT	 Customer.name, sum(saleprice) as "총 판매액"
FROM	 customer, Orders
WHERE	 customer.custid = orders.custid
GROUP BY Customer.name
ORDER BY Customer.name;

# 3-23 고객의 이름과 고객이 주문한 도서의 판매가격을 검하시오.
SELECT	Customer.name, saleprice
FROM	Customer, Orders
WHERE	customer.custid = orders.custid;

# 3-22 고객과 고객의 주문에 관한 데이터를 고객번호 순으로 정렬하여 보이시오.
SELECT	 *
FROM	 Customer, Orders
WHERE	 customer.custid = orders.custid
ORDER BY customer.name;

# 3-21 고객과 고객의 주문에 관한 데이터를 모두 보이시오.
SELECT	*
FROM	Customer, Orders
WHERE	customer.custid = orders.custid;

SELECT	*
FROM	Customer, Orders;

USE sys