bool localAuth({
  required String login,
  required String password,
}) {
  if (login == 'admin' && password == 'adminpassword') {
    return true;
  } else {
    return false;
  }
}