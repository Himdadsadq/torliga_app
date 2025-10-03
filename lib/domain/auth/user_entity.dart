import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String userName;
  @HiveField(2)
  final String firstName;
  @HiveField(3)
  final String lastName;
  @HiveField(4)
  final String? phone;
  @HiveField(5)
  final String email;
   @HiveField(6)
  final String? stripeId;
   @HiveField(7)
  final String? pmType;
   @HiveField(8)
  final String? pmLastFour;
   @HiveField(9)
  final String? trialEndsAt;
   @HiveField(10)
  final String countryId;
   @HiveField(11)
  final String? emailVerifiedAt;
   @HiveField(12)
  final String? phoneVerifiedAt;
   @HiveField(13)
  final String password;
   @HiveField(14)
  final String? subscriptionEndDate;
   @HiveField(15)
  final bool canceledSub;
   @HiveField(16)
  final String? socialiteName;
   @HiveField(17)
  final String? socialiteId;
   @HiveField(18)
  final bool isNewUser;
   @HiveField(19)
  final String? purchaseId;
   @HiveField(20)
  final int h2hContest;
   @HiveField(21)
  final bool gotFreeCoin;
    @HiveField(22)
  final String? profileUpdatedAt;
   @HiveField(23)
  final String lastLoginAt;
   @HiveField(24)
  final String? rememberToken;
    @HiveField(25)
  final String createdAt;
    @HiveField(26)
  final String updatedAt;
   @HiveField(27)
  final String? deletedAt;
   @HiveField(28)
  final bool hasSubscription;
    @HiveField(29)
  final bool isVerified;
    @HiveField(30)
  final String image;

  User({
    required this.id,
    required this.userName,
    required this.firstName,
    required this.lastName,
    this.phone,
    required this.email,
    required this.stripeId,
    this.pmType,
    this.pmLastFour,
    this.trialEndsAt,
    required this.countryId,
    this.emailVerifiedAt,
    this.phoneVerifiedAt,
    required this.password,
    this.subscriptionEndDate,
    required this.canceledSub,
    this.socialiteName,
    this.socialiteId,
    required this.isNewUser,
    this.purchaseId,
    required this.h2hContest,
    required this.gotFreeCoin,
    this.profileUpdatedAt,
    required this.lastLoginAt,
    this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.hasSubscription,
    required this.isVerified,
    required this.image,
  });
}