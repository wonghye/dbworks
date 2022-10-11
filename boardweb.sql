SELECT * FROM board;
SELECT * FROM member;

--관리자 권한 부여(변경)
UPDATE member SET role = 'ROLE_ADMIN'
WHERE id = 'admin';

DROP TABLE member;