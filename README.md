# SpringBoot-Project-MEGABOX

## 🖥️ 프로젝트 소개
- 영화관 브랜드 MEGABOX의 홈페이지를 기반으로 영화 정보, 영화 예매, 영화관 상품 판매, 이벤트 게시판, 커뮤니티 게시판이 있는 웹페이지입니다.

## 🕰️ 프로젝트 기간
- 2022.11.17 ~ 2022.12.09

## ⚙️ 개발 환경
- 개발 도구
    - Spring Tool Suite 4
    - GitHub, Google docs
- 개발 OS
    - Windows 10
- Back-end
    - 언어: Java
    - 프레임워크: Spring, MyBatis
    - 서버: Apache Tomcat 9.0
    - DB: mySQL
- Front-end
    - Web: HTML5, CSS, JavaScript, JSP, AJAX, jQuery
    - API: BootStrap5, 영화진흥위원회 박스오피스 API, 아임포트 결제 API

## 📜 ERD
<img src="https://user-images.githubusercontent.com/106582252/210202733-51b4e8da-ac4b-4431-9e2a-4152fd95971c.png" alt=""></img>


## 🧑‍🤝‍🧑 프로젝트 역할 분담
팀장 한인수: 로그인, 영화 예매 기능, 최종발표


<b>팀원 강혜원: 로그인, 메인 페이지, 스토어 게시판(CRUD), 장바구니, PPT제작</b>


팀원 이유정: 영화 게시판(CRUD), 영화 관람평 작성


팀원 임재윤: 회원가입(CRUD)


팀원 임진아: 커뮤니티 게시판(CRUD)


팀원 하재환: 이벤트/공지사항 게시판(CRUD)



## 📌 담당 기능
### 메인 [상세보기 - WIKI 이동](https://github.com/InsooHan/mainssangproject/wiki/Main-%ED%8E%98%EC%9D%B4%EC%A7%80-%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C)
-  Session 유무에 따라 Header 정보 변경
-  영화진흥위원회 박스오피스 API를 활용하여 박스오피스 순위 출력
-  영화 포스터 슬라이드 및 상세보기/예매 페이지 이동

### 로그인 [상세보기 - WIKI 이동](https://github.com/InsooHan/mainssangproject/wiki/%EB%A1%9C%EA%B7%B8%EC%9D%B8-%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C)
- modal을 활용하여 별도의 로그인 페이지 없이 모든 화면에서 로그인, 로그아웃 구현

### 스토어, 장바구니 [상세보기 - WIKI 이동](https://github.com/InsooHan/mainssangproject/wiki/%EC%8A%A4%ED%86%A0%EC%96%B4,-%EC%9E%A5%EB%B0%94%EA%B5%AC%EB%8B%88-%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C)
- 상품 수량 설정과 동시에 금액 변동
- '구매하기' 버튼 누르면 해당 주문 건에 대한 구매 페이지로 이동, 결제 API 연동
- 장바구니에 이미 담긴 상품을 또 장바구니 추가하는 경우 장바구니에 들어있는 상품 개수 추가
- 구매페이지/장바구니 내에서 수량 수정

### 배포
- AWS Elastick Beanstalk를 활용하여 서버 배포
- 배포 링크: <http://finalpro-env.eba-nzzf26tf.ap-northeast-1.elasticbeanstalk.com/>
