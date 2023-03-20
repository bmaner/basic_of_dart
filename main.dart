//named parameter
// String sayAnnyeong(
//     {String name = "anonymous", int age = 99, String country = "idontknow"}) {
//   return "여기여기 Hello $name, you are $age, and you come from $country";
// }

//위와 같이 default value를 적어주는 방법도 있고, 아래와 같이 required를 적어주는 방법도 있다.
String sayAnnyeong(
    {required String name, required int age, required String country}) {
  return "여기여기 Hello $name, you are $age, and you come from $country";
}

//optional positional parameters
String saySogae(String name, int age, [String? country = 'cuba']) =>
    'Hello $name, you are $age years old from $country';

// QQ operator
// ?? --> question question or QQ operator
// ??= --> QQ equals or QQ assignment operator

// 개선전
String capitalizeName(String? name) {
  if (name != null) {
    return name.toUpperCase();
  }
  return 'ANON';
}

// 첫번째 개선후
String capitalizeName1(String? name) =>
    name != null ? name.toUpperCase() : 'ANON';
// 두번째 개선후
String capitalizeName2(String? name) => name?.toUpperCase() ?? 'ANON';
// ??를 중심으로 좌항이 null이면 우항을 return하고, 좌항이 null이 아니면 좌항을 return한다.

//Typedef --> 좀 더 간단한 데이터의 alias를 만들 때 사용함
typedef ListOfInts = List<int>;

ListOfInts reverseListOfNumbers(ListOfInts list) {
  var reversed = list.reversed;
  return reversed.toList();
}

typedef UserInfo = Map<String, String>;

String sayHey(UserInfo userinfo) {
  return "Hey ${userinfo['name']}";
}

void main() {
  print(sayHey({'name': 'seonghyeon'}));

  //null aware operator
  String? name101;
  name101 ??= 'SH';
  //name101이 null이면 우항을 좌항에 할당하여라
  print(name101);
  name101 = null;
  print(name101);
  name101 ??= 'another SH';
  print(name101);

  //QQ operator
  print(capitalizeName('seonghyeoneee'));

  print(sayAnnyeong(name: "박성현", age: 31, country: "Republic of Korea"));
  var results = saySogae('SH', 31);
  print(results);
  // 함수나 메소드 내부에 지역 변수를 선언할 때에는 var를 사용한다.(dart에서는 타입보다는 var로 변수를 정의하길 권장한다.)
  // class에서 변수나 property를 선언할 때에는 타입을 지정해줘야 한다.

  // 데이터의 타입만 유지한다면 변수는 업데이트 가능하다.

  // String name = "SH";

  // 아래와 같이 쓰면 dynamic 변수가 되어서, 변수를 다른 타입으로 업데이트 할 수 있는데, 권장되진 않는다.
  // 하지만 dynamic을 사용할 수 밖에 없는 상황이 있음.

  var name;
  //dynamic name; 이렇게도 사용할 수 있겠지
  // name = "성현";
  // name = 1;
  // name = true;
  if (name is String) {
    // name.
    //위와 같이 .을 찍으면 이 블럭안에서는 name이 string인 것이 확인되어 string에서 사용될 수 있는 많은 메소드들을 확인할 수 있게된다.
  }
  if (name is int) {
    // name.
  }
  //null safety는 개발자가 null값을 참조할 수 없도록 하는 것 or 어떤 변수 혹은 데이터가 null이 될 수 있읨을 명시하는 것을 말해줌
  String? SH = 'SH';
  //위와 같이 타입뒤에 ?를 넣으면 SH 변수가 null일 수도, String일 수도 있다는 것을 의미한다.
  SH = null;
  // 그렇기에 위의 코드가 ?가 없을때에는 사용할 수가 없었지만, ?가 있을때에는 사용할 수 있게 된다.
  if (SH != null) {
    SH.isEmpty;
  }
  //위의 코드는 굉장히 길지 그렇기 때문에 아래와 같이 축약형으로 사용할 수도 있음
  SH?.isEmpty;
  //변수 뒤에 ?를 붙이면 null이 아닐때를 의미함 그러니까 위의 코드의 의미는 SH가 null이 아니라면 isNotEmpty 속성을 달라고 하는 것음

  final yourName = "홍길동";
  // yourName = "안돼네";
  // 한 번 정의된 변수를 수정할 수 없게 만들려면 final을 사용하삼
  // final은 javascript나 typescript에서 const와 같은 기능

  late final String sth;
  // api 작업 등을 실행 후
  sth = "asdf";
  // late는 final이나 var의 수식어 처럼 사용되고,
  // 변수에 데이터를 나중에 담을 수 있게 해 줌
  // late의 특성상 데이터가 담기지 않을때는 변수를 사용할 수 없고, 이 부분을 dart가 알려주기 때문에,
  // 실수를 줄일 수 있음
  // flutter에서 api를 통해 데이터를 얻어올 때 많이 쓸 것임

  // dart에서의 const? --> compile time constant를 만들어 줌
  // javascript에서의 const는 오히려, dart에서의 final과 유사하다.
  const age = 12;
  // final과 마찬가지로 오른쪽 처럼 다시 재할당은 불가함 age = 11;
  // compile time constant란 컴파일 할 때 알고있어야하는 값을 의미함.
  // 즉, 사용자가 fetchAPI를 이용해 가져와 할당되는 변수는 const에 담길 수가 없는 것임
  // 하드코딩된 값만 const에 담을 것
  // ex) const max_allowed_price = 120;과 같은 값들이 들어가야함
  // ex) const API_KEY = 'asdfas;dlkfj;alksdj';

  //dart's basic data type
  String Name = 'asdf';
  bool Alive = true;
  int Age = 1;
  double money = 1.11;

  num x = 12;
  x = 12.11;

  // List's collection if
  var makeNumFive = true;
  var numbers = [
    1,
    2,
    3,
    4,
    if (makeNumFive) 5,
  ];

  print(numbers);

  // string interpolation
  var name1 = "박성현";
  var age1 = 12;
  var greeting = "안녕! 내 이름은 $name1이고 나이는 ${age1 + 18}살 이야";

  print(greeting);

  // collection for
  var oldFriends = [
    "jongmin",
    "hanwool",
  ];
  var newFriends = [
    "youngduck",
    "jaehyun",
    for (var friend in oldFriends) "❤️ $friend"
  ];

  print(newFriends);

  var player = {
    'name': 'SH',
    'xp': 999.999,
    'superpower': true,
  };
  //위의 Map은 key : String, value : Object로 되어있는데,
  //Dart에서는 모든 것이 Object로 되어있어서 typescript의 any를 표현하고 싶다면 Object를 사용하면 된다.

  Map<int, bool> teachers = {1: true, 2: false, 3: false};

  Map<List<int>, bool> example = {
    [1, 2, 3, 4, 5]: true,
  };

  //권장하지는 않지만 아래와 같은 형태로 가능하다.
  List<Map<String, Object>> randoms = [
    {
      '홍길동': '바보',
      'level': 999,
    },
    {
      '홍길동': '바보',
      'level': 999,
    },
  ];

  var veryNumbers = {
    1,
    2,
    3,
    4,
  };
  //위 var대신에 Set<int>를 사용할 수도 있다.

  veryNumbers.add(1);
  veryNumbers.add(1);
  veryNumbers.add(1);
  veryNumbers.add(1);
  veryNumbers.add(1);
  //Set과 List의 차이점은 Set은 모든 요소가 유니크해야 한다는 점이다.
  //그렇기에 위와 같이 실행을 해도 1은 하나만 보이게 된다.

  print(veryNumbers);
}

//Defining a Functions
void sayHello(String name) {
  print("Hello $name nice to meet you🥰");
}

//void는 무엇을 의미하는가?
//void는 함수가 아무것도 return하지 않는다는 의미다.
//그러므로 아래와 같은 코드를 작성할 경우에는 error가 발생하게 됨
// void sayHi(String name) {
//   return "Hi $name nice to meet you🥰";
// }
//그럴때는 아래와 같이 정의해주면 됨. 리턴하는 값의 type을 function 대신에 넣어줄 것
String sayHi(String name) {
  return "Hi $name nice to meet you🥰";
}

//아래와 같이 화살표 함수로 표현할 수도 있다. return하는 한줄의 함수의 경우 =>를 사용할 것
num plus(num a, num b) => a + b;
