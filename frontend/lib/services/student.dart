class Student {
  final String email;
  final String uid;
  String? password;
  String? firstName;
  String? lastName;
  AgeRange? ageRange;
  Gender? gender;
  Nationality? nationality;
  String? phoneNumber;
  Level? level;

  Student({
    required this.email,
    required this.uid,
    this.password,
    this.firstName,
    this.lastName,
    this.ageRange,
    this.gender,
    this.nationality,
    this.phoneNumber,
    this.level,
  });

  // Convert Student object to a Map<String, dynamic>
  Map<String, dynamic> toFirebaseMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'ageRange':
          ageRange != null ? AgeRangeUtils.toStringValue(ageRange!) : null,
      'gender': gender != null ? GenderUtils.toStringValue(gender!) : null,
      'nationality': nationality != null
          ? NationalityUtils.toStringValue(nationality!)
          : null,
      'phoneNumber': phoneNumber,
      'level': level != null ? LevelUtils.toStringValue(level!) : null,
    };
  }

  // Convert a Map<String, dynamic> to a Student object in Arabic
  static Student fromFirebaseMapToArabic(Map<String, dynamic> map,
      {required String uid}) {
    return Student(
      email: map['email'],
      uid: uid,
      firstName: map['firstName'],
      lastName: map['lastName'],
      ageRange: map['ageRange'] != null
          ? AgeRangeUtils.toEnumValue(map['ageRange'], isArabic: true)
          : null,
      gender: map['gender'] != null
          ? GenderUtils.toEnumValue(map['gender'], isArabic: true)
          : null,
      nationality: map['nationality'] != null
          ? NationalityUtils.toEnumValue(map['nationality'], isArabic: true)
          : null,
      phoneNumber: map['phoneNumber'],
      level: map['level'] != null
          ? LevelUtils.toEnumValue(map['level'], isArabic: true)
          : null,
    );
  }

  // Convert a Map<String, dynamic> to a Student object in English
  static Student fromFirebaseMapToEnglish(Map<String, dynamic> map,
      {required String uid}) {
    return Student(
      email: map['email'],
      uid: uid,
      firstName: map['firstName'],
      lastName: map['lastName'],
      ageRange: map['ageRange'] != null
          ? AgeRangeUtils.toEnumValue(map['ageRange'], isArabic: false)
          : null,
      gender: map['gender'] != null
          ? GenderUtils.toEnumValue(map['gender'], isArabic: false)
          : null,
      nationality: map['nationality'] != null
          ? NationalityUtils.toEnumValue(map['nationality'], isArabic: false)
          : null,
      phoneNumber: map['phoneNumber'],
      level: map['level'] != null
          ? LevelUtils.toEnumValue(map['level'], isArabic: false)
          : null,
    );
  }
}

// Enums
enum Level { beginner, intermediate, advanced }

enum AgeRange {
  age13_17,
  age18_25,
  age26_35,
  age36_45,
  age46_55,
  age56_65,
  age66Plus
}

enum Nationality {
  Afghanistan,
  Albania,
  Algeria,
  Andorra,
  Angola,
  AntiguaAndDeps,
  Argentina,
  Armenia,
  Australia,
  Austria,
  Azerbaijan,
  Bahamas,
  Bahrain,
  Bangladesh,
  Barbados,
  Belarus,
  Belgium,
  Belize,
  Benin,
  Bhutan,
  Bolivia,
  BosniaHerzegovina,
  Botswana,
  Brazil,
  Brunei,
  Bulgaria,
  Burkina,
  Burundi,
  Cambodia,
  Cameroon,
  Canada,
  CapeVerde,
  CentralAfricanRep,
  Chad,
  Chile,
  China,
  Colombia,
  Comoros,
  Congo,
  CongoDemocraticRep,
  CostaRica,
  Croatia,
  Cuba,
  Cyprus,
  CzechRepublic,
  Denmark,
  Djibouti,
  Dominica,
  DominicanRepublic,
  EastTimor,
  Ecuador,
  Egypt,
  ElSalvador,
  EquatorialGuinea,
  Eritrea,
  Estonia,
  Ethiopia,
  Fiji,
  Finland,
  France,
  Gabon,
  Gambia,
  Georgia,
  Germany,
  Ghana,
  Greece,
  Grenada,
  Guatemala,
  Guinea,
  GuineaBissau,
  Guyana,
  Haiti,
  Honduras,
  Hungary,
  Iceland,
  India,
  Indonesia,
  Iran,
  Iraq,
  IrelandRepublic,
  Italy,
  IvoryCoast,
  Jamaica,
  Japan,
  Jordan,
  Kazakhstan,
  Kenya,
  Kiribati,
  KoreaNorth,
  KoreaSouth,
  Kosovo,
  Kuwait,
  Kyrgyzstan,
  Laos,
  Latvia,
  Lebanon,
  Lesotho,
  Liberia,
  Libya,
  Liechtenstein,
  Lithuania,
  Luxembourg,
  Macedonia,
  Madagascar,
  Malawi,
  Malaysia,
  Maldives,
  Mali,
  Malta,
  MarshallIslands,
  Mauritania,
  Mauritius,
  Mexico,
  Micronesia,
  Moldova,
  Monaco,
  Mongolia,
  Montenegro,
  Morocco,
  Mozambique,
  MyanmarBurma,
  Namibia,
  Nauru,
  Nepal,
  Netherlands,
  NewZealand,
  Nicaragua,
  Niger,
  Nigeria,
  Norway,
  Oman,
  Pakistan,
  Palestine,
  Palau,
  Panama,
  PapuaNewGuinea,
  Paraguay,
  Peru,
  Philippines,
  Poland,
  Portugal,
  Qatar,
  Romania,
  RussianFederation,
  Rwanda,
  StKittsAndNevis,
  StLucia,
  SaintVincentAndTheGrenadines,
  Samoa,
  SanMarino,
  SaoTomeAndPrincipe,
  SaudiArabia,
  Senegal,
  Serbia,
  Seychelles,
  SierraLeone,
  Singapore,
  Slovakia,
  Slovenia,
  SolomonIslands,
  Somalia,
  SouthAfrica,
  SouthSudan,
  Spain,
  SriLanka,
  Sudan,
  Suriname,
  Swaziland,
  Sweden,
  Switzerland,
  Syria,
  Taiwan,
  Tajikistan,
  Tanzania,
  Thailand,
  Togo,
  Tonga,
  TrinidadAndTobago,
  Tunisia,
  Turkey,
  Turkmenistan,
  Tuvalu,
  Uganda,
  Ukraine,
  UnitedArabEmirates,
  UnitedKingdom,
  UnitedStates,
  Uruguay,
  Uzbekistan,
  Vanuatu,
  VaticanCity,
  Venezuela,
  Vietnam,
  Yemen,
  Zambia,
  Zimbabwe
}

enum Gender { male, female }

// Utility Classes for Bidirectional Mapping
class AgeRangeUtils {
  static final Map<String, AgeRange> englishMap = {
    '13-17': AgeRange.age13_17,
    '18-25': AgeRange.age18_25,
    '26-35': AgeRange.age26_35,
    '36-45': AgeRange.age36_45,
    '46-55': AgeRange.age46_55,
    '56-65': AgeRange.age56_65,
    '66+': AgeRange.age66Plus,
  };

  static final Map<AgeRange, String> arabicMap = {
    AgeRange.age13_17: '13-17',
    AgeRange.age18_25: '18-25',
    AgeRange.age26_35: '26-35',
    AgeRange.age36_45: '36-45',
    AgeRange.age46_55: '46-55',
    AgeRange.age56_65: '56-65',
    AgeRange.age66Plus: '66+',
  };

  static String toStringValue(AgeRange ageRange, {bool isArabic = false}) {
    return isArabic
        ? arabicMap[ageRange]!
        : englishMap.keys.firstWhere((key) => englishMap[key] == ageRange);
  }

  static AgeRange? toEnumValue(String ageRange, {bool isArabic = false}) {
    try {
      return isArabic
          ? arabicMap.keys.firstWhere((key) => arabicMap[key] == ageRange)
          : englishMap[ageRange];
    } catch (e) {
      return null;
    }
  }
}

class NationalityUtils {
  static final Map<String, Nationality> englishMap = {
    'Afghanistan': Nationality.Afghanistan,
    'Albania': Nationality.Albania,
    'Algeria': Nationality.Algeria,
    'Andorra': Nationality.Andorra,
    'Angola': Nationality.Angola,
    'Antigua and Barbuda': Nationality.AntiguaAndDeps,
    'Argentina': Nationality.Argentina,
    'Armenia': Nationality.Armenia,
    'Australia': Nationality.Australia,
    'Austria': Nationality.Austria,
    'Azerbaijan': Nationality.Azerbaijan,
    'Bahamas': Nationality.Bahamas,
    'Bahrain': Nationality.Bahrain,
    'Bangladesh': Nationality.Bangladesh,
    'Barbados': Nationality.Barbados,
    'Belarus': Nationality.Belarus,
    'Belgium': Nationality.Belgium,
    'Belize': Nationality.Belize,
    'Benin': Nationality.Benin,
    'Bhutan': Nationality.Bhutan,
    'Bolivia': Nationality.Bolivia,
    'Bosnia and Herzegovina': Nationality.BosniaHerzegovina,
    'Botswana': Nationality.Botswana,
    'Brazil': Nationality.Brazil,
    'Brunei': Nationality.Brunei,
    'Bulgaria': Nationality.Bulgaria,
    'Burkina Faso': Nationality.Burkina,
    'Burundi': Nationality.Burundi,
    'Cambodia': Nationality.Cambodia,
    'Cameroon': Nationality.Cameroon,
    'Canada': Nationality.Canada,
    'Cape Verde': Nationality.CapeVerde,
    'Central African Republic': Nationality.CentralAfricanRep,
    'Chad': Nationality.Chad,
    'Chile': Nationality.Chile,
    'China': Nationality.China,
    'Colombia': Nationality.Colombia,
    'Comoros': Nationality.Comoros,
    'Congo': Nationality.Congo,
    'Democratic Republic of the Congo': Nationality.CongoDemocraticRep,
    'Costa Rica': Nationality.CostaRica,
    'Croatia': Nationality.Croatia,
    'Cuba': Nationality.Cuba,
    'Cyprus': Nationality.Cyprus,
    'Czech Republic': Nationality.CzechRepublic,
    'Denmark': Nationality.Denmark,
    'Djibouti': Nationality.Djibouti,
    'Dominica': Nationality.Dominica,
    'Dominican Republic': Nationality.DominicanRepublic,
    'Ecuador': Nationality.Ecuador,
    'Egypt': Nationality.Egypt,
    'El Salvador': Nationality.ElSalvador,
    'Equatorial Guinea': Nationality.EquatorialGuinea,
    'Eritrea': Nationality.Eritrea,
    'Estonia': Nationality.Estonia,
    'Ethiopia': Nationality.Ethiopia,
    'Fiji': Nationality.Fiji,
    'Finland': Nationality.Finland,
    'France': Nationality.France,
    'Gabon': Nationality.Gabon,
    'Gambia': Nationality.Gambia,
    'Georgia': Nationality.Georgia,
    'Germany': Nationality.Germany,
    'Ghana': Nationality.Ghana,
    'Greece': Nationality.Greece,
    'Grenada': Nationality.Grenada,
    'Guatemala': Nationality.Guatemala,
    'Guinea': Nationality.Guinea,
    'Guinea-Bissau': Nationality.GuineaBissau,
    'Guyana': Nationality.Guyana,
    'Haiti': Nationality.Haiti,
    'Honduras': Nationality.Honduras,
    'Hungary': Nationality.Hungary,
    'Iceland': Nationality.Iceland,
    'India': Nationality.India,
    'Indonesia': Nationality.Indonesia,
    'Iran': Nationality.Iran,
    'Iraq': Nationality.Iraq,
    'Ireland': Nationality.IrelandRepublic,
    'Italy': Nationality.Italy,
    'Ivory Coast': Nationality.IvoryCoast,
    'Jamaica': Nationality.Jamaica,
    'Japan': Nationality.Japan,
    'Jordan': Nationality.Jordan,
    'Kazakhstan': Nationality.Kazakhstan,
    'Kenya': Nationality.Kenya,
    'Kiribati': Nationality.Kiribati,
    'North Korea': Nationality.KoreaNorth,
    'South Korea': Nationality.KoreaSouth,
    'Kuwait': Nationality.Kuwait,
    'Kyrgyzstan': Nationality.Kyrgyzstan,
    'Laos': Nationality.Laos,
    'Latvia': Nationality.Latvia,
    'Lebanon': Nationality.Lebanon,
    'Lesotho': Nationality.Lesotho,
    'Liberia': Nationality.Liberia,
    'Libya': Nationality.Libya,
    'Liechtenstein': Nationality.Liechtenstein,
    'Lithuania': Nationality.Lithuania,
    'Luxembourg': Nationality.Luxembourg,
    'Madagascar': Nationality.Madagascar,
    'Malawi': Nationality.Malawi,
    'Malaysia': Nationality.Malaysia,
    'Maldives': Nationality.Maldives,
    'Mali': Nationality.Mali,
    'Malta': Nationality.Malta,
    'Marshall Islands': Nationality.MarshallIslands,
    'Mauritania': Nationality.Mauritania,
    'Mauritius': Nationality.Mauritius,
    'Mexico': Nationality.Mexico,
    'Moldova': Nationality.Moldova,
    'Monaco': Nationality.Monaco,
    'Mongolia': Nationality.Mongolia,
    'Montenegro': Nationality.Montenegro,
    'Morocco': Nationality.Morocco,
    'Mozambique': Nationality.Mozambique,
    'Myanmar': Nationality.MyanmarBurma,
    'Namibia': Nationality.Namibia,
    'Nepal': Nationality.Nepal,
    'Netherlands': Nationality.Netherlands,
    'New Zealand': Nationality.NewZealand,
    'Nicaragua': Nationality.Nicaragua,
    'Niger': Nationality.Niger,
    'Nigeria': Nationality.Nigeria,
    'Norway': Nationality.Norway,
    'Oman': Nationality.Oman,
    'Pakistan': Nationality.Pakistan,
    'Palestine': Nationality.Palestine,
    'Panama': Nationality.Panama,
    'Paraguay': Nationality.Paraguay,
    'Peru': Nationality.Peru,
    'Philippines': Nationality.Philippines,
    'Poland': Nationality.Poland,
    'Portugal': Nationality.Portugal,
    'Qatar': Nationality.Qatar,
    'Romania': Nationality.Romania,
    'Russia': Nationality.RussianFederation,
    'Saudi Arabia': Nationality.SaudiArabia,
    'Senegal': Nationality.Senegal,
    'Syria': Nationality.Syria,
    'Sudan': Nationality.Sudan,
    'United Arab Emirates': Nationality.UnitedArabEmirates,
    'United Kingdom': Nationality.UnitedKingdom,
    'United States': Nationality.UnitedStates,
    'Yemen': Nationality.Yemen,
    'Zambia': Nationality.Zambia,
    'Zimbabwe': Nationality.Zimbabwe,
  };

  static final Map<Nationality, String> arabicMap = {
    Nationality.Afghanistan: 'أفغانستان',
    Nationality.Albania: 'ألبانيا',
    Nationality.Algeria: 'الجزائر',
    Nationality.Andorra: 'أندورا',
    Nationality.Angola: 'أنغولا',
    Nationality.AntiguaAndDeps: 'أنتيغوا وباربودا',
    Nationality.Argentina: 'الأرجنتين',
    Nationality.Armenia: 'أرمينيا',
    Nationality.Australia: 'أستراليا',
    Nationality.Austria: 'النمسا',
    Nationality.Azerbaijan: 'أذربيجان',
    Nationality.Bahamas: 'باهاماس',
    Nationality.Bahrain: 'البحرين',
    Nationality.Bangladesh: 'بنغلاديش',
    Nationality.Barbados: 'باربادوس',
    Nationality.Belarus: 'بيلاروسيا',
    Nationality.Belgium: 'بلجيكا',
    Nationality.Belize: 'بليز',
    Nationality.Benin: 'بنين',
    Nationality.Bhutan: 'بوتان',
    Nationality.Bolivia: 'بوليفيا',
    Nationality.BosniaHerzegovina: 'البوسنة والهرسك',
    Nationality.Botswana: 'بوتسوانا',
    Nationality.Brazil: 'البرازيل',
    Nationality.Brunei: 'بروناي',
    Nationality.Bulgaria: 'بلغاريا',
    Nationality.Burkina: 'بوركينا فاسو',
    Nationality.Burundi: 'بوروندي',
    Nationality.Cambodia: 'كمبوديا',
    Nationality.Cameroon: 'الكاميرون',
    Nationality.Canada: 'كندا',
    Nationality.CapeVerde: 'الرأس الأخضر',
    Nationality.CentralAfricanRep: 'جمهورية أفريقيا الوسطى',
    Nationality.Chad: 'تشاد',
    Nationality.Chile: 'تشيلي',
    Nationality.China: 'الصين',
    Nationality.Colombia: 'كولومبيا',
    Nationality.Comoros: 'جزر القمر',
    Nationality.Congo: 'الكونغو',
    Nationality.CongoDemocraticRep: 'جمهورية الكونغو الديمقراطية',
    Nationality.CostaRica: 'كوستاريكا',
    Nationality.Croatia: 'كرواتيا',
    Nationality.Cuba: 'كوبا',
    Nationality.Cyprus: 'قبرص',
    Nationality.CzechRepublic: 'التشيك',
    Nationality.Denmark: 'الدنمارك',
    Nationality.Djibouti: 'جيبوتي',
    Nationality.Dominica: 'دومينيكا',
    Nationality.DominicanRepublic: 'جمهورية الدومينيكان',
    Nationality.Ecuador: 'الإكوادور',
    Nationality.Egypt: 'مصر',
    Nationality.ElSalvador: 'السلفادور',
    Nationality.EquatorialGuinea: 'غينيا الاستوائية',
    Nationality.Eritrea: 'إريتريا',
    Nationality.Estonia: 'إستونيا',
    Nationality.Ethiopia: 'إثيوبيا',
    Nationality.Fiji: 'فيجي',
    Nationality.Finland: 'فنلندا',
    Nationality.France: 'فرنسا',
    Nationality.Gabon: 'الغابون',
    Nationality.Gambia: 'غامبيا',
    Nationality.Georgia: 'جورجيا',
    Nationality.Germany: 'ألمانيا',
    Nationality.Ghana: 'غانا',
    Nationality.Greece: 'اليونان',
    Nationality.Grenada: 'غرينادا',
    Nationality.Guatemala: 'غواتيمالا',
    Nationality.Guinea: 'غينيا',
    Nationality.GuineaBissau: 'غينيا بيساو',
    Nationality.Guyana: 'غيانا',
    Nationality.Haiti: 'هايتي',
    Nationality.Honduras: 'هندوراس',
    Nationality.Hungary: 'هنغاريا',
    Nationality.Iceland: 'آيسلندا',
    Nationality.India: 'الهند',
    Nationality.Indonesia: 'إندونيسيا',
    Nationality.Iran: 'إيران',
    Nationality.Iraq: 'العراق',
    Nationality.IrelandRepublic: 'أيرلندا',
    Nationality.Italy: 'إيطاليا',
    Nationality.IvoryCoast: 'ساحل العاج',
    Nationality.Jamaica: 'جامايكا',
    Nationality.Japan: 'اليابان',
    Nationality.Jordan: 'الأردن',
    Nationality.Kazakhstan: 'كازاخستان',
    Nationality.Kenya: 'كينيا',
    Nationality.Kiribati: 'كيريباتي',
    Nationality.KoreaNorth: 'كوريا الشمالية',
    Nationality.KoreaSouth: 'كوريا الجنوبية',
    Nationality.Kuwait: 'الكويت',
    Nationality.Kyrgyzstan: 'قيرغيزستان',
    Nationality.Laos: 'لاوس',
    Nationality.Latvia: 'لاتفيا',
    Nationality.Lebanon: 'لبنان',
    Nationality.Lesotho: 'ليسوتو',
    Nationality.Liberia: 'ليبيريا',
    Nationality.Libya: 'ليبيا',
    Nationality.Liechtenstein: 'ليختنشتاين',
    Nationality.Lithuania: 'ليتوانيا',
    Nationality.Luxembourg: 'لوكسمبورغ',
    Nationality.Madagascar: 'مدغشقر',
    Nationality.Malawi: 'مالاوي',
    Nationality.Malaysia: 'ماليزيا',
    Nationality.Maldives: 'جزر المالديف',
    Nationality.Mali: 'مالي',
    Nationality.Malta: 'مالطا',
    Nationality.MarshallIslands: 'جزر مارشال',
    Nationality.Mauritania: 'موريتانيا',
    Nationality.Mauritius: 'موريشيوس',
    Nationality.Mexico: 'المكسيك',
    Nationality.Micronesia: 'ميكرونيزيا',
    Nationality.Moldova: 'مولدوفا',
    Nationality.Monaco: 'موناكو',
    Nationality.Mongolia: 'منغوليا',
    Nationality.Montenegro: 'الجبل الأسود',
    Nationality.Morocco: 'المغرب',
    Nationality.Mozambique: 'موزمبيق',
    Nationality.MyanmarBurma: 'ميانمار',
    Nationality.Namibia: 'ناميبيا',
    Nationality.Nepal: 'نيبال',
    Nationality.Netherlands: 'هولندا',
    Nationality.NewZealand: 'نيوزيلندا',
    Nationality.Nicaragua: 'نيكاراغوا',
    Nationality.Niger: 'النيجر',
    Nationality.Nigeria: 'نيجيريا',
    Nationality.Norway: 'النرويج',
    Nationality.Oman: 'عمان',
    Nationality.Pakistan: 'باكستان',
    Nationality.Palestine: 'فلسطين',
    Nationality.Panama: 'بنما',
    Nationality.PapuaNewGuinea: 'بابوا غينيا الجديدة',
    Nationality.Paraguay: 'باراغواي',
    Nationality.Peru: 'بيرو',
    Nationality.Philippines: 'الفلبين',
    Nationality.Poland: 'بولندا',
    Nationality.Portugal: 'البرتغال',
    Nationality.Qatar: 'قطر',
    Nationality.Romania: 'رومانيا',
    Nationality.RussianFederation: 'روسيا',
    Nationality.Rwanda: 'رواندا',
    Nationality.StKittsAndNevis: 'سانت كيتس ونيفيس',
    Nationality.StLucia: 'سانت لوسيا',
    Nationality.SaintVincentAndTheGrenadines: 'سانت فنسنت وجزر غرينادين',
    Nationality.Samoa: 'ساموا',
    Nationality.SanMarino: 'سان مارينو',
    Nationality.SaoTomeAndPrincipe: 'ساو تومي وبرينسيبي',
    Nationality.SaudiArabia: 'السعودية',
    Nationality.Senegal: 'السنغال',
    Nationality.Serbia: 'صربيا',
    Nationality.Seychelles: 'سيشيل',
    Nationality.SierraLeone: 'سيراليون',
    Nationality.Singapore: 'سنغافورة',
    Nationality.Slovakia: 'سلوفاكيا',
    Nationality.Slovenia: 'سلوفينيا',
    Nationality.SolomonIslands: 'جزر سليمان',
    Nationality.Somalia: 'الصومال',
    Nationality.SouthAfrica: 'جنوب أفريقيا',
    Nationality.SouthSudan: 'جنوب السودان',
    Nationality.Spain: 'إسبانيا',
    Nationality.SriLanka: 'سريلانكا',
    Nationality.Sudan: 'السودان',
    Nationality.Suriname: 'سورينام',
    Nationality.Swaziland: 'سوازيلاند',
    Nationality.Sweden: 'السويد',
    Nationality.Switzerland: 'سويسرا',
    Nationality.Syria: 'سوريا',
    Nationality.Taiwan: 'تايوان',
    Nationality.Tajikistan: 'طاجيكستان',
    Nationality.Tanzania: 'تنزانيا',
    Nationality.Thailand: 'تايلاند',
    Nationality.Togo: 'توغو',
    Nationality.Tonga: 'تونغا',
    Nationality.TrinidadAndTobago: 'ترينيداد وتوباغو',
    Nationality.Tunisia: 'تونس',
    Nationality.Turkey: 'تركيا',
    Nationality.Turkmenistan: 'تركمانستان',
    Nationality.Tuvalu: 'توفالو',
    Nationality.Uganda: 'أوغندا',
    Nationality.Ukraine: 'أوكرانيا',
    Nationality.UnitedArabEmirates: 'الإمارات العربية المتحدة',
    Nationality.UnitedKingdom: 'المملكة المتحدة',
    Nationality.UnitedStates: 'الولايات المتحدة',
    Nationality.Uruguay: 'أوروغواي',
    Nationality.Uzbekistan: 'أوزبكستان',
    Nationality.Vanuatu: 'فانواتو',
    Nationality.VaticanCity: 'الفاتيكان',
    Nationality.Venezuela: 'فنزويلا',
    Nationality.Vietnam: 'فيتنام',
    Nationality.Yemen: 'اليمن',
    Nationality.Zambia: 'زامبيا',
    Nationality.Zimbabwe: 'زيمبابوي',
  };

  static String toStringValue(Nationality nationality,
      {bool isArabic = false}) {
    return isArabic
        ? arabicMap[nationality]!
        : englishMap.keys.firstWhere((key) => englishMap[key] == nationality);
  }

  static Nationality? toEnumValue(String nationality, {bool isArabic = false}) {
    try {
      return isArabic
          ? arabicMap.keys.firstWhere((key) => arabicMap[key] == nationality)
          : englishMap[nationality];
    } catch (e) {
      print(nationality);
      print(e);
      return null;
    }
  }
}

class LevelUtils {
  static final Map<String, Level> englishMap = {
    'Beginner': Level.beginner,
    'Intermediate': Level.intermediate,
    'Advanced': Level.advanced,
  };

  static final Map<Level, String> arabicMap = {
    Level.beginner: 'مبتدئ',
    Level.intermediate: 'متوسط',
    Level.advanced: 'خبير',
  };

  static String toStringValue(Level level, {bool isArabic = false}) {
    return isArabic
        ? arabicMap[level]!
        : englishMap.keys.firstWhere((key) => englishMap[key] == level);
  }

  static Level? toEnumValue(String level, {bool isArabic = false}) {
    try {
      return isArabic
          ? arabicMap.keys.firstWhere((key) => arabicMap[key] == level)
          : englishMap[level];
    } catch (e) {
      return null;
    }
  }
}

class GenderUtils {
  static final Map<String, Gender> englishMap = {
    'Male': Gender.male,
    'Female': Gender.female,
  };

  static final Map<Gender, String> arabicMap = {
    Gender.male: 'ذكر',
    Gender.female: 'أنثى',
  };

  static String toStringValue(Gender gender, {bool isArabic = false}) {
    return isArabic
        ? arabicMap[gender]!
        : englishMap.keys.firstWhere((key) => englishMap[key] == gender);
  }

  static Gender? toEnumValue(String gender, {bool isArabic = false}) {
    try {
      return isArabic
          ? arabicMap.keys.firstWhere((key) => arabicMap[key] == gender)
          : englishMap[gender];
    } catch (e) {
      return null;
    }
  }
}
