import 'package:flutter_book_list/models/book.dart';

class BookRepository {
  final List<Book> _dummyBooks = [
    Book(
      title: '패키지 없이 R로 구현하는 심층 강화학습',
      subtitle: '손으로 풀어보는 Q-Learning부터 R로 구현하는 심층 강화학습까지',
      description:
          '머신러닝과 강화학습의 기본 개념부터 심층 강화학습의 알고리즘과 발전방향까지! 본 서는 강화학습의 기본 요소와 작동 원리에 대해 상세히 다루는데, 딥러닝 프레임 워크를 사용하는 것이 아닌, R base code로 강화학습을 구현하여 강화학습 작동원리를 이해한다.',
      image:
          'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FCuoqW%2Fbtq8uatukHu%2FO0VapTwcTTpV3T29lqMYd0%2Fimg.png',
    ),
    Book(
      title: '바로 찾아 바로 만드는 포토샵 콘텐츠 디자인 북',
      subtitle: '발등에 불 떨어진 마케터, 기획자 모두 모여라!',
      description:
          'N잡러, 부캐의 등장으로 “콘텐츠 제작”은 이제 우리 모두의 이야기가 되었습니다. 더불어 기획자, 마케터, PM 등 떠오르는 직업의 기본 소양은 바로 “콘텐츠 제작”입니다. 디자인이랑 친하지도 않고, 포토샵은 해본 적도 없는 여러분이 지금 당장 콘텐츠를 만들기 위해서 필요한 것은, 바로 <바.바.북>입니다.',
      image:
          'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Flzlyb%2Fbtq8nD5gYAf%2FiuHnWoFZPoBM35Y89aQZb0%2Fimg.png',
    ),
    Book(
      title: 'Vue.js 프로젝트 투입 일주일 전',
      subtitle: 'Vue.js 프로젝트 투입 일주일 전',
      description:
          '『Vue.js 프로젝트 투입 일주일 전』은 실무에서 프로젝트를 개발하는 진행 순서에 맞춰서 구성했기 때문에 초보자도 충분히 따라할 수 있으며, 개발 기초 지식이 있는 독자라면 조금 더 빠르게 Vue.js를 배울 수 있다. 개발 환경 설정부터 웹 앱 구현까지 책을 따라 하면서 자연스럽게 실무에 필요한 내용을 배워 보자.',
      image:
          'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbGOxQ8%2Fbtq6imQpvmA%2FEY3gKphHOPQbk8KT5FOm8K%2Fimg.jpg',
    ),
    Book(
      title: '파이썬 해킹 레시피',
      subtitle: '웹 크롤링 및 취약점 진단 도구를 구현해보는 정보 보안 실습',
      description:
          '이 책은 저자가 다년간의 정보 보안 강의, 컨설팅, 개발 경험을 토대로 작성한 해킹 요리 비법서다. 파이썬 3.9, Asyncio, BeautifulSoup, 비동기 문법 등 최신 파이썬 트렌드를 반영한 코드는 싱싱한 요리 재료이며 기본에 충실히 풀어나가는 이론은 레시피와 같다.',
      image:
          'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FrTh6k%2Fbtq517fdjqN%2FumbKQy7r9eGVnK4fkC8orK%2Fimg.png',
    ),
  ];

  List<Book> getBooks() {
    return _dummyBooks;
  }
}
