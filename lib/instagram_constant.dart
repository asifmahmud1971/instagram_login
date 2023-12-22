class InstagramConstant {
  static InstagramConstant? _instance;
  static InstagramConstant get instance {
    _instance ??= InstagramConstant._init();
    return _instance!;
  }

  InstagramConstant._init();

  static const String clientID = '1082949826044789';
  static const String appSecret = 'c8a8e7e4a5de68d4f6739c788abba0c0';
  static const String redirectUri = 'https://www.asifmahmud.me/';
  static const String scope = 'user_profile,user_media';
  static const String responseType = 'code';
  final String url =
      'https://api.instagram.com/oauth/authorize?client_id=$clientID&redirect_uri=$redirectUri&scope=user_profile,user_media&response_type=$responseType';
}
