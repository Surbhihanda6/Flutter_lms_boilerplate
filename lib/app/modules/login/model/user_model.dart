class UserModel {
  final UserSession userSession;
  final User user;
  final List<String> roles;
  final UserProfile userProfile;
  final List<ModuleAccess> modulesAccess;
  final String message;

  UserModel({
    required this.userSession,
    required this.user,
    required this.roles,
    required this.userProfile,
    required this.modulesAccess,
    required this.message,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return UserModel(
      userSession: UserSession.fromJson(data['userSession']),
      user: User.fromJson(data['user']),
      roles: List<String>.from(data['roles']),
      userProfile: UserProfile.fromJson(data['userProfile']),
      modulesAccess: (data['ModulesAccess'] as List)
          .map((item) => ModuleAccess.fromJson(item))
          .toList(),
      message: data['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userSession': userSession.toJson(),
      'user': user.toJson(),
      'roles': roles,
      'userProfile': userProfile.toJson(),
      'ModulesAccess': modulesAccess.map((item) => item.toJson()).toList(),
      'message': message,
    };
  }
}

class UserSession {
  final String accessToken;
  final String refreshToken;
  final String sessionId;

  UserSession({
    required this.accessToken,
    required this.refreshToken,
    required this.sessionId,
  });

  factory UserSession.fromJson(Map<String, dynamic> json) {
    return UserSession(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      sessionId: json['sessionId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'sessionId': sessionId,
    };
  }
}

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String dregNo;
  final String email;
  final String mobile;
  final String dialCode;
  final String countryCode;
  final String timezone;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dregNo,
    required this.email,
    required this.mobile,
    required this.dialCode,
    required this.countryCode,
    required this.timezone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      dregNo: json['dregNo'],
      email: json['email'],
      mobile: json['mobile'],
      dialCode: json['dialCode'],
      countryCode: json['countryCode'],
      timezone: json['timezone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'dregNo': dregNo,
      'email': email,
      'mobile': mobile,
      'dialCode': dialCode,
      'countryCode': countryCode,
      'timezone': timezone,
    };
  }
}

class UserProfile {
  final String? profileUrl;

  UserProfile({this.profileUrl});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      profileUrl: json['profileUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profileUrl': profileUrl,
    };
  }
}

class ModuleAccess {
  final int order;
  final String name;
  final String? redirectLink;
  final String icon;
  final List<Submenu> submenus;

  ModuleAccess({
    required this.order,
    required this.name,
    required this.icon,
    required this.submenus,
    this.redirectLink,
  });

  factory ModuleAccess.fromJson(Map<String, dynamic> json) {
    return ModuleAccess(
      order: json['order'],
      name: json['name'],
      redirectLink: json['redirectLink'],
      icon: json['icon'],
      submenus: (json['submenus'] as List)
          .map((item) => Submenu.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order': order,
      'name': name,
      'redirectLink': redirectLink,
      'icon': icon,
      'submenus': submenus.map((item) => item.toJson()).toList(),
    };
  }
}

class Submenu {
  final String name;
  final String? redirectLink;
  final String icon;
  final bool canView;
  final bool canCreate;
  final bool canUpdate;
  final bool canDelete;

  Submenu({
    required this.name,
    required this.icon,
    required this.canView,
    required this.canCreate,
    required this.canUpdate,
    required this.canDelete,
    this.redirectLink,
  });

  factory Submenu.fromJson(Map<String, dynamic> json) {
    return Submenu(
      name: json['name'],
      redirectLink: json['redirectLink'],
      icon: json['icon'],
      canView: json['can_view'],
      canCreate: json['can_create'],
      canUpdate: json['can_update'],
      canDelete: json['can_delete'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'redirectLink': redirectLink,
      'icon': icon,
      'can_view': canView,
      'can_create': canCreate,
      'can_update': canUpdate,
      'can_delete': canDelete,
    };
  }
}
