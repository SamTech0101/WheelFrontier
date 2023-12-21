// dio error codes and two helper method to know that dio error belongs to 400 or
// 500 status codes or not

const DioError400 = 'Http status error [400]';
const DioError401 = 'Http status error [401]';
const DioError402 = 'Http status error [402]';
const DioError403 = 'Http status error [403]';
const DioError404 = 'Http status error [404]';
const DioError413 = 'Http status error [413]';
const DioError422 = 'Http status error [422]';
const DioError500 = 'Http status error [500]';
const DioError501 = 'Http status error [501]';
const DioError502 = 'Http status error [502]';
const DioError503 = 'Http status error [503]';

bool is400StatusCodeFamily(String dioError) {
  if (dioError == DioError400 ||
      dioError == DioError401 ||
      dioError == DioError402 ||
      dioError == DioError403 ||
      dioError == DioError404 ||
      dioError == DioError422) {
    return true;
  } else {
    return false;
  }
}

bool is500StatusCodeFamily(String dioError) {
  if (dioError == DioError500 ||
      dioError == DioError501 ||
      dioError == DioError502 ||
      dioError == DioError503) {
    return true;
  } else {
    return false;
  }
}
