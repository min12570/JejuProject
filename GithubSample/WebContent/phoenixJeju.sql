-- SQL 구문 by hyunjeong

/* table drop 문*/
drop table reservation;
drop table users;
drop table package;
drop table room;
drop table jan_res;


/* 테이블 생성 DDL*/
-- 고객
CREATE TABLE users (
	user_id      VARCHAR(50) NOT NULL, -- 고객 ID
	user_pw      VARCHAR(50) NOT NULL, -- 비밀번호
	user_email   VARCHAR(50) NULL,     -- 이메일
	user_contact VARCHAR(50) NULL      -- 연락처
);

-- 고객
ALTER TABLE users
	ADD CONSTRAINT PK_users -- 고객 기본키
		PRIMARY KEY (
			user_id -- 고객 ID
		);

-- 패키지
CREATE TABLE package (
	p_id          INTEGER     NOT NULL, -- 패키지 ID
	p_name        VARCHAR(50) NOT NULL, -- 패키지 이름
	p_weekdaycost INTEGER     NULL,     -- 주중가격
	p_weekendcost INTEGER     NULL,     -- 주말가격
	p_percost     INTEGER     NULL,     -- 추가인원가격
	p_cost        INTEGER     NULL,     -- 가격
	p_region      VARCHAR(30) NULL,     -- 지역
	p_image       TEXT        NULL,     -- 이미지
	p_content     TEXT        NULL,     -- 내용
	p_url         TEXT        NULL      -- URL
);

-- 패키지
ALTER TABLE package
	ADD CONSTRAINT PK_package -- 패키지 기본키
		PRIMARY KEY (
			p_id -- 패키지 ID
		);

-- 객실
CREATE TABLE room (
	room_id      INTEGER     NOT NULL, -- 객실 ID
	room_name    VARCHAR(50) NULL,     -- 객실 이름
	room_cost    INTEGER     NULL,     -- 가격
	room_image   TEXT        NULL,     -- 이미지
	room_content TEXT        NULL,     -- 객실 정보
	room_url     TEXT        NULL      -- 객실 URL
);

-- 객실
ALTER TABLE room
	ADD CONSTRAINT PK_room -- 객실 기본키
		PRIMARY KEY (
			room_id -- 객실 ID
		);

-- 1월 예약 참조
CREATE TABLE jan_res (
	jan_day INTEGER NULL, -- 일
	d_ondol INTEGER NULL, -- 더블온돌개수
	d_twin  INTEGER NULL, -- 더블트윈개수
	t_ondol INTEGER NULL, -- 트윈온돌개수
	o_ondol INTEGER NULL, -- 오션온돌개수
	suite_a INTEGER NULL, -- 스위트A개수
	suite_b INTEGER NULL, -- 스위트B개수
	suite_o INTEGER NULL  -- 스위트O개수
);

-- 예약
CREATE TABLE reservation (
	res_id        INTEGER     NOT NULL primary key auto_increment, -- 예약 ID
	user_id       VARCHAR(50) NULL,     -- 고객 ID
	p_id          INTEGER     NULL,     -- 패키지 ID
	room_id       INTEGER     NULL,     -- 객실 ID
	res_personcnt INTEGER     NULL,     -- 예약 인원
	res_cost      INTEGER     NULL,     -- 예약 금액
	res_payment   VARCHAR(50) NULL,     -- 결제방법
	res_checkin   DATE        NULL,     -- 체크인
	res_checkout  DATE        NULL      -- 체크아웃
);


-- 예약
ALTER TABLE reservation
	ADD CONSTRAINT FK_users_TO_reservation -- 고객 -> 예약
		FOREIGN KEY (
			user_id -- 고객 ID
		)
		REFERENCES users ( -- 고객
			user_id -- 고객 ID
		);

-- 예약
ALTER TABLE reservation
	ADD CONSTRAINT FK_package_TO_reservation -- 패키지 -> 예약
		FOREIGN KEY (
			p_id -- 패키지 ID
		)
		REFERENCES package ( -- 패키지
			p_id -- 패키지 ID
		);

-- 예약
ALTER TABLE reservation
	ADD CONSTRAINT FK_room_TO_reservation -- 객실 -> 예약
		FOREIGN KEY (
			room_id -- 객실 ID
		)
		REFERENCES room ( -- 객실
			room_id -- 객실 ID
		);
		
--insert into users values ("joins1", "1234", "joins@emai.com", "010-1111-2222");
--insert into package values(0, "휘닉스 스쿠버", 302000 , 387000 , 66000 , null , "제주", "", "", "");


select * from users;
select * from package;



/* 데이터 Insert 구문, 2018.01.02 */

-- User 데이터 삽입
INSERT INTO `users` (`user_id`, `user_pw`, `user_email`, `user_contact`) VALUES
	('조인스', '1234', 'joins@emai.com', '010-1111-2222'),
	('김아름', '1234', 'kar@email.com', '010-3333-4444'),
	('김정민', '1234', 'kjm@email.com', '010-4444-5555'),
	('정지윤', '1234', 'jjy@email.com', '010-2222-4444'),
	('정현정', '1234', 'jhj@email.com', '010-2222-3333');
	
-- 객실 데이터 삽입
INSERT INTO `room` (`room_id`, `room_name`, `room_cost`, `room_image`, `room_content`, `room_url`) VALUES
	(1, '로얄더블온돌', 290000, '../file/resort/Room/d_ondol.gif', NULL, NULL),
	(2, '로얄더블트윈', 290000, '../file/resort/Room/d_twin.gif', NULL, NULL),
	(3, '로얄트윈온돌', 290000, '../file/resort/Room/suite_o.gif', NULL, NULL),
	(4, '로얄오션온돌', 290000, '../file/resort/Room/o_ondol.gif', NULL, NULL),
	(5, '로얄스위트A', 390000, '../file/resort/Room/suite_a.gif', NULL, NULL),
	(6, '로얄스위트B', 390000, '../file/resort/Room/suite_b.gif', NULL, NULL),
	(7, '로얄스위트O', 390000, '../file/resort/Room/suite_o.gif', NULL, NULL);

-- 패키지 데이터 삽입
INSERT INTO `package` (`p_id`, `p_name`, `p_weekdaycost`, `p_weekendcost`, `p_percost`, `p_cost`, `p_region`, `p_image`, `p_content`, `p_url`) VALUES
	(0, '휘닉스 스쿠버', 302000, 387000, 66000, NULL, '제주', '../file/resort/Package/upload_201611162efae3cb.jpg', '', '');

-- 

-- 1월 예약 데이터 삽입
--ahreum data 수정!
INSERT INTO `jan_res` (`jan_day`, `d_ondol`, `d_twin`, `t_ondol`, `o_ondol`, `suite_a`, `suite_b`, `suite_o`) VALUES
	(20180101, 1, 1, 2, 2, 2, 2, 2),
	(20180102, 2, 2, 0, 0, 0, 0, 0),
	(20180103, 2, 2, 2, 2, 2, 2, 2),
	(20180104, 2, 2, 2, 2, 2, 2, 2),
	(20180105, 2, 2, 2, 2, 2, 2, 2),
	(20180106, 2, 2, 2, 2, 2, 2, 2),
	(20180107, 2, 2, 2, 2, 2, 2, 2),
	(20180108, 2, 2, 2, 2, 2, 2, 2),
	(20180109, 2, 2, 2, 2, 2, 2, 2),
	(20180110, 2, 2, 2, 2, 2, 2, 2),
	(20180111, 2, 2, 2, 2, 2, 2, 2),
	(20180112, 2, 2, 2, 2, 2, 2, 2),
	(20180113, 2, 2, 2, 2, 2, 2, 2),
	(20180114, 2, 2, 2, 2, 2, 2, 2),
	(20180115, 2, 2, 2, 2, 2, 2, 2),
	(20180116, 2, 2, 2, 2, 2, 2, 2),
	(20180117, 2, 2, 2, 2, 2, 2, 2),
	(20180118, 2, 2, 2, 2, 2, 2, 2),
	(20180119, 2, 2, 2, 2, 2, 2, 2),
	(20180120, 2, 2, 2, 2, 2, 2, 2),
	(20180121, 2, 2, 2, 2, 2, 2, 2),
	(20180122, 2, 2, 2, 2, 2, 2, 2),
	(20180123, 2, 2, 2, 2, 2, 2, 2),
	(20180124, 2, 2, 2, 2, 2, 2, 2),
	(20180125, 2, 2, 2, 2, 2, 2, 2),
	(20180126, 2, 2, 2, 2, 2, 2, 2),
	(20180127, 2, 2, 2, 2, 2, 2, 2),
	(20180128, 2, 2, 2, 2, 2, 2, 2),
	(20180129, 2, 2, 2, 2, 2, 2, 2),
	(20180130, 2, 2, 2, 2, 2, 2, 2);

	select * from jan_day;
	
	SELECT CASE D_ONDOL WHEN D_ONDOL > 0 THEN 'D_ONDOL'
                    ELSE 'D_ONDOL(SOLD OUT)' END 	 AS D_ONDOL
     , CASE D_TWIN WHEN D_TWIN > 0 THEN 'D_TWIN'
                    ELSE 'D_TWIN(SOLD OUT)' END      AS D_TWIN
     , CASE T_ONDOL WHEN T_ONDOL > 0 THEN 'T_ONDOL'
                    ELSE 'T_ONDOL(SOLD OUT)' END     AS T_ONDOL
     , CASE O_ONDOL WHEN O_ONDOL > 0 THEN 'O_ONDOL'
                    ELSE 'O_ONDOL(SOLD OUT)' END     AS O_ONDOL
     , CASE SUITE_A WHEN SUITE_A > 0 THEN 'SUITE_A'
                    ELSE 'SUITE_A(SOLD OUT)' END     AS SUITE_A
     , CASE SUITE_B WHEN SUITE_B > 0 THEN 'SUITE_B'
                    ELSE 'SUITE_B(SOLD OUT)' END     AS SUITE_B
     , CASE SUITE_O WHEN SUITE_O > 0 THEN 'SUITE_O'
                    ELSE 'SUITE_O(SOLD OUT)' END     AS SUITE_O
 FROM JAN_RES
 WHERE jan_day = 20180102;

 select * from users;