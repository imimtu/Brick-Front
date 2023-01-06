/// enums for API Request on Brick

enum APIHost {
  beta,
  release,

  // Developers' local
  kangmin,
}

enum APIHeader {
  cors, // cors 허용 헤더
  chrome, // chrome 허용 헤더
  json, // json 전송 헤더
  image, // image 전송 헤더
}

enum APIRoutes {
  login, // 로그인 요청 경로
  todolist, // todo list 관련 요청 경로
}
