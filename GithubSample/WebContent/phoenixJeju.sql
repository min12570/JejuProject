
CREATE TABLE  users  (
	 user_id       VARCHAR(50) NOT NULL, 
	 user_pw       VARCHAR(50) NOT NULL, 
	 user_email    VARCHAR(50) NULL,     
	 user_contact  VARCHAR(50) NULL      
);


ALTER TABLE  users 
	ADD
		CONSTRAINT  PK_users  # 고객 기본키
		PRIMARY KEY (
			 user_id  # 고객 ID
		);

# 패키지
CREATE TABLE  package  (
	 p_id           INTEGER      NOT NULL, # 패키지 ID
	 p_name         VARCHAR(50)  NOT NULL, # 패키지 이름
	 p_weekdaycost  INTEGER      NULL,     # 주중가격
	 p_weekendcost  INTEGER      NULL,     # 주말가격
	 p_percost      INTEGER      NULL,     # 추가인원가격
	 p_cost         INTEGER      NULL,     # 가격
	 p_region       VARCHAR(30)  NULL,     # 지역
	 p_image        VARCHAR(100) NULL,     # 이미지
	 p_content      TEXT         NULL,     # 내용
	 p_url          VARCHAR(100) NULL      # URL
);

# 패키지
ALTER TABLE  package 
	ADD
		CONSTRAINT  PK_package  # 패키지 기본키
		PRIMARY KEY (
			 p_id  # 패키지 ID
		);

# 객실
CREATE TABLE  room  (
	 room_id       INTEGER      NOT NULL, # 객실 ID
	 room_name     VARCHAR(50)  NULL,     # 객실 이름
	 room_cost     INTEGER      NULL,     # 가격
	 room_cnt      INTEGER      NULL,     # 총 수량
	 room_remain   INTEGER      NULL,     # 남은 수량
	 room_image    VARCHAR(100) NULL,     # 이미지
	 room_content  TEXT         NULL,     # 객실 정보
	 room_url      VARCHAR(100) NULL,     # 객실 URL
	 room_date     DATE         NULL      # 객실 날짜
);

# 객실
ALTER TABLE  room 
	ADD
		CONSTRAINT  PK_room  # 객실 기본키
		PRIMARY KEY (
			 room_id  # 객실 ID
		);

# 예약
CREATE TABLE  reservation  (
	 res_id         INTEGER     NOT NULL AUTO_INCREMENT, # 예약 ID
	 user_id        VARCHAR(50) NOT NULL, # 고객 ID
	 p_id           INTEGER     NOT NULL, # 패키지 ID
	 room_id        INTEGER     NOT NULL, # 객실 ID
	 res_personcnt  INTEGER     NULL,     # 예약 인원
	 res_cost       INTEGER     NULL,     # 예약 금액
	 res_payment    VARCHAR(50) NULL,     # 결제방법
	 res_checkin    DATE        NULL,     # 체크인
	 res_checkout   DATE        NULL      # 체크아웃
);

# 예약
ALTER TABLE  reservation 
	ADD
		CONSTRAINT  PK_reservation  # 예약 기본키
		PRIMARY KEY (
			 user_id , # 고객 ID
			 p_id ,    # 패키지 ID
			 room_id   # 객실 ID
		);

# 예약
ALTER TABLE  reservation 
	ADD
		CONSTRAINT  FK_user_TO_reservation  # 고객 -> 예약
		FOREIGN KEY (
			 user_id  # 고객 ID
		)
		REFERENCES  user  ( # 고객
			 user_id  # 고객 ID
		);

# 예약
ALTER TABLE  reservation 
	ADD
		CONSTRAINT  FK_package_TO_reservation  # 패키지 -> 예약
		FOREIGN KEY (
			 p_id  # 패키지 ID
		)
		REFERENCES  package  ( # 패키지
			 p_id  # 패키지 ID
		);

# 예약
ALTER TABLE  reservation 
	ADD
		CONSTRAINT  FK_room_TO_reservation  # 객실 -> 예약
		FOREIGN KEY (
			 room_id  # 객실 ID
		)
		REFERENCES  room  ( # 객실
			 room_id  # 객실 ID
		);
		
insert into users values ("test", "1234", "as@email.com", "01012345678");


select * from package;