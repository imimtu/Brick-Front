// ignore_for_file: constant_identifier_names

part of brick.domain.helpers.api_requester;

// API 요청에서 발생 할 수 있는 에러
enum APIErrors {
  // ----- FRONT ONLY
  UNEXPECTED,
  NETWORK,
  NO_RESULT,
  INVALID_INPUT,

  // ----- BACK RESULT
  // USER
  DUPLICATED_USER_NAME,
  USER_NOT_FOUND,

  // BRICK
  BRICK_NOT_FOUND,

  // HASHTAG
  HASHTAG_NOT_FOUND,

  // AUTH
  INVALID_PASSWORD,
  INVALID_PERMISSION,
  INVALID_TOKEN,

  // SERVER ERROR
  INTERNAL_SERVER_ERROR,
}

extension APIErrorsExtension on APIErrors {
  String toMsg() {
    String result = '';

    switch (this) {
      case APIErrors.UNEXPECTED:
        result = "알수 없는 오류로 요청에 실패했습니다.";
        break;
      case APIErrors.NETWORK:
        result = "네트워크 연결 오류로 요청에 실패했습니다. 네트워크 연결 상태를 확인해 주세요.";
        break;
      case APIErrors.NO_RESULT:
        result = "결과가 존재하지 않습니다.";
        break;
      case APIErrors.INVALID_INPUT:
        result = "입력 값을 확인해주세요.";
        break;
      case APIErrors.DUPLICATED_USER_NAME:
        result = "중복된 사용자 이름입니다.";
        break;
      case APIErrors.USER_NOT_FOUND:
        result = "사용자를 찾을 수 없습니다.";
        break;
      case APIErrors.BRICK_NOT_FOUND:
        result = "Brick을 찾을 수 없습니다.";
        break;
      case APIErrors.HASHTAG_NOT_FOUND:
        result = "HashTag를 찾을 수 없습니다.";
        break;
      case APIErrors.INVALID_PASSWORD:
        result = "유효하지 않은 비밀번호 입니다.";
        break;
      case APIErrors.INVALID_PERMISSION:
        result = "유효하지 않은 권한 입니다.";
        break;
      case APIErrors.INVALID_TOKEN:
        result = "유효하지 않은 토큰 입니다.";
        break;
      case APIErrors.INTERNAL_SERVER_ERROR:
        result = "서버 에러 발생.";
        break;
    }

    return result;
  }
}

APIErrors apiErrorsFromResultCode(String resultCode) {
  APIErrors apiErrors;

  try {
    apiErrors = APIErrors.values.byName(resultCode);
  } catch (e) {
    apiErrors = APIErrors.UNEXPECTED;
  }

  return apiErrors;
}
