import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  /// No description provided for @appName.
  ///
  /// In vi, this message translates to:
  /// **'AI Fitness Coach'**
  String get appName;

  /// No description provided for @commonContinue.
  ///
  /// In vi, this message translates to:
  /// **'Tiếp tục'**
  String get commonContinue;

  /// No description provided for @commonNone.
  ///
  /// In vi, this message translates to:
  /// **'Không có'**
  String get commonNone;

  /// No description provided for @commonEdit.
  ///
  /// In vi, this message translates to:
  /// **'Sửa'**
  String get commonEdit;

  /// No description provided for @commonYes.
  ///
  /// In vi, this message translates to:
  /// **'Có'**
  String get commonYes;

  /// No description provided for @commonNo.
  ///
  /// In vi, this message translates to:
  /// **'Không'**
  String get commonNo;

  /// No description provided for @commonBack.
  ///
  /// In vi, this message translates to:
  /// **'Quay lại'**
  String get commonBack;

  /// No description provided for @commonDelete.
  ///
  /// In vi, this message translates to:
  /// **'Xóa'**
  String get commonDelete;

  /// No description provided for @localeVietnamese.
  ///
  /// In vi, this message translates to:
  /// **'VI'**
  String get localeVietnamese;

  /// No description provided for @localeEnglish.
  ///
  /// In vi, this message translates to:
  /// **'EN'**
  String get localeEnglish;

  /// No description provided for @sexMale.
  ///
  /// In vi, this message translates to:
  /// **'Nam'**
  String get sexMale;

  /// No description provided for @sexFemale.
  ///
  /// In vi, this message translates to:
  /// **'Nữ'**
  String get sexFemale;

  /// No description provided for @sexOther.
  ///
  /// In vi, this message translates to:
  /// **'Khác'**
  String get sexOther;

  /// No description provided for @experienceBeginner.
  ///
  /// In vi, this message translates to:
  /// **'Mới bắt đầu'**
  String get experienceBeginner;

  /// No description provided for @experienceIntermediate.
  ///
  /// In vi, this message translates to:
  /// **'Trung bình'**
  String get experienceIntermediate;

  /// No description provided for @experienceAdvanced.
  ///
  /// In vi, this message translates to:
  /// **'Nâng cao'**
  String get experienceAdvanced;

  /// No description provided for @injuryAreaKnee.
  ///
  /// In vi, this message translates to:
  /// **'Đầu gối'**
  String get injuryAreaKnee;

  /// No description provided for @injuryAreaShoulder.
  ///
  /// In vi, this message translates to:
  /// **'Vai'**
  String get injuryAreaShoulder;

  /// No description provided for @injuryAreaLowerBack.
  ///
  /// In vi, this message translates to:
  /// **'Lưng dưới'**
  String get injuryAreaLowerBack;

  /// No description provided for @injuryAreaAnkle.
  ///
  /// In vi, this message translates to:
  /// **'Cổ chân'**
  String get injuryAreaAnkle;

  /// No description provided for @injuryAreaWrist.
  ///
  /// In vi, this message translates to:
  /// **'Cổ tay'**
  String get injuryAreaWrist;

  /// No description provided for @injuryAreaOther.
  ///
  /// In vi, this message translates to:
  /// **'Khác'**
  String get injuryAreaOther;

  /// No description provided for @severityMild.
  ///
  /// In vi, this message translates to:
  /// **'Nhẹ'**
  String get severityMild;

  /// No description provided for @severityModerate.
  ///
  /// In vi, this message translates to:
  /// **'Vừa'**
  String get severityModerate;

  /// No description provided for @severitySevere.
  ///
  /// In vi, this message translates to:
  /// **'Nặng'**
  String get severitySevere;

  /// No description provided for @mobilityDeepSquat.
  ///
  /// In vi, this message translates to:
  /// **'Khó squat sâu'**
  String get mobilityDeepSquat;

  /// No description provided for @mobilityOverhead.
  ///
  /// In vi, this message translates to:
  /// **'Khó đưa tay qua đầu'**
  String get mobilityOverhead;

  /// No description provided for @mobilityHipHinge.
  ///
  /// In vi, this message translates to:
  /// **'Khó gập hông'**
  String get mobilityHipHinge;

  /// No description provided for @mobilityRunning.
  ///
  /// In vi, this message translates to:
  /// **'Khó chạy/nhảy'**
  String get mobilityRunning;

  /// No description provided for @equipmentDumbbell.
  ///
  /// In vi, this message translates to:
  /// **'Tạ đơn'**
  String get equipmentDumbbell;

  /// No description provided for @equipmentResistanceBand.
  ///
  /// In vi, this message translates to:
  /// **'Dây kháng lực'**
  String get equipmentResistanceBand;

  /// No description provided for @equipmentPullupBar.
  ///
  /// In vi, this message translates to:
  /// **'Xà đơn'**
  String get equipmentPullupBar;

  /// No description provided for @equipmentFullGym.
  ///
  /// In vi, this message translates to:
  /// **'Gym đầy đủ'**
  String get equipmentFullGym;

  /// No description provided for @spaceHome.
  ///
  /// In vi, this message translates to:
  /// **'Ở nhà'**
  String get spaceHome;

  /// No description provided for @spaceGym.
  ///
  /// In vi, this message translates to:
  /// **'Phòng gym'**
  String get spaceGym;

  /// No description provided for @spaceOutdoor.
  ///
  /// In vi, this message translates to:
  /// **'Ngoài trời'**
  String get spaceOutdoor;

  /// No description provided for @spaceMinimal.
  ///
  /// In vi, this message translates to:
  /// **'Rất ít chỗ'**
  String get spaceMinimal;

  /// No description provided for @budgetNone.
  ///
  /// In vi, this message translates to:
  /// **'Không — dùng những gì đang có'**
  String get budgetNone;

  /// No description provided for @budgetMinimal.
  ///
  /// In vi, this message translates to:
  /// **'Có thể mua món nhỏ, giá thấp'**
  String get budgetMinimal;

  /// No description provided for @budgetInvest.
  ///
  /// In vi, this message translates to:
  /// **'Sẵn sàng đầu tư nếu cần'**
  String get budgetInvest;

  /// No description provided for @dietOmnivore.
  ///
  /// In vi, this message translates to:
  /// **'Ăn đa dạng'**
  String get dietOmnivore;

  /// No description provided for @dietVegetarian.
  ///
  /// In vi, this message translates to:
  /// **'Ăn chay có trứng/sữa'**
  String get dietVegetarian;

  /// No description provided for @dietVegan.
  ///
  /// In vi, this message translates to:
  /// **'Thuần chay'**
  String get dietVegan;

  /// No description provided for @dietPescatarian.
  ///
  /// In vi, this message translates to:
  /// **'Có ăn cá'**
  String get dietPescatarian;

  /// No description provided for @dietOther.
  ///
  /// In vi, this message translates to:
  /// **'Khác'**
  String get dietOther;

  /// No description provided for @weekdayMonShort.
  ///
  /// In vi, this message translates to:
  /// **'T2'**
  String get weekdayMonShort;

  /// No description provided for @weekdayTueShort.
  ///
  /// In vi, this message translates to:
  /// **'T3'**
  String get weekdayTueShort;

  /// No description provided for @weekdayWedShort.
  ///
  /// In vi, this message translates to:
  /// **'T4'**
  String get weekdayWedShort;

  /// No description provided for @weekdayThuShort.
  ///
  /// In vi, this message translates to:
  /// **'T5'**
  String get weekdayThuShort;

  /// No description provided for @weekdayFriShort.
  ///
  /// In vi, this message translates to:
  /// **'T6'**
  String get weekdayFriShort;

  /// No description provided for @weekdaySatShort.
  ///
  /// In vi, this message translates to:
  /// **'T7'**
  String get weekdaySatShort;

  /// No description provided for @weekdaySunShort.
  ///
  /// In vi, this message translates to:
  /// **'CN'**
  String get weekdaySunShort;

  /// No description provided for @unitYears.
  ///
  /// In vi, this message translates to:
  /// **'tuổi'**
  String get unitYears;

  /// No description provided for @unitCm.
  ///
  /// In vi, this message translates to:
  /// **'cm'**
  String get unitCm;

  /// No description provided for @unitKg.
  ///
  /// In vi, this message translates to:
  /// **'kg'**
  String get unitKg;

  /// No description provided for @unitMinutes.
  ///
  /// In vi, this message translates to:
  /// **'phút'**
  String get unitMinutes;

  /// No description provided for @accountEyebrow.
  ///
  /// In vi, this message translates to:
  /// **'Hồ sơ của bạn sẽ được lưu'**
  String get accountEyebrow;

  /// No description provided for @accountHeadline.
  ///
  /// In vi, this message translates to:
  /// **'Tạo tài khoản\ntrước khi bắt đầu.'**
  String get accountHeadline;

  /// No description provided for @accountBody.
  ///
  /// In vi, this message translates to:
  /// **'Kế hoạch sẽ tiếp tục học từ từng buổi tập. Cần một tài khoản để giữ hồ sơ và lịch sử của bạn.'**
  String get accountBody;

  /// No description provided for @accountAppleCta.
  ///
  /// In vi, this message translates to:
  /// **'Tiếp tục với Apple'**
  String get accountAppleCta;

  /// No description provided for @accountDividerOr.
  ///
  /// In vi, this message translates to:
  /// **'hoặc'**
  String get accountDividerOr;

  /// No description provided for @accountEmailHint.
  ///
  /// In vi, this message translates to:
  /// **'Email của bạn'**
  String get accountEmailHint;

  /// No description provided for @accountEmailCta.
  ///
  /// In vi, this message translates to:
  /// **'Tiếp tục bằng email'**
  String get accountEmailCta;

  /// No description provided for @accountDisclaimer.
  ///
  /// In vi, this message translates to:
  /// **'Demo giao diện — không gửi hoặc lưu dữ liệu thật.'**
  String get accountDisclaimer;

  /// No description provided for @accountInvalidEmail.
  ///
  /// In vi, this message translates to:
  /// **'Hãy nhập email hợp lệ'**
  String get accountInvalidEmail;

  /// No description provided for @welcomeStepBadge.
  ///
  /// In vi, this message translates to:
  /// **'BƯỚC ĐẦU'**
  String get welcomeStepBadge;

  /// No description provided for @welcomeEyebrow.
  ///
  /// In vi, this message translates to:
  /// **'Không chọn plan từ menu'**
  String get welcomeEyebrow;

  /// No description provided for @welcomeHeadline.
  ///
  /// In vi, this message translates to:
  /// **'Hãy kể điều\nbạn đang gặp.'**
  String get welcomeHeadline;

  /// No description provided for @welcomeBody.
  ///
  /// In vi, this message translates to:
  /// **'Bạn kể bằng ngôn ngữ của mình. Sau đó chúng tôi chỉ hỏi thêm những dữ liệu cần để tạo plan an toàn và khả thi.'**
  String get welcomeBody;

  /// No description provided for @welcomeCta.
  ///
  /// In vi, this message translates to:
  /// **'Kể tình huống của tôi'**
  String get welcomeCta;

  /// No description provided for @storyTitle.
  ///
  /// In vi, this message translates to:
  /// **'Tình huống & mục tiêu'**
  String get storyTitle;

  /// No description provided for @storyHeadline.
  ///
  /// In vi, this message translates to:
  /// **'Điều gì khiến bạn\nmuốn bắt đầu lúc này?'**
  String get storyHeadline;

  /// No description provided for @storyBody.
  ///
  /// In vi, this message translates to:
  /// **'Kể về điều bạn đang gặp và kết quả bạn muốn hướng tới.'**
  String get storyBody;

  /// No description provided for @storyLabel.
  ///
  /// In vi, this message translates to:
  /// **'Tình huống của bạn'**
  String get storyLabel;

  /// No description provided for @storyHint.
  ///
  /// In vi, this message translates to:
  /// **'Ví dụ: Tôi mới quay lại đá bóng nhưng nhanh xuống sức...'**
  String get storyHint;

  /// No description provided for @storyGoalLabel.
  ///
  /// In vi, this message translates to:
  /// **'Bạn muốn cải thiện điều gì?'**
  String get storyGoalLabel;

  /// No description provided for @storyGoalHint.
  ///
  /// In vi, this message translates to:
  /// **'Mỗi dòng là một mục tiêu...'**
  String get storyGoalHint;

  /// No description provided for @storyCharCount.
  ///
  /// In vi, this message translates to:
  /// **'{count} ký tự'**
  String storyCharCount(int count);

  /// No description provided for @storyRequired.
  ///
  /// In vi, this message translates to:
  /// **'Hãy kể một chút về tình huống của bạn'**
  String get storyRequired;

  /// No description provided for @basicsTitle.
  ///
  /// In vi, this message translates to:
  /// **'Thông tin cơ bản'**
  String get basicsTitle;

  /// No description provided for @basicsHeadline.
  ///
  /// In vi, this message translates to:
  /// **'Một vài thông tin\nvề bạn.'**
  String get basicsHeadline;

  /// No description provided for @basicsBody.
  ///
  /// In vi, this message translates to:
  /// **'Giúp kế hoạch phù hợp hơn với thể trạng và kinh nghiệm hiện tại.'**
  String get basicsBody;

  /// No description provided for @basicsSexLabel.
  ///
  /// In vi, this message translates to:
  /// **'Giới tính'**
  String get basicsSexLabel;

  /// No description provided for @basicsAgeLabel.
  ///
  /// In vi, this message translates to:
  /// **'Tuổi'**
  String get basicsAgeLabel;

  /// No description provided for @basicsExperienceLabel.
  ///
  /// In vi, this message translates to:
  /// **'Kinh nghiệm'**
  String get basicsExperienceLabel;

  /// No description provided for @basicsHeightLabel.
  ///
  /// In vi, this message translates to:
  /// **'Chiều cao'**
  String get basicsHeightLabel;

  /// No description provided for @basicsWeightLabel.
  ///
  /// In vi, this message translates to:
  /// **'Cân nặng'**
  String get basicsWeightLabel;

  /// No description provided for @safetyTitle.
  ///
  /// In vi, this message translates to:
  /// **'Chấn thương & vận động'**
  String get safetyTitle;

  /// No description provided for @safetyHeadline.
  ///
  /// In vi, this message translates to:
  /// **'Có điều gì cần\nđược lưu ý?'**
  String get safetyHeadline;

  /// No description provided for @safetyBody.
  ///
  /// In vi, this message translates to:
  /// **'Cho biết các vùng đang đau hoặc những động tác bạn thấy khó thực hiện.'**
  String get safetyBody;

  /// No description provided for @safetyInjuryQuestion.
  ///
  /// In vi, this message translates to:
  /// **'Bạn có đang bị đau hoặc chấn thương?'**
  String get safetyInjuryQuestion;

  /// No description provided for @safetyInjuryNotesHint.
  ///
  /// In vi, this message translates to:
  /// **'Khi nào đau? Động tác nào gây khó chịu?'**
  String get safetyInjuryNotesHint;

  /// No description provided for @safetyInjuryActive.
  ///
  /// In vi, this message translates to:
  /// **'Hiện vẫn còn triệu chứng'**
  String get safetyInjuryActive;

  /// No description provided for @safetyAddInjury.
  ///
  /// In vi, this message translates to:
  /// **'+ Thêm vùng khác'**
  String get safetyAddInjury;

  /// No description provided for @safetyExtraInjury.
  ///
  /// In vi, this message translates to:
  /// **'Vùng bổ sung'**
  String get safetyExtraInjury;

  /// No description provided for @safetyMobilityLabel.
  ///
  /// In vi, this message translates to:
  /// **'Hạn chế vận động'**
  String get safetyMobilityLabel;

  /// No description provided for @contextTitle.
  ///
  /// In vi, this message translates to:
  /// **'Điều kiện tập luyện'**
  String get contextTitle;

  /// No description provided for @contextHeadline.
  ///
  /// In vi, this message translates to:
  /// **'Bạn có thể tập\nkhi nào và ở đâu?'**
  String get contextHeadline;

  /// No description provided for @contextSpaceLabel.
  ///
  /// In vi, this message translates to:
  /// **'Không gian chính'**
  String get contextSpaceLabel;

  /// No description provided for @contextEquipmentLabel.
  ///
  /// In vi, this message translates to:
  /// **'Thiết bị đang có'**
  String get contextEquipmentLabel;

  /// No description provided for @contextBudgetLabel.
  ///
  /// In vi, this message translates to:
  /// **'Bạn có sẵn sàng mua thêm thiết bị?'**
  String get contextBudgetLabel;

  /// No description provided for @contextDurationLabel.
  ///
  /// In vi, this message translates to:
  /// **'Thời lượng mỗi buổi'**
  String get contextDurationLabel;

  /// No description provided for @contextTimeLabel.
  ///
  /// In vi, this message translates to:
  /// **'Giờ bắt đầu phù hợp'**
  String get contextTimeLabel;

  /// No description provided for @contextDaysLabel.
  ///
  /// In vi, this message translates to:
  /// **'Ngày bạn có thể tập'**
  String get contextDaysLabel;

  /// No description provided for @contextDayCount.
  ///
  /// In vi, this message translates to:
  /// **'{count, plural, other{{count} ngày đã chọn}}'**
  String contextDayCount(int count);

  /// No description provided for @contextNoDaySelected.
  ///
  /// In vi, this message translates to:
  /// **'Hãy chọn ít nhất một ngày có thể tập'**
  String get contextNoDaySelected;

  /// No description provided for @dietTitle.
  ///
  /// In vi, this message translates to:
  /// **'Ăn uống'**
  String get dietTitle;

  /// No description provided for @dietHeadline.
  ///
  /// In vi, this message translates to:
  /// **'Có điều gì về ăn uống\ncần được lưu ý?'**
  String get dietHeadline;

  /// No description provided for @dietBody.
  ///
  /// In vi, this message translates to:
  /// **'Cho biết chế độ ăn, dị ứng hoặc những món bạn cần tránh.'**
  String get dietBody;

  /// No description provided for @dietTypeLabel.
  ///
  /// In vi, this message translates to:
  /// **'Chế độ ăn'**
  String get dietTypeLabel;

  /// No description provided for @dietAllergiesLabel.
  ///
  /// In vi, this message translates to:
  /// **'Dị ứng thực phẩm'**
  String get dietAllergiesLabel;

  /// No description provided for @dietAllergiesHint.
  ///
  /// In vi, this message translates to:
  /// **'Ví dụ: đậu phộng, sữa...'**
  String get dietAllergiesHint;

  /// No description provided for @dietRestrictionsLabel.
  ///
  /// In vi, this message translates to:
  /// **'Hạn chế hoặc điều cần tránh'**
  String get dietRestrictionsLabel;

  /// No description provided for @dietRestrictionsHint.
  ///
  /// In vi, this message translates to:
  /// **'Ví dụ: không ăn được bữa lớn buổi sáng, hạn chế đồ cay...'**
  String get dietRestrictionsHint;

  /// No description provided for @reviewTitle.
  ///
  /// In vi, this message translates to:
  /// **'Xác nhận thông tin'**
  String get reviewTitle;

  /// No description provided for @reviewHeadline.
  ///
  /// In vi, this message translates to:
  /// **'Kiểm tra lại trước khi\ntạo kế hoạch.'**
  String get reviewHeadline;

  /// No description provided for @reviewBody.
  ///
  /// In vi, this message translates to:
  /// **'Bạn có thể quay lại sửa bất kỳ phần nào.'**
  String get reviewBody;

  /// No description provided for @reviewStorySection.
  ///
  /// In vi, this message translates to:
  /// **'Tình huống & mục tiêu'**
  String get reviewStorySection;

  /// No description provided for @reviewBodySection.
  ///
  /// In vi, this message translates to:
  /// **'Cơ thể & kinh nghiệm'**
  String get reviewBodySection;

  /// No description provided for @reviewSafetySection.
  ///
  /// In vi, this message translates to:
  /// **'Chấn thương & vận động'**
  String get reviewSafetySection;

  /// No description provided for @reviewContextSection.
  ///
  /// In vi, this message translates to:
  /// **'Điều kiện tập'**
  String get reviewContextSection;

  /// No description provided for @reviewDietSection.
  ///
  /// In vi, this message translates to:
  /// **'Ăn uống'**
  String get reviewDietSection;

  /// No description provided for @reviewNoStory.
  ///
  /// In vi, this message translates to:
  /// **'Chưa nhập tình huống'**
  String get reviewNoStory;

  /// No description provided for @reviewNoGoals.
  ///
  /// In vi, this message translates to:
  /// **'Chưa có mục tiêu riêng'**
  String get reviewNoGoals;

  /// No description provided for @reviewInjuryLabel.
  ///
  /// In vi, this message translates to:
  /// **'Chấn thương'**
  String get reviewInjuryLabel;

  /// No description provided for @reviewMobilityLabel.
  ///
  /// In vi, this message translates to:
  /// **'Hạn chế vận động'**
  String get reviewMobilityLabel;

  /// No description provided for @reviewEquipmentLabel.
  ///
  /// In vi, this message translates to:
  /// **'Thiết bị'**
  String get reviewEquipmentLabel;

  /// No description provided for @reviewBudgetLabel.
  ///
  /// In vi, this message translates to:
  /// **'Mua thêm thiết bị'**
  String get reviewBudgetLabel;

  /// No description provided for @reviewDurationLabel.
  ///
  /// In vi, this message translates to:
  /// **'Thời lượng'**
  String get reviewDurationLabel;

  /// No description provided for @reviewScheduleLabel.
  ///
  /// In vi, this message translates to:
  /// **'Ngày & giờ'**
  String get reviewScheduleLabel;

  /// No description provided for @reviewDietTypeLabel.
  ///
  /// In vi, this message translates to:
  /// **'Chế độ'**
  String get reviewDietTypeLabel;

  /// No description provided for @reviewAllergiesLabel.
  ///
  /// In vi, this message translates to:
  /// **'Dị ứng'**
  String get reviewAllergiesLabel;

  /// No description provided for @reviewRestrictionsLabel.
  ///
  /// In vi, this message translates to:
  /// **'Hạn chế'**
  String get reviewRestrictionsLabel;

  /// No description provided for @reviewMinutesPerSession.
  ///
  /// In vi, this message translates to:
  /// **'{count} phút / buổi'**
  String reviewMinutesPerSession(int count);

  /// No description provided for @reviewAgeValue.
  ///
  /// In vi, this message translates to:
  /// **'{count, plural, other{{count} tuổi}}'**
  String reviewAgeValue(int count);

  /// No description provided for @reviewInjuryStillActive.
  ///
  /// In vi, this message translates to:
  /// **'đang còn triệu chứng'**
  String get reviewInjuryStillActive;

  /// No description provided for @reviewInjuryResolved.
  ///
  /// In vi, this message translates to:
  /// **'đã ổn'**
  String get reviewInjuryResolved;

  /// No description provided for @reviewConfirmCheckbox.
  ///
  /// In vi, this message translates to:
  /// **'Tôi xác nhận các thông tin trên là chính xác.'**
  String get reviewConfirmCheckbox;

  /// No description provided for @reviewGenerateCta.
  ///
  /// In vi, this message translates to:
  /// **'Xác nhận và tạo kế hoạch'**
  String get reviewGenerateCta;

  /// No description provided for @loadingEyebrow.
  ///
  /// In vi, this message translates to:
  /// **'Đang tạo kế hoạch'**
  String get loadingEyebrow;

  /// No description provided for @loadingTitle1.
  ///
  /// In vi, this message translates to:
  /// **'Đang hiểu tình huống của bạn...'**
  String get loadingTitle1;

  /// No description provided for @loadingTitle2.
  ///
  /// In vi, this message translates to:
  /// **'Đang sắp xếp ưu tiên...'**
  String get loadingTitle2;

  /// No description provided for @loadingTitle3.
  ///
  /// In vi, this message translates to:
  /// **'Đang chọn bài tập phù hợp...'**
  String get loadingTitle3;

  /// No description provided for @loadingTitle4.
  ///
  /// In vi, this message translates to:
  /// **'Đang hoàn thiện kế hoạch...'**
  String get loadingTitle4;

  /// No description provided for @loadingBody.
  ///
  /// In vi, this message translates to:
  /// **'Kế hoạch đang được sắp xếp theo mục tiêu, lịch tập và điều kiện bạn đã chọn.'**
  String get loadingBody;

  /// No description provided for @loadingStage1.
  ///
  /// In vi, this message translates to:
  /// **'Xác định điều bạn muốn cải thiện'**
  String get loadingStage1;

  /// No description provided for @loadingStage2.
  ///
  /// In vi, this message translates to:
  /// **'Sắp xếp thứ tự ưu tiên'**
  String get loadingStage2;

  /// No description provided for @loadingStage3.
  ///
  /// In vi, this message translates to:
  /// **'Chọn lịch và bài tập phù hợp'**
  String get loadingStage3;

  /// No description provided for @loadingStage4.
  ///
  /// In vi, this message translates to:
  /// **'Hoàn thiện hướng dẫn cho bạn'**
  String get loadingStage4;

  /// No description provided for @planTitle.
  ///
  /// In vi, this message translates to:
  /// **'Kế hoạch của bạn'**
  String get planTitle;

  /// No description provided for @planRestart.
  ///
  /// In vi, this message translates to:
  /// **'Làm lại'**
  String get planRestart;

  /// No description provided for @planEyebrow.
  ///
  /// In vi, this message translates to:
  /// **'Lộ trình 8 tuần'**
  String get planEyebrow;

  /// No description provided for @planTimelineEyebrow.
  ///
  /// In vi, this message translates to:
  /// **'Tiến trình'**
  String get planTimelineEyebrow;

  /// No description provided for @planTimelineHeadline.
  ///
  /// In vi, this message translates to:
  /// **'Hai giai đoạn, một hướng đi'**
  String get planTimelineHeadline;

  /// No description provided for @planNeedsEyebrow.
  ///
  /// In vi, this message translates to:
  /// **'Mục tiêu & ưu tiên'**
  String get planNeedsEyebrow;

  /// No description provided for @planRationaleEyebrow.
  ///
  /// In vi, this message translates to:
  /// **'Vì sao kế hoạch này phù hợp'**
  String get planRationaleEyebrow;

  /// No description provided for @planNutritionTitle.
  ///
  /// In vi, this message translates to:
  /// **'Mục tiêu dinh dưỡng mỗi ngày'**
  String get planNutritionTitle;

  /// No description provided for @planCaloriesCaption.
  ///
  /// In vi, this message translates to:
  /// **'kcal / ngày'**
  String get planCaloriesCaption;

  /// No description provided for @planProteinCaption.
  ///
  /// In vi, this message translates to:
  /// **'protein / ngày'**
  String get planProteinCaption;

  /// No description provided for @planScheduleEyebrow.
  ///
  /// In vi, this message translates to:
  /// **'Lịch tập của bạn'**
  String get planScheduleEyebrow;

  /// No description provided for @planScheduleHint.
  ///
  /// In vi, this message translates to:
  /// **'Chạm để mở'**
  String get planScheduleHint;

  /// No description provided for @planStartCta.
  ///
  /// In vi, this message translates to:
  /// **'Bắt đầu buổi đầu tiên'**
  String get planStartCta;

  /// No description provided for @planSavedToast.
  ///
  /// In vi, this message translates to:
  /// **'Đã lưu kế hoạch mẫu vào hồ sơ'**
  String get planSavedToast;

  /// No description provided for @planDisclaimer.
  ///
  /// In vi, this message translates to:
  /// **'Kế hoạch trong demo chỉ là dữ liệu mẫu minh họa giao diện, không phải tư vấn y tế hoặc chương trình tập cá nhân thật.'**
  String get planDisclaimer;

  /// No description provided for @planMetricSessions.
  ///
  /// In vi, this message translates to:
  /// **'buổi/tuần'**
  String get planMetricSessions;

  /// No description provided for @planMetricMinutes.
  ///
  /// In vi, this message translates to:
  /// **'mỗi buổi'**
  String get planMetricMinutes;

  /// No description provided for @planMetricWeeks.
  ///
  /// In vi, this message translates to:
  /// **'tuần'**
  String get planMetricWeeks;

  /// No description provided for @planSessionExercises.
  ///
  /// In vi, this message translates to:
  /// **'{count, plural, other{{count} bài tập}}'**
  String planSessionExercises(int count);

  /// No description provided for @planSetsReps.
  ///
  /// In vi, this message translates to:
  /// **'{sets} hiệp × {reps}'**
  String planSetsReps(String sets, String reps);

  /// No description provided for @seedStory.
  ///
  /// In vi, this message translates to:
  /// **'Gần đây tôi quay lại đá bóng nhưng nhanh xuống sức, tranh chấp yếu. Tôi làm văn phòng, khá gầy và lâu rồi không tập đều. Tôi muốn khỏe hơn, tăng cân nhưng vẫn giữ được sức bền để đá bóng.'**
  String get seedStory;

  /// No description provided for @seedGoals.
  ///
  /// In vi, this message translates to:
  /// **'Đá bóng khỏe hơn và không bị sụt cân\nTăng cân theo cách bền vững'**
  String get seedGoals;

  /// No description provided for @planHeadlineStrength.
  ///
  /// In vi, this message translates to:
  /// **'Xây nền sức mạnh để trở lại sân bóng bền hơn.'**
  String get planHeadlineStrength;

  /// No description provided for @planHeadlineGeneral.
  ///
  /// In vi, this message translates to:
  /// **'Xây nền thể lực vững để tiến xa hơn.'**
  String get planHeadlineGeneral;

  /// No description provided for @planSummaryUnderweight.
  ///
  /// In vi, this message translates to:
  /// **'Bạn đang thiếu cân so với chiều cao, nên kế hoạch ưu tiên tăng khối lượng cơ một cách bền vững thay vì đốt calo. Khối lượng tập được giữ vừa sức để bạn hồi phục kịp giữa các buổi.'**
  String get planSummaryUnderweight;

  /// No description provided for @planSummaryGeneral.
  ///
  /// In vi, this message translates to:
  /// **'Kế hoạch tập trung vào nền tảng sức mạnh và sức bền, với khối lượng vừa sức để bạn duy trì đều đặn.'**
  String get planSummaryGeneral;

  /// No description provided for @planRationaleBody.
  ///
  /// In vi, this message translates to:
  /// **'Bạn tập được số buổi đã chọn mỗi tuần với thời lượng đã đặt, nên mỗi buổi là toàn thân thay vì chia nhỏ nhóm cơ. Các bài tập được chọn theo thiết bị bạn đang có và tránh những động tác bạn đã báo là khó hoặc gây đau.'**
  String get planRationaleBody;

  /// No description provided for @planPhase1Range.
  ///
  /// In vi, this message translates to:
  /// **'Tuần 1–4'**
  String get planPhase1Range;

  /// No description provided for @planPhase1Focus.
  ///
  /// In vi, this message translates to:
  /// **'Làm quen và tạo nền'**
  String get planPhase1Focus;

  /// No description provided for @planPhase1Detail.
  ///
  /// In vi, this message translates to:
  /// **'Học đúng kỹ thuật với mức tạ nhẹ, tăng dần số hiệp mỗi tuần.'**
  String get planPhase1Detail;

  /// No description provided for @planPhase2Range.
  ///
  /// In vi, this message translates to:
  /// **'Tuần 5–8'**
  String get planPhase2Range;

  /// No description provided for @planPhase2Focus.
  ///
  /// In vi, this message translates to:
  /// **'Tăng dần cường độ'**
  String get planPhase2Focus;

  /// No description provided for @planPhase2Detail.
  ///
  /// In vi, this message translates to:
  /// **'Tăng mức tạ hoặc số lần khi bạn hoàn thành đủ hiệp một cách thoải mái.'**
  String get planPhase2Detail;

  /// No description provided for @planNeedStrength.
  ///
  /// In vi, this message translates to:
  /// **'Tăng sức mạnh nền'**
  String get planNeedStrength;

  /// No description provided for @planNeedEndurance.
  ///
  /// In vi, this message translates to:
  /// **'Giữ sức bền cho môn thể thao'**
  String get planNeedEndurance;

  /// No description provided for @planNeedWeightGain.
  ///
  /// In vi, this message translates to:
  /// **'Tăng cân bền vững'**
  String get planNeedWeightGain;

  /// No description provided for @planNeedMobility.
  ///
  /// In vi, this message translates to:
  /// **'Cải thiện biên độ vận động'**
  String get planNeedMobility;

  /// No description provided for @planNeedInjuryCare.
  ///
  /// In vi, this message translates to:
  /// **'Bảo vệ vùng đang đau'**
  String get planNeedInjuryCare;

  /// No description provided for @planNutritionSurplus.
  ///
  /// In vi, this message translates to:
  /// **'Ăn dư nhẹ so với nhu cầu để tăng cân từ từ, ưu tiên protein trong mỗi bữa.'**
  String get planNutritionSurplus;

  /// No description provided for @planNutritionMaintain.
  ///
  /// In vi, this message translates to:
  /// **'Ăn quanh mức duy trì và giữ protein ổn định để hỗ trợ hồi phục.'**
  String get planNutritionMaintain;

  /// No description provided for @planHealthNote.
  ///
  /// In vi, this message translates to:
  /// **'Con số chỉ là ước lượng ban đầu. Nếu bạn có bệnh nền hoặc đang điều trị, hãy hỏi ý kiến bác sĩ trước khi thay đổi chế độ ăn.'**
  String get planHealthNote;

  /// No description provided for @planSessionFullBody.
  ///
  /// In vi, this message translates to:
  /// **'Toàn thân'**
  String get planSessionFullBody;

  /// No description provided for @planSessionLower.
  ///
  /// In vi, this message translates to:
  /// **'Thân dưới'**
  String get planSessionLower;

  /// No description provided for @planSessionUpper.
  ///
  /// In vi, this message translates to:
  /// **'Thân trên'**
  String get planSessionUpper;

  /// No description provided for @exerciseGobletSquat.
  ///
  /// In vi, this message translates to:
  /// **'Squat ôm tạ trước ngực'**
  String get exerciseGobletSquat;

  /// No description provided for @exerciseSplitSquat.
  ///
  /// In vi, this message translates to:
  /// **'Squat chân trước chân sau'**
  String get exerciseSplitSquat;

  /// No description provided for @exerciseHipHinge.
  ///
  /// In vi, this message translates to:
  /// **'Gập hông (hip hinge)'**
  String get exerciseHipHinge;

  /// No description provided for @exerciseGluteBridge.
  ///
  /// In vi, this message translates to:
  /// **'Đẩy hông nằm ngửa'**
  String get exerciseGluteBridge;

  /// No description provided for @exercisePushup.
  ///
  /// In vi, this message translates to:
  /// **'Chống đẩy'**
  String get exercisePushup;

  /// No description provided for @exerciseInclinePushup.
  ///
  /// In vi, this message translates to:
  /// **'Chống đẩy nghiêng cao tay'**
  String get exerciseInclinePushup;

  /// No description provided for @exerciseRow.
  ///
  /// In vi, this message translates to:
  /// **'Kéo ngang'**
  String get exerciseRow;

  /// No description provided for @exerciseOverheadPress.
  ///
  /// In vi, this message translates to:
  /// **'Đẩy tạ qua đầu'**
  String get exerciseOverheadPress;

  /// No description provided for @exercisePlank.
  ///
  /// In vi, this message translates to:
  /// **'Plank'**
  String get exercisePlank;

  /// No description provided for @exerciseDeadBug.
  ///
  /// In vi, this message translates to:
  /// **'Dead bug'**
  String get exerciseDeadBug;

  /// No description provided for @exerciseCalfRaise.
  ///
  /// In vi, this message translates to:
  /// **'Nhón bắp chân'**
  String get exerciseCalfRaise;

  /// No description provided for @exerciseStepUp.
  ///
  /// In vi, this message translates to:
  /// **'Bước lên bục'**
  String get exerciseStepUp;

  /// No description provided for @noteLowImpact.
  ///
  /// In vi, this message translates to:
  /// **'Ít tác động lên khớp'**
  String get noteLowImpact;

  /// No description provided for @noteControlledRange.
  ///
  /// In vi, this message translates to:
  /// **'Giữ biên độ trong ngưỡng không đau'**
  String get noteControlledRange;

  /// No description provided for @bmiUnderweight.
  ///
  /// In vi, this message translates to:
  /// **'thiếu cân'**
  String get bmiUnderweight;

  /// No description provided for @bmiNormal.
  ///
  /// In vi, this message translates to:
  /// **'bình thường'**
  String get bmiNormal;

  /// No description provided for @bmiOverweight.
  ///
  /// In vi, this message translates to:
  /// **'thừa cân'**
  String get bmiOverweight;

  /// No description provided for @bmiObese.
  ///
  /// In vi, this message translates to:
  /// **'béo phì'**
  String get bmiObese;

  /// No description provided for @homeGreeting.
  ///
  /// In vi, this message translates to:
  /// **'Hôm nay'**
  String get homeGreeting;

  /// No description provided for @homeNextEyebrowToday.
  ///
  /// In vi, this message translates to:
  /// **'Buổi tiếp theo · Hôm nay'**
  String get homeNextEyebrowToday;

  /// No description provided for @homeNextEyebrowTomorrow.
  ///
  /// In vi, this message translates to:
  /// **'Buổi tiếp theo · Ngày mai'**
  String get homeNextEyebrowTomorrow;

  /// No description provided for @homeNextEyebrowRest.
  ///
  /// In vi, this message translates to:
  /// **'Ngày nghỉ'**
  String get homeNextEyebrowRest;

  /// No description provided for @homeRestTitle.
  ///
  /// In vi, this message translates to:
  /// **'Ngày hồi phục'**
  String get homeRestTitle;

  /// No description provided for @homeRestBody.
  ///
  /// In vi, this message translates to:
  /// **'Hồi phục cũng là một phần của kế hoạch. Hẹn gặp bạn ở buổi tới.'**
  String get homeRestBody;

  /// No description provided for @homeSessionRpe.
  ///
  /// In vi, this message translates to:
  /// **'Mức gắng sức'**
  String get homeSessionRpe;

  /// No description provided for @homeStartCta.
  ///
  /// In vi, this message translates to:
  /// **'Bắt đầu buổi tập'**
  String get homeStartCta;

  /// No description provided for @homeViewCta.
  ///
  /// In vi, this message translates to:
  /// **'Xem chi tiết'**
  String get homeViewCta;

  /// No description provided for @homeCompletedCta.
  ///
  /// In vi, this message translates to:
  /// **'Đã hoàn thành'**
  String get homeCompletedCta;

  /// No description provided for @homeTomorrowToast.
  ///
  /// In vi, this message translates to:
  /// **'Buổi tập ngày mai chưa mở'**
  String get homeTomorrowToast;

  /// No description provided for @homeAlreadyLoggedToast.
  ///
  /// In vi, this message translates to:
  /// **'Bạn đã ghi lại buổi này rồi'**
  String get homeAlreadyLoggedToast;

  /// No description provided for @homeStreakToast.
  ///
  /// In vi, this message translates to:
  /// **'Chuỗi hiện tại: {count} tuần'**
  String homeStreakToast(int count);

  /// No description provided for @homeWeekTitle.
  ///
  /// In vi, this message translates to:
  /// **'Tuần này'**
  String get homeWeekTitle;

  /// No description provided for @homeWeekPlanLink.
  ///
  /// In vi, this message translates to:
  /// **'Xem kế hoạch'**
  String get homeWeekPlanLink;

  /// No description provided for @homeWeekOnTrack.
  ///
  /// In vi, this message translates to:
  /// **'Đang đúng nhịp'**
  String get homeWeekOnTrack;

  /// No description provided for @homeWeekComplete.
  ///
  /// In vi, this message translates to:
  /// **'Đã xong tuần này'**
  String get homeWeekComplete;

  /// No description provided for @homeWeekBehind.
  ///
  /// In vi, this message translates to:
  /// **'Đang chậm nhịp'**
  String get homeWeekBehind;

  /// No description provided for @homeWeekSessions.
  ///
  /// In vi, this message translates to:
  /// **'{done}/{total} buổi'**
  String homeWeekSessions(int done, int total);

  /// No description provided for @homeStreakLabel.
  ///
  /// In vi, this message translates to:
  /// **'Chuỗi ngày'**
  String get homeStreakLabel;

  /// No description provided for @homeStreakUnit.
  ///
  /// In vi, this message translates to:
  /// **'tuần liên tiếp'**
  String get homeStreakUnit;

  /// No description provided for @homeStreakBest.
  ///
  /// In vi, this message translates to:
  /// **'Tốt nhất: {count} tuần'**
  String homeStreakBest(int count);

  /// No description provided for @homeAdherenceLabel.
  ///
  /// In vi, this message translates to:
  /// **'Mức bám sát'**
  String get homeAdherenceLabel;

  /// No description provided for @homeAdherenceFoot.
  ///
  /// In vi, this message translates to:
  /// **'Đã hoàn thành {done}/{total} buổi theo kế hoạch'**
  String homeAdherenceFoot(int done, int total);

  /// No description provided for @homeProgressTitle.
  ///
  /// In vi, this message translates to:
  /// **'Tiến bộ'**
  String get homeProgressTitle;

  /// No description provided for @homeProgressUpsellLink.
  ///
  /// In vi, this message translates to:
  /// **'Nâng cấp để xem chi tiết'**
  String get homeProgressUpsellLink;

  /// No description provided for @homeProgressProLink.
  ///
  /// In vi, this message translates to:
  /// **'Tìm hiểu Pro'**
  String get homeProgressProLink;

  /// No description provided for @homeProgressQuestion.
  ///
  /// In vi, this message translates to:
  /// **'Dựa trên các buổi bạn đã ghi lại'**
  String get homeProgressQuestion;

  /// No description provided for @homeProgressWindow.
  ///
  /// In vi, this message translates to:
  /// **'4 tuần gần nhất'**
  String get homeProgressWindow;

  /// No description provided for @homeVerdictProgressing.
  ///
  /// In vi, this message translates to:
  /// **'Bạn đang tiến bộ'**
  String get homeVerdictProgressing;

  /// No description provided for @homeVerdictEarly.
  ///
  /// In vi, this message translates to:
  /// **'Tín hiệu tích cực ban đầu'**
  String get homeVerdictEarly;

  /// No description provided for @homeVerdictInsufficient.
  ///
  /// In vi, this message translates to:
  /// **'Cần thêm buổi tập để đánh giá.'**
  String get homeVerdictInsufficient;

  /// No description provided for @homeDomainStrength.
  ///
  /// In vi, this message translates to:
  /// **'Sức mạnh'**
  String get homeDomainStrength;

  /// No description provided for @homeDomainEndurance.
  ///
  /// In vi, this message translates to:
  /// **'Sức bền'**
  String get homeDomainEndurance;

  /// No description provided for @homeTrendRising.
  ///
  /// In vi, this message translates to:
  /// **'Đang lên'**
  String get homeTrendRising;

  /// No description provided for @homeTrendSteady.
  ///
  /// In vi, this message translates to:
  /// **'Giữ vững'**
  String get homeTrendSteady;

  /// No description provided for @homeTrendInsufficient.
  ///
  /// In vi, this message translates to:
  /// **'Chưa đủ dữ liệu'**
  String get homeTrendInsufficient;

  /// No description provided for @homeConfidenceLabel.
  ///
  /// In vi, this message translates to:
  /// **'Độ tin cậy'**
  String get homeConfidenceLabel;

  /// No description provided for @homeConfidenceLow.
  ///
  /// In vi, this message translates to:
  /// **'Thấp'**
  String get homeConfidenceLow;

  /// No description provided for @homeConfidenceMedium.
  ///
  /// In vi, this message translates to:
  /// **'Trung bình'**
  String get homeConfidenceMedium;

  /// No description provided for @homeLockedTitle.
  ///
  /// In vi, this message translates to:
  /// **'Chưa đủ dữ liệu'**
  String get homeLockedTitle;

  /// No description provided for @homeLockedReady.
  ///
  /// In vi, this message translates to:
  /// **'Đã đủ dữ liệu để đánh giá.'**
  String get homeLockedReady;

  /// No description provided for @homeLockedCounting.
  ///
  /// In vi, this message translates to:
  /// **'Đã có {current}/{target} buổi'**
  String homeLockedCounting(int current, int target);

  /// No description provided for @homeLockedPreviewStrength.
  ///
  /// In vi, this message translates to:
  /// **'Sức mạnh sẽ được theo dõi tại đây.'**
  String get homeLockedPreviewStrength;

  /// No description provided for @homeLockedPreviewEndurance.
  ///
  /// In vi, this message translates to:
  /// **'Sức bền sẽ được theo dõi tại đây.'**
  String get homeLockedPreviewEndurance;

  /// No description provided for @homeUnlockCta.
  ///
  /// In vi, this message translates to:
  /// **'Mở khóa Tiến bộ'**
  String get homeUnlockCta;

  /// No description provided for @homeUnlockToast.
  ///
  /// In vi, this message translates to:
  /// **'Hãy ghi lại thêm buổi tập để mở phần này'**
  String get homeUnlockToast;

  /// No description provided for @homeRecentTitle.
  ///
  /// In vi, this message translates to:
  /// **'Gần đây'**
  String get homeRecentTitle;

  /// No description provided for @homeRecentEmpty.
  ///
  /// In vi, this message translates to:
  /// **'Chưa có buổi tập nào được ghi lại.'**
  String get homeRecentEmpty;

  /// No description provided for @homeRecentMeta.
  ///
  /// In vi, this message translates to:
  /// **'{volume} kg · {exercises} bài'**
  String homeRecentMeta(int volume, int exercises);

  /// No description provided for @homeRecentToast.
  ///
  /// In vi, this message translates to:
  /// **'Chi tiết buổi tập chưa có trong demo'**
  String get homeRecentToast;

  /// No description provided for @homeNavHome.
  ///
  /// In vi, this message translates to:
  /// **'Trang chính'**
  String get homeNavHome;

  /// No description provided for @homeNavPlan.
  ///
  /// In vi, this message translates to:
  /// **'Kế hoạch'**
  String get homeNavPlan;

  /// No description provided for @homeNavLog.
  ///
  /// In vi, this message translates to:
  /// **'Nhật ký'**
  String get homeNavLog;

  /// No description provided for @homeNavProfile.
  ///
  /// In vi, this message translates to:
  /// **'Cá nhân'**
  String get homeNavProfile;

  /// No description provided for @homeNavToast.
  ///
  /// In vi, this message translates to:
  /// **'Phần này chưa có trong demo'**
  String get homeNavToast;

  /// No description provided for @homeProfileToast.
  ///
  /// In vi, this message translates to:
  /// **'Trang cá nhân chưa có trong demo'**
  String get homeProfileToast;

  /// No description provided for @safetyInjurySubtitle.
  ///
  /// In vi, this message translates to:
  /// **'Thêm vùng cần tránh hoặc giảm tải'**
  String get safetyInjurySubtitle;

  /// No description provided for @dietOmnivoreSub.
  ///
  /// In vi, this message translates to:
  /// **'Có thịt, cá, trứng hoặc sữa'**
  String get dietOmnivoreSub;

  /// No description provided for @dietVegetarianSub.
  ///
  /// In vi, this message translates to:
  /// **'Có thể dùng trứng hoặc sữa'**
  String get dietVegetarianSub;

  /// No description provided for @dietVeganSub.
  ///
  /// In vi, this message translates to:
  /// **'Không dùng sản phẩm động vật'**
  String get dietVeganSub;

  /// No description provided for @dietPescatarianSub.
  ///
  /// In vi, this message translates to:
  /// **'Có cá và hải sản'**
  String get dietPescatarianSub;

  /// No description provided for @dietOtherSub.
  ///
  /// In vi, this message translates to:
  /// **'Chế độ riêng của bạn'**
  String get dietOtherSub;

  /// No description provided for @contextBody.
  ///
  /// In vi, this message translates to:
  /// **'Chọn lịch bạn thực sự có thể duy trì.'**
  String get contextBody;

  /// No description provided for @budgetNoneShort.
  ///
  /// In vi, this message translates to:
  /// **'Không'**
  String get budgetNoneShort;

  /// No description provided for @budgetMinimalShort.
  ///
  /// In vi, this message translates to:
  /// **'Một ít'**
  String get budgetMinimalShort;

  /// No description provided for @budgetInvestShort.
  ///
  /// In vi, this message translates to:
  /// **'Sẵn sàng'**
  String get budgetInvestShort;

  /// No description provided for @practiceRestEyebrow.
  ///
  /// In vi, this message translates to:
  /// **'Nghỉ'**
  String get practiceRestEyebrow;

  /// No description provided for @practiceRestSkip.
  ///
  /// In vi, this message translates to:
  /// **'Bỏ qua nghỉ'**
  String get practiceRestSkip;

  /// No description provided for @practiceCompleteSet.
  ///
  /// In vi, this message translates to:
  /// **'Hoàn thành set'**
  String get practiceCompleteSet;

  /// No description provided for @practiceCardioTitleShort.
  ///
  /// In vi, this message translates to:
  /// **'Chạy ngoài trời'**
  String get practiceCardioTitleShort;

  /// No description provided for @practiceCardioKm.
  ///
  /// In vi, this message translates to:
  /// **'km'**
  String get practiceCardioKm;

  /// No description provided for @practiceCardioDistanceLabel.
  ///
  /// In vi, this message translates to:
  /// **'Khoảng cách'**
  String get practiceCardioDistanceLabel;

  /// No description provided for @practiceCardioHrLabel.
  ///
  /// In vi, this message translates to:
  /// **'Nhịp tim · bpm'**
  String get practiceCardioHrLabel;

  /// No description provided for @practiceCardioAvgPaceLabel.
  ///
  /// In vi, this message translates to:
  /// **'Pace trung bình · /km'**
  String get practiceCardioAvgPaceLabel;

  /// No description provided for @practiceCardioActiveKcal.
  ///
  /// In vi, this message translates to:
  /// **'Kcal hoạt động'**
  String get practiceCardioActiveKcal;

  /// No description provided for @practiceCardioTotalKcal.
  ///
  /// In vi, this message translates to:
  /// **'Tổng kcal'**
  String get practiceCardioTotalKcal;

  /// No description provided for @practiceCardioLap.
  ///
  /// In vi, this message translates to:
  /// **'Đánh dấu vòng'**
  String get practiceCardioLap;

  /// No description provided for @practiceCardioLapToast.
  ///
  /// In vi, this message translates to:
  /// **'Đã đánh dấu vòng 1'**
  String get practiceCardioLapToast;

  /// No description provided for @practiceCardioFinish.
  ///
  /// In vi, this message translates to:
  /// **'Kết thúc buổi tập'**
  String get practiceCardioFinish;

  /// No description provided for @practiceCardioInfoEyebrow.
  ///
  /// In vi, this message translates to:
  /// **'Buổi chạy'**
  String get practiceCardioInfoEyebrow;

  /// No description provided for @practiceCardioInfoGoal.
  ///
  /// In vi, this message translates to:
  /// **'Mục tiêu'**
  String get practiceCardioInfoGoal;

  /// No description provided for @practiceCardioInfoNote.
  ///
  /// In vi, this message translates to:
  /// **'Tạm dừng khi cần. Kết thúc buổi tập nếu bạn thấy đau, chóng mặt hoặc có cảm giác bất thường.'**
  String get practiceCardioInfoNote;

  /// No description provided for @practiceCardioSourceDistance.
  ///
  /// In vi, this message translates to:
  /// **'Khoảng cách'**
  String get practiceCardioSourceDistance;

  /// No description provided for @practiceCardioSourceDistanceValue.
  ///
  /// In vi, this message translates to:
  /// **'GPS điện thoại'**
  String get practiceCardioSourceDistanceValue;

  /// No description provided for @practiceCardioSourceHr.
  ///
  /// In vi, this message translates to:
  /// **'Nhịp tim'**
  String get practiceCardioSourceHr;

  /// No description provided for @practiceCardioSourceHrValue.
  ///
  /// In vi, this message translates to:
  /// **'Apple Watch'**
  String get practiceCardioSourceHrValue;

  /// No description provided for @practicePause.
  ///
  /// In vi, this message translates to:
  /// **'Tạm dừng'**
  String get practicePause;

  /// No description provided for @practiceResume.
  ///
  /// In vi, this message translates to:
  /// **'Tiếp tục'**
  String get practiceResume;

  /// No description provided for @practicePausedToast.
  ///
  /// In vi, this message translates to:
  /// **'Đã tạm dừng'**
  String get practicePausedToast;

  /// No description provided for @practiceResumedToast.
  ///
  /// In vi, this message translates to:
  /// **'Đã tiếp tục'**
  String get practiceResumedToast;

  /// No description provided for @practiceFeedbackEyebrow.
  ///
  /// In vi, this message translates to:
  /// **'Phản hồi nhanh'**
  String get practiceFeedbackEyebrow;

  /// No description provided for @practiceFeedbackTitle.
  ///
  /// In vi, this message translates to:
  /// **'Bài này cảm thấy\nthế nào?'**
  String get practiceFeedbackTitle;

  /// No description provided for @practiceFeedbackOk.
  ///
  /// In vi, this message translates to:
  /// **'Ổn'**
  String get practiceFeedbackOk;

  /// No description provided for @practiceFeedbackEasy.
  ///
  /// In vi, this message translates to:
  /// **'Quá dễ'**
  String get practiceFeedbackEasy;

  /// No description provided for @practiceFeedbackHard.
  ///
  /// In vi, this message translates to:
  /// **'Quá khó'**
  String get practiceFeedbackHard;

  /// No description provided for @practiceFeedbackUncomfortable.
  ///
  /// In vi, this message translates to:
  /// **'Khó chịu'**
  String get practiceFeedbackUncomfortable;

  /// No description provided for @practiceFeedbackSaved.
  ///
  /// In vi, this message translates to:
  /// **'Đã lưu: {label}'**
  String practiceFeedbackSaved(String label);

  /// No description provided for @practicePainStop.
  ///
  /// In vi, this message translates to:
  /// **'Có đau — dừng bài tập'**
  String get practicePainStop;

  /// No description provided for @practicePainNote.
  ///
  /// In vi, this message translates to:
  /// **'“Có đau” sẽ dừng bài hiện tại và đánh dấu để kiểm tra lại sau buổi.'**
  String get practicePainNote;

  /// No description provided for @practicePainToast.
  ///
  /// In vi, this message translates to:
  /// **'Đã dừng bài và ghi nhận đau'**
  String get practicePainToast;

  /// No description provided for @practiceFinishTitle.
  ///
  /// In vi, this message translates to:
  /// **'Hoàn thành buổi tập'**
  String get practiceFinishTitle;

  /// No description provided for @practiceFinishMeta.
  ///
  /// In vi, this message translates to:
  /// **'{minutes} phút · {distance} km · pace {pace}/km'**
  String practiceFinishMeta(int minutes, String distance, String pace);

  /// No description provided for @practiceEffortQuestion.
  ///
  /// In vi, this message translates to:
  /// **'Mức gắng sức của bạn?'**
  String get practiceEffortQuestion;

  /// No description provided for @practiceSaveWorkout.
  ///
  /// In vi, this message translates to:
  /// **'Lưu buổi tập'**
  String get practiceSaveWorkout;

  /// No description provided for @practiceContinueWorkout.
  ///
  /// In vi, this message translates to:
  /// **'Tiếp tục tập'**
  String get practiceContinueWorkout;

  /// No description provided for @practiceWorkoutSavedToast.
  ///
  /// In vi, this message translates to:
  /// **'Buổi tập đã được lưu'**
  String get practiceWorkoutSavedToast;

  /// No description provided for @practiceRestTitle.
  ///
  /// In vi, this message translates to:
  /// **'Nghỉ'**
  String get practiceRestTitle;

  /// No description provided for @practiceRestBody.
  ///
  /// In vi, this message translates to:
  /// **'Thả lỏng và chuẩn bị cho bài tiếp theo'**
  String get practiceRestBody;

  /// No description provided for @practiceRestNextLabel.
  ///
  /// In vi, this message translates to:
  /// **'Tiếp theo'**
  String get practiceRestNextLabel;

  /// No description provided for @practiceRepsCount.
  ///
  /// In vi, this message translates to:
  /// **'{reps} lần'**
  String practiceRepsCount(int reps);

  /// No description provided for @practiceSecondsCount.
  ///
  /// In vi, this message translates to:
  /// **'{seconds} giây'**
  String practiceSecondsCount(int seconds);

  /// No description provided for @practiceGuideEyebrow.
  ///
  /// In vi, this message translates to:
  /// **'Hướng dẫn'**
  String get practiceGuideEyebrow;

  /// No description provided for @practiceGuideSquat1.
  ///
  /// In vi, this message translates to:
  /// **'Đứng hai chân rộng bằng vai, hướng mũi chân hơi chếch ra ngoài.'**
  String get practiceGuideSquat1;

  /// No description provided for @practiceGuideSquat2.
  ///
  /// In vi, this message translates to:
  /// **'Đẩy hông ra sau và hạ người xuống trong tầm chuyển động thoải mái.'**
  String get practiceGuideSquat2;

  /// No description provided for @practiceGuideSquat3.
  ///
  /// In vi, this message translates to:
  /// **'Giữ ngực mở, lưng trung lập và đầu gối cùng hướng với mũi chân.'**
  String get practiceGuideSquat3;

  /// No description provided for @practiceGuidePlank1.
  ///
  /// In vi, this message translates to:
  /// **'Chống khuỷu tay dưới vai và duỗi cơ thể thành một đường thẳng.'**
  String get practiceGuidePlank1;

  /// No description provided for @practiceGuidePlank2.
  ///
  /// In vi, this message translates to:
  /// **'Siết nhẹ bụng và mông, không để hông võng xuống hoặc nâng quá cao.'**
  String get practiceGuidePlank2;

  /// No description provided for @practiceGuidePlank3.
  ///
  /// In vi, this message translates to:
  /// **'Thở đều và giữ tư thế trong khoảng thời gian hiển thị.'**
  String get practiceGuidePlank3;

  /// No description provided for @practiceGuideNoteTitle.
  ///
  /// In vi, this message translates to:
  /// **'Lưu ý'**
  String get practiceGuideNoteTitle;

  /// No description provided for @practiceGuideNoteBody.
  ///
  /// In vi, this message translates to:
  /// **'Dừng bài tập khi có đau hoặc cảm giác bất thường. Không cần cố hoàn thành đủ số lần.'**
  String get practiceGuideNoteBody;

  /// No description provided for @practiceGuideGotIt.
  ///
  /// In vi, this message translates to:
  /// **'Đã hiểu'**
  String get practiceGuideGotIt;

  /// No description provided for @practiceExercisePrevious.
  ///
  /// In vi, this message translates to:
  /// **'Bài trước'**
  String get practiceExercisePrevious;

  /// No description provided for @practiceExerciseNext.
  ///
  /// In vi, this message translates to:
  /// **'Bài tiếp'**
  String get practiceExerciseNext;

  /// No description provided for @practiceOptionsToast.
  ///
  /// In vi, this message translates to:
  /// **'Tuỳ chọn chưa có trong demo'**
  String get practiceOptionsToast;

  /// No description provided for @practiceOverviewCategory.
  ///
  /// In vi, this message translates to:
  /// **'Toàn thân · Người mới'**
  String get practiceOverviewCategory;

  /// No description provided for @practiceOverviewTitle.
  ///
  /// In vi, this message translates to:
  /// **'Toàn thân\ncho người mới'**
  String get practiceOverviewTitle;

  /// No description provided for @practiceOverviewStatLevel.
  ///
  /// In vi, this message translates to:
  /// **'Người mới'**
  String get practiceOverviewStatLevel;

  /// No description provided for @practiceOverviewStatLevelLabel.
  ///
  /// In vi, this message translates to:
  /// **'Cấp độ'**
  String get practiceOverviewStatLevelLabel;

  /// No description provided for @practiceOverviewStatDuration.
  ///
  /// In vi, this message translates to:
  /// **'12 phút'**
  String get practiceOverviewStatDuration;

  /// No description provided for @practiceOverviewStatDurationLabel.
  ///
  /// In vi, this message translates to:
  /// **'Thời gian'**
  String get practiceOverviewStatDurationLabel;

  /// No description provided for @practiceOverviewStatFocus.
  ///
  /// In vi, this message translates to:
  /// **'Toàn thân'**
  String get practiceOverviewStatFocus;

  /// No description provided for @practiceOverviewStatFocusLabel.
  ///
  /// In vi, this message translates to:
  /// **'Vùng tập trung'**
  String get practiceOverviewStatFocusLabel;

  /// No description provided for @practiceOverviewListTitle.
  ///
  /// In vi, this message translates to:
  /// **'Bài tập'**
  String get practiceOverviewListTitle;

  /// No description provided for @practiceOverviewAdjust.
  ///
  /// In vi, this message translates to:
  /// **'Điều chỉnh'**
  String get practiceOverviewAdjust;

  /// No description provided for @practiceOverviewAdjustToast.
  ///
  /// In vi, this message translates to:
  /// **'Mở điều chỉnh buổi tập'**
  String get practiceOverviewAdjustToast;

  /// No description provided for @practiceOverviewStart.
  ///
  /// In vi, this message translates to:
  /// **'Bắt đầu'**
  String get practiceOverviewStart;

  /// No description provided for @practiceOverviewEx1Name.
  ///
  /// In vi, this message translates to:
  /// **'Squat'**
  String get practiceOverviewEx1Name;

  /// No description provided for @practiceOverviewEx1Target.
  ///
  /// In vi, this message translates to:
  /// **'15 lần'**
  String get practiceOverviewEx1Target;

  /// No description provided for @practiceOverviewEx1Info.
  ///
  /// In vi, this message translates to:
  /// **'Đứng hai chân rộng bằng vai. Đẩy hông ra sau, hạ người với ngực mở, sau đó đạp chân xuống sàn để đứng lên.'**
  String get practiceOverviewEx1Info;

  /// No description provided for @practiceOverviewEx2Name.
  ///
  /// In vi, this message translates to:
  /// **'Push-up'**
  String get practiceOverviewEx2Name;

  /// No description provided for @practiceOverviewEx2Target.
  ///
  /// In vi, this message translates to:
  /// **'12 lần'**
  String get practiceOverviewEx2Target;

  /// No description provided for @practiceOverviewEx2Info.
  ///
  /// In vi, this message translates to:
  /// **'Đặt hai tay rộng hơn vai một chút. Giữ cơ thể thành đường thẳng khi hạ ngực xuống và đẩy người trở lại.'**
  String get practiceOverviewEx2Info;

  /// No description provided for @practiceOverviewEx3Name.
  ///
  /// In vi, this message translates to:
  /// **'Reverse lunge'**
  String get practiceOverviewEx3Name;

  /// No description provided for @practiceOverviewEx3Target.
  ///
  /// In vi, this message translates to:
  /// **'10 lần mỗi bên'**
  String get practiceOverviewEx3Target;

  /// No description provided for @practiceOverviewEx3Info.
  ///
  /// In vi, this message translates to:
  /// **'Bước một chân ra sau và từ từ hạ hai đầu gối. Giữ đầu gối trước cùng hướng bàn chân, sau đó đạp gót chân trước để trở về.'**
  String get practiceOverviewEx3Info;

  /// No description provided for @practiceOverviewEx4Name.
  ///
  /// In vi, this message translates to:
  /// **'Glute bridge'**
  String get practiceOverviewEx4Name;

  /// No description provided for @practiceOverviewEx4Target.
  ///
  /// In vi, this message translates to:
  /// **'15 lần'**
  String get practiceOverviewEx4Target;

  /// No description provided for @practiceOverviewEx4Info.
  ///
  /// In vi, this message translates to:
  /// **'Nằm ngửa và co hai gối. Siết bụng, siết mông rồi nâng hông đến khi vai, hông và đầu gối tạo thành một đường thẳng.'**
  String get practiceOverviewEx4Info;

  /// No description provided for @practiceOverviewEx5Name.
  ///
  /// In vi, this message translates to:
  /// **'Mountain climber'**
  String get practiceOverviewEx5Name;

  /// No description provided for @practiceOverviewEx5Target.
  ///
  /// In vi, this message translates to:
  /// **'30 giây'**
  String get practiceOverviewEx5Target;

  /// No description provided for @practiceOverviewEx5Info.
  ///
  /// In vi, this message translates to:
  /// **'Bắt đầu ở tư thế plank cao. Luân phiên kéo từng gối về phía ngực, giữ vai trên cổ tay và hạn chế lắc hông.'**
  String get practiceOverviewEx5Info;

  /// No description provided for @practiceOverviewEx6Name.
  ///
  /// In vi, this message translates to:
  /// **'Plank'**
  String get practiceOverviewEx6Name;

  /// No description provided for @practiceOverviewEx6Target.
  ///
  /// In vi, this message translates to:
  /// **'30 giây'**
  String get practiceOverviewEx6Target;

  /// No description provided for @practiceOverviewEx6Info.
  ///
  /// In vi, this message translates to:
  /// **'Đặt khuỷu tay ngay dưới vai và giữ cơ thể thành một đường thẳng. Siết bụng, siết mông và thở đều.'**
  String get practiceOverviewEx6Info;

  /// No description provided for @practiceCardioOverviewCategory.
  ///
  /// In vi, this message translates to:
  /// **'Cardio · Người mới'**
  String get practiceCardioOverviewCategory;

  /// No description provided for @practiceCardioOverviewStart.
  ///
  /// In vi, this message translates to:
  /// **'Bắt đầu chạy'**
  String get practiceCardioOverviewStart;

  /// No description provided for @practiceCardioStatDistanceLabel.
  ///
  /// In vi, this message translates to:
  /// **'Quãng đường'**
  String get practiceCardioStatDistanceLabel;

  /// No description provided for @practiceCardioStatPlaceLabel.
  ///
  /// In vi, this message translates to:
  /// **'Địa điểm'**
  String get practiceCardioStatPlaceLabel;

  /// No description provided for @practiceCardioStatPaceLabel.
  ///
  /// In vi, this message translates to:
  /// **'Nhịp độ'**
  String get practiceCardioStatPaceLabel;

  /// No description provided for @practiceCardioStatDurationLabel.
  ///
  /// In vi, this message translates to:
  /// **'Thời gian'**
  String get practiceCardioStatDurationLabel;

  /// No description provided for @practiceCardioStatStepsLabel.
  ///
  /// In vi, this message translates to:
  /// **'Số bước'**
  String get practiceCardioStatStepsLabel;

  /// No description provided for @practiceCardioStatRoundsLabel.
  ///
  /// In vi, this message translates to:
  /// **'Số vòng'**
  String get practiceCardioStatRoundsLabel;

  /// No description provided for @practiceCardioContinuousListTitle.
  ///
  /// In vi, this message translates to:
  /// **'Buổi chạy'**
  String get practiceCardioContinuousListTitle;

  /// No description provided for @practiceCardioStructuredListTitle.
  ///
  /// In vi, this message translates to:
  /// **'Các bước'**
  String get practiceCardioStructuredListTitle;

  /// No description provided for @practiceCardioCaseContinuous.
  ///
  /// In vi, this message translates to:
  /// **'Liên tục'**
  String get practiceCardioCaseContinuous;

  /// No description provided for @practiceCardioCaseStructured.
  ///
  /// In vi, this message translates to:
  /// **'Theo bước'**
  String get practiceCardioCaseStructured;

  /// No description provided for @practiceCardioContinuousTitle.
  ///
  /// In vi, this message translates to:
  /// **'Chạy bền\n5 km'**
  String get practiceCardioContinuousTitle;

  /// No description provided for @practiceCardioContinuousChip1.
  ///
  /// In vi, this message translates to:
  /// **'5 km'**
  String get practiceCardioContinuousChip1;

  /// No description provided for @practiceCardioContinuousChip2.
  ///
  /// In vi, this message translates to:
  /// **'Ngoài trời'**
  String get practiceCardioContinuousChip2;

  /// No description provided for @practiceCardioContinuousChip3.
  ///
  /// In vi, this message translates to:
  /// **'Pace tự do'**
  String get practiceCardioContinuousChip3;

  /// No description provided for @practiceCardioContinuousRow1Label.
  ///
  /// In vi, this message translates to:
  /// **'Mục tiêu chính'**
  String get practiceCardioContinuousRow1Label;

  /// No description provided for @practiceCardioContinuousRow1Value.
  ///
  /// In vi, this message translates to:
  /// **'Khoảng cách 5 km'**
  String get practiceCardioContinuousRow1Value;

  /// No description provided for @practiceCardioContinuousRow2Label.
  ///
  /// In vi, this message translates to:
  /// **'Metric trực tiếp'**
  String get practiceCardioContinuousRow2Label;

  /// No description provided for @practiceCardioContinuousRow2Value.
  ///
  /// In vi, this message translates to:
  /// **'Thời gian · pace'**
  String get practiceCardioContinuousRow2Value;

  /// No description provided for @practiceCardioContinuousRow3Label.
  ///
  /// In vi, this message translates to:
  /// **'Tự kết thúc'**
  String get practiceCardioContinuousRow3Label;

  /// No description provided for @practiceCardioContinuousRow3Value.
  ///
  /// In vi, this message translates to:
  /// **'Khi đủ 5 km'**
  String get practiceCardioContinuousRow3Value;

  /// No description provided for @practiceCardioStructuredEyebrow.
  ///
  /// In vi, this message translates to:
  /// **'Cardio theo bước'**
  String get practiceCardioStructuredEyebrow;

  /// No description provided for @practiceCardioStructuredTitle.
  ///
  /// In vi, this message translates to:
  /// **'Chạy\nbiến tốc'**
  String get practiceCardioStructuredTitle;

  /// No description provided for @practiceCardioStructuredTitleShort.
  ///
  /// In vi, this message translates to:
  /// **'Chạy biến tốc'**
  String get practiceCardioStructuredTitleShort;

  /// No description provided for @practiceCardioStructuredChip1.
  ///
  /// In vi, this message translates to:
  /// **'30 phút'**
  String get practiceCardioStructuredChip1;

  /// No description provided for @practiceCardioStructuredChip2.
  ///
  /// In vi, this message translates to:
  /// **'8 bước'**
  String get practiceCardioStructuredChip2;

  /// No description provided for @practiceCardioStructuredChip3.
  ///
  /// In vi, this message translates to:
  /// **'3 vòng'**
  String get practiceCardioStructuredChip3;

  /// No description provided for @practiceCardioStepWarmup.
  ///
  /// In vi, this message translates to:
  /// **'Khởi động'**
  String get practiceCardioStepWarmup;

  /// No description provided for @practiceCardioStepWarmupMeta.
  ///
  /// In vi, this message translates to:
  /// **'Đi bộ nhẹ · 5 phút'**
  String get practiceCardioStepWarmupMeta;

  /// No description provided for @practiceCardioStepFast.
  ///
  /// In vi, this message translates to:
  /// **'Chạy nhanh'**
  String get practiceCardioStepFast;

  /// No description provided for @practiceCardioStepFastMeta.
  ///
  /// In vi, this message translates to:
  /// **'3 phút · gắng sức 8/10'**
  String get practiceCardioStepFastMeta;

  /// No description provided for @practiceCardioStepRecover.
  ///
  /// In vi, this message translates to:
  /// **'Hồi phục'**
  String get practiceCardioStepRecover;

  /// No description provided for @practiceCardioStepRecoverMeta.
  ///
  /// In vi, this message translates to:
  /// **'Đi bộ · 2 phút'**
  String get practiceCardioStepRecoverMeta;

  /// No description provided for @practiceCardioStepCooldown.
  ///
  /// In vi, this message translates to:
  /// **'Thả lỏng'**
  String get practiceCardioStepCooldown;

  /// No description provided for @practiceCardioStepCooldownMeta.
  ///
  /// In vi, this message translates to:
  /// **'Đi nhẹ · 10 phút'**
  String get practiceCardioStepCooldownMeta;

  /// No description provided for @practiceCardioRound.
  ///
  /// In vi, this message translates to:
  /// **'Vòng {current} / {total}'**
  String practiceCardioRound(int current, int total);

  /// No description provided for @practiceCardioStepOf.
  ///
  /// In vi, this message translates to:
  /// **'Bước {current} / {total}'**
  String practiceCardioStepOf(int current, int total);

  /// No description provided for @practiceCardioRemaining.
  ///
  /// In vi, this message translates to:
  /// **'Còn lại'**
  String get practiceCardioRemaining;

  /// No description provided for @practiceCardioSkipStep.
  ///
  /// In vi, this message translates to:
  /// **'Bỏ qua bước hiện tại'**
  String get practiceCardioSkipStep;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
