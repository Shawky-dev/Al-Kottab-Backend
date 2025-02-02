class Student {
  final String email;
  final String uid;
  String? password;
  String? firstName;
  String? lastName;
  AgeRange? ageRange;
  String? gender;
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
      'ageRange': ageRange != null
          ? ageRangeMap.keys.firstWhere(
              (key) => ageRangeMap[key] == ageRange,
              orElse: () => '',
            )
          : null,
      'gender': gender,
      'nationality': nationality != null
          ? nationalityMap.keys.firstWhere(
              (key) => nationalityMap[key] == nationality,
              orElse: () => '',
            )
          : null,
      'phoneNumber': phoneNumber,
      'level': level != null
          ? levelMap.keys.firstWhere(
              (key) => levelMap[key] == level,
              orElse: () => '',
            )
          : null,
    };
  }

  // Convert a Map<String, dynamic> to a Student object
  static Student fromFirebaseMap(Map<String, dynamic> map,
      {required String uid}) {
    return Student(
      email: map['email'],
      uid: uid,
      firstName: map['firstName'],
      lastName: map['lastName'],
      ageRange: map['ageRange'] != null ? ageRangeMap[map['ageRange']] : null,
      gender: map['gender'],
      nationality: map['nationality'] != null
          ? englishNationalityMap[map['nationality']]
          : null,
      phoneNumber: map['phoneNumber'],
      level: map['level'] != null ? englishLevelMap[map['level']] : null,
    );
  }
}

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

final Map<String, AgeRange> ageRangeMap = {
  '13-17': AgeRange.age13_17,
  '18-25': AgeRange.age18_25,
  '26-35': AgeRange.age26_35,
  '36-45': AgeRange.age36_45,
  '46-55': AgeRange.age46_55,
  '56-65': AgeRange.age56_65,
  '66+': AgeRange.age66Plus,
};

AgeRange? getAgeRangeFromString(String age) {
  return ageRangeMap[age];
}

// Arabic Nationality Map
final Map<String, Nationality> arabicNationalityMap = {
  'أفغانستان': Nationality.Afghanistan,
  'ألبانيا': Nationality.Albania,
  'الجزائر': Nationality.Algeria,
  'أندورا': Nationality.Andorra,
  'أنغولا': Nationality.Angola,
  'أنتيغوا وباربودا': Nationality.AntiguaAndDeps,
  'الأرجنتين': Nationality.Argentina,
  'أرمينيا': Nationality.Armenia,
  'أستراليا': Nationality.Australia,
  'النمسا': Nationality.Austria,
  'أذربيجان': Nationality.Azerbaijan,
  'باهاماس': Nationality.Bahamas,
  'البحرين': Nationality.Bahrain,
  'بنغلاديش': Nationality.Bangladesh,
  'باربادوس': Nationality.Barbados,
  'بيلاروسيا': Nationality.Belarus,
  'بلجيكا': Nationality.Belgium,
  'بليز': Nationality.Belize,
  'بنين': Nationality.Benin,
  'بوتان': Nationality.Bhutan,
  'بوليفيا': Nationality.Bolivia,
  'البوسنة والهرسك': Nationality.BosniaHerzegovina,
  'بوتسوانا': Nationality.Botswana,
  'البرازيل': Nationality.Brazil,
  'بروناي': Nationality.Brunei,
  'بلغاريا': Nationality.Bulgaria,
  'بوركينا فاسو': Nationality.Burkina,
  'بوروندي': Nationality.Burundi,
  'كمبوديا': Nationality.Cambodia,
  'الكاميرون': Nationality.Cameroon,
  'كندا': Nationality.Canada,
  'الرأس الأخضر': Nationality.CapeVerde,
  'جمهورية أفريقيا الوسطى': Nationality.CentralAfricanRep,
  'تشاد': Nationality.Chad,
  'تشيلي': Nationality.Chile,
  'الصين': Nationality.China,
  'كولومبيا': Nationality.Colombia,
  'جزر القمر': Nationality.Comoros,
  'الكونغو': Nationality.Congo,
  'جمهورية الكونغو الديمقراطية': Nationality.CongoDemocraticRep,
  'كوستاريكا': Nationality.CostaRica,
  'كرواتيا': Nationality.Croatia,
  'كوبا': Nationality.Cuba,
  'قبرص': Nationality.Cyprus,
  'التشيك': Nationality.CzechRepublic,
  'الدنمارك': Nationality.Denmark,
  'جيبوتي': Nationality.Djibouti,
  'دومينيكا': Nationality.Dominica,
  'جمهورية الدومينيكان': Nationality.DominicanRepublic,
  'الإكوادور': Nationality.Ecuador,
  'مصر': Nationality.Egypt,
  'السلفادور': Nationality.ElSalvador,
  'غينيا الاستوائية': Nationality.EquatorialGuinea,
  'إريتريا': Nationality.Eritrea,
  'إستونيا': Nationality.Estonia,
  'إثيوبيا': Nationality.Ethiopia,
  'فيجي': Nationality.Fiji,
  'فنلندا': Nationality.Finland,
  'فرنسا': Nationality.France,
  'الغابون': Nationality.Gabon,
  'غامبيا': Nationality.Gambia,
  'جورجيا': Nationality.Georgia,
  'ألمانيا': Nationality.Germany,
  'غانا': Nationality.Ghana,
  'اليونان': Nationality.Greece,
  'غرينادا': Nationality.Grenada,
  'غواتيمالا': Nationality.Guatemala,
  'غينيا': Nationality.Guinea,
  'غينيا بيساو': Nationality.GuineaBissau,
  'غيانا': Nationality.Guyana,
  'هايتي': Nationality.Haiti,
  'هندوراس': Nationality.Honduras,
  'هنغاريا': Nationality.Hungary,
  'آيسلندا': Nationality.Iceland,
  'الهند': Nationality.India,
  'إندونيسيا': Nationality.Indonesia,
  'إيران': Nationality.Iran,
  'العراق': Nationality.Iraq,
  'أيرلندا': Nationality.IrelandRepublic,
  'إيطاليا': Nationality.Italy,
  'ساحل العاج': Nationality.IvoryCoast,
  'جامايكا': Nationality.Jamaica,
  'اليابان': Nationality.Japan,
  'الأردن': Nationality.Jordan,
  'كازاخستان': Nationality.Kazakhstan,
  'كينيا': Nationality.Kenya,
  'كيريباتي': Nationality.Kiribati,
  'كوريا الشمالية': Nationality.KoreaNorth,
  'كوريا الجنوبية': Nationality.KoreaSouth,
  'الكويت': Nationality.Kuwait,
  'قيرغيزستان': Nationality.Kyrgyzstan,
  'لاوس': Nationality.Laos,
  'لاتفيا': Nationality.Latvia,
  'لبنان': Nationality.Lebanon,
  'ليسوتو': Nationality.Lesotho,
  'ليبيريا': Nationality.Liberia,
  'ليبيا': Nationality.Libya,
  'ليختنشتاين': Nationality.Liechtenstein,
  'ليتوانيا': Nationality.Lithuania,
  'لوكسمبورغ': Nationality.Luxembourg,
  'مدغشقر': Nationality.Madagascar,
  'مالاوي': Nationality.Malawi,
  'ماليزيا': Nationality.Malaysia,
  'جزر المالديف': Nationality.Maldives,
  'مالي': Nationality.Mali,
  'مالطا': Nationality.Malta,
  'جزر مارشال': Nationality.MarshallIslands,
  'موريتانيا': Nationality.Mauritania,
  'موريشيوس': Nationality.Mauritius,
  'المكسيك': Nationality.Mexico,
  'مولدوفا': Nationality.Moldova,
  'موناكو': Nationality.Monaco,
  'منغوليا': Nationality.Mongolia,
  'الجبل الأسود': Nationality.Montenegro,
  'المغرب': Nationality.Morocco,
  'موزمبيق': Nationality.Mozambique,
  'ميانمار': Nationality.MyanmarBurma,
  'ناميبيا': Nationality.Namibia,
  'نيبال': Nationality.Nepal,
  'هولندا': Nationality.Netherlands,
  'نيوزيلندا': Nationality.NewZealand,
  'نيكاراغوا': Nationality.Nicaragua,
  'النيجر': Nationality.Niger,
  'نيجيريا': Nationality.Nigeria,
  'النرويج': Nationality.Norway,
  'عمان': Nationality.Oman,
  'باكستان': Nationality.Pakistan,
  'فلسطين': Nationality.Palestine,
  'بنما': Nationality.Panama,
  'باراغواي': Nationality.Paraguay,
  'بيرو': Nationality.Peru,
  'الفلبين': Nationality.Philippines,
  'بولندا': Nationality.Poland,
  'البرتغال': Nationality.Portugal,
  'قطر': Nationality.Qatar,
  'رومانيا': Nationality.Romania,
  'روسيا': Nationality.RussianFederation,
  'السعودية': Nationality.SaudiArabia,
  'السنغال': Nationality.Senegal,
  'سوريا': Nationality.Syria,
  'السودان': Nationality.Sudan,
  'الإمارات العربية المتحدة': Nationality.UnitedArabEmirates,
  'المملكة المتحدة': Nationality.UnitedKingdom,
  'الولايات المتحدة': Nationality.UnitedStates,
  'اليمن': Nationality.Yemen,
  'زامبيا': Nationality.Zambia,
  'زيمبابوي': Nationality.Zimbabwe,
};

// English Nationality Map
final Map<String, Nationality> englishNationalityMap = {
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

// Arabic Level Map
final Map<String, Level> arabicLevelMap = {
  'مبتدئ': Level.beginner,
  'متوسط': Level.intermediate,
  'خبير': Level.advanced,
};

// English Level Map
final Map<String, Level> englishLevelMap = {
  'Beginner': Level.beginner,
  'Intermediate': Level.intermediate,
  'Advanced': Level.advanced,
};

Nationality? getNationalityFromString(String country, {bool isArabic = true}) {
  return isArabic
      ? arabicNationalityMap[country]
      : englishNationalityMap[country];
}

Level? getLevelFromString(String level, {bool isArabic = true}) {
  return isArabic ? arabicLevelMap[level] : englishLevelMap[level];
}
