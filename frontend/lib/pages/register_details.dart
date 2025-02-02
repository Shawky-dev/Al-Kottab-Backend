import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/home_page.dart';
import 'package:frontend/services/student.dart';
import 'package:frontend/services/studentServices.dart';
import 'package:frontend/widgets/snack_bar.dart';

class RegisterDetails extends StatefulWidget {
  const RegisterDetails({super.key});

  @override
  State<RegisterDetails> createState() => _RegisterDetailsState();
}

class _RegisterDetailsState extends State<RegisterDetails> {
  // List of countries (sorted in ascending order)
  final List<String> countries = [
    'أفغانستان',
    'ألبانيا',
    'الجزائر',
    'أمريكا',
    'أندورا',
    'أنغولا',
    'أنتيغوا وباربودا',
    'الأرجنتين',
    'أرمينيا',
    'أستراليا',
    'النمسا',
    'أذربيجان',
    'باهاماس',
    'البحرين',
    'بنغلاديش',
    'باربادوس',
    'بيلاروسيا',
    'بلجيكا',
    'بليز',
    'بنين',
    'بوتان',
    'بوليفيا',
    'البوسنة والهرسك',
    'بوتسوانا',
    'البرازيل',
    'بريطانيا',
    'بروناي',
    'بلغاريا',
    'بوركينا فاسو',
    'بورما',
    'بوروندي',
    'كمبوديا',
    'الكاميرون',
    'كندا',
    'الرأس الأخضر',
    'جمهورية أفريقيا الوسطى',
    'تشاد',
    'تشيلي',
    'الصين',
    'كولومبيا',
    'جزر القمر',
    'الكونغو',
    'كوستاريكا',
    'كرواتيا',
    'كوبا',
    'قبرص',
    'التشيك',
    'الدنمارك',
    'جيبوتي',
    'دومينيكا',
    'جمهورية الدومينيكان',
    'هولندا',
    'تيمور الشرقية',
    'الإكوادور',
    'مصر',
    'الإمارات العربية المتحدة',
    'غينيا الاستوائية',
    'إريتريا',
    'إستونيا',
    'إثيوبيا',
    'فيجي',
    'الفلبين',
    'فنلندا',
    'فرنسا',
    'الغابون',
    'غامبيا',
    'جورجيا',
    'ألمانيا',
    'غانا',
    'اليونان',
    'غرينادا',
    'غواتيمالا',
    'غينيا',
    'غينيا بيساو',
    'غيانا',
    'هايتي',
    'هندوراس',
    'هنغاريا',
    'آيسلندا',
    'الهند',
    'إندونيسيا',
    'إيران',
    'العراق',
    'أيرلندا',
    'إسرائيل',
    'إيطاليا',
    'ساحل العاج',
    'جامايكا',
    'اليابان',
    'الأردن',
    'كازاخستان',
    'كينيا',
    'كيريباتي',
    'كوريا الشمالية',
    'كوريا الجنوبية',
    'الكويت',
    'قيرغيزستان',
    'لاوس',
    'لاتفيا',
    'لبنان',
    'ليسوتو',
    'ليبيريا',
    'ليبيا',
    'ليختنشتاين',
    'ليتوانيا',
    'لوكسمبورغ',
    'مقدونيا',
    'مدغشقر',
    'مالاوي',
    'ماليزيا',
    'جزر المالديف',
    'مالي',
    'مالطا',
    'جزر مارشال',
    'موريتانيا',
    'موريشيوس',
    'المكسيك',
    'ميكرونيزيا',
    'مولدوفا',
    'موناكو',
    'منغوليا',
    'الجبل الأسود',
    'المغرب',
    'موزمبيق',
    'ميانمار',
    'ناميبيا',
    'ناورو',
    'نيبال',
    'هولندا',
    'نيوزيلندا',
    'نيكاراغوا',
    'النيجر',
    'نيجيريا',
    'النرويج',
    'عمان',
    'باكستان',
    'بالاو',
    'بنما',
    'بابوا غينيا الجديدة',
    'باراغواي',
    'بيرو',
    'الفلبين',
    'بولندا',
    'البرتغال',
    'قطر',
    'رومانيا',
    'روسيا',
    'رواندا',
    'سانت كيتس ونيفيس',
    'سانت لوسيا',
    'سانت فينسنت والغرينادين',
    'ساموا',
    'سان مارينو',
    'ساو تومي وبرينسيبي',
    'السعودية',
    'السنغال',
    'صربيا',
    'سيشل',
    'سيراليون',
    'سنغافورة',
    'سلوفاكيا',
    'سلوفينيا',
    'جزر سليمان',
    'الصومال',
    'جنوب أفريقيا',
    'إسبانيا',
    'سريلانكا',
    'السودان',
    'سورينام',
    'إسواتيني',
    'السويد',
    'سويسرا',
    'سوريا',
    'تايوان',
    'طاجيكستان',
    'تنزانيا',
    'تايلاند',
    'توغو',
    'تونغا',
    'ترينيداد وتوباغو',
    'تونس',
    'تركيا',
    'تركمانستان',
    'توفالو',
    'أوغندا',
    'أوكرانيا',
    'الإمارات العربية المتحدة',
    'المملكة المتحدة',
    'الولايات المتحدة',
    'أوروغواي',
    'أوزبكستان',
    'فانواتو',
    'الفاتيكان',
    'فنزويلا',
    'فيتنام',
    'اليمن',
    'زامبيا',
    'زيمبابوي'
  ]..sort();

  // List of age options (starting from 5)
  final List<String> ages = [
    '13-17',
    '18-25',
    '26-35',
    '36-45',
    '46-55',
    '56-65',
    '66+'
  ];

  // List of levels in Arabic
  final List<String> levels = ['مبتدئ', 'متوسط', 'خبير'];

  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();

  String selectedAge = '';
  String selectedCountry = '';
  String selectedLevel = '';

  @override
  void initState() {
    super.initState();
    selectedAge = ages[0]; // Initialize in initState
    selectedCountry = countries[0]; // Initialize in initState
    selectedLevel = levels[0]; // Initialize in initState
  }

  String selectedGender = 'male';
  final StudentServices studentServices = StudentServices();
  bool isLoading = false;
  void handleStudentEdit() async {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      showSnackBar(context, 'لم يتم العثور على مستخدم مسجل', false);
      return;
    }

    // Create a Student object from the form data
    Student student = Student(
      email: user.email ?? '',
      uid: user.uid,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      ageRange: getAgeRangeFromString(selectedAge),
      gender: selectedGender,
      nationality: getNationalityFromString(selectedCountry, isArabic: true),
      phoneNumber: phoneController.text,
      level: getLevelFromString(selectedLevel, isArabic: true),
    );

    // Call the editStudent function
    StudentResponse response = await studentServices.editStudent(student);

    // Handle the response
    if (response.success) {
      setState(() {
        isLoading = true;
      });
      showSnackBar(context, response.message, response.success);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, response.message, response.success);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل حساب طالب جديد'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Image at the top (changes based on gender)
                Center(
                  child: Image.asset(
                    selectedGender == 'female'
                        ? 'assets/img/fstudent.png'
                        : 'assets/img/student.png',
                    height: 150,
                    width: 150,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 16),
                // First Name
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    controller: firstNameController,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: 'الاسم الأول',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال الاسم الأول';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                // Last Name
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    controller: lastNameController,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: 'الاسم الأخير',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال الاسم الأخير';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                // Age Dropdown
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: DropdownButtonFormField<String>(
                    value: selectedAge,
                    items: ages.map((age) {
                      return DropdownMenuItem(
                        value: age,
                        child: Text(age),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedAge = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'العمر',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.calendar_view_day),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Gender Radio Buttons
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'الجنس',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 'male',
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value!;
                              });
                            },
                          ),
                          const Text('ذكر',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Radio(
                            value: 'female',
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value!;
                              });
                            },
                          ),
                          const Text('أنثى',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Country Dropdown
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: DropdownButtonFormField<String>(
                    value: selectedCountry,
                    items: countries.map((country) {
                      return DropdownMenuItem(
                        value: country,
                        child: Text(country),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCountry = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'البلد',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.flag),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Phone Number
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    controller: phoneController,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: 'رقم الهاتف',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.phone),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال رقم الهاتف';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // Level Dropdown
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: DropdownButtonFormField<String>(
                    value: selectedLevel,
                    items: levels.map((level) {
                      return DropdownMenuItem(
                        value: level,
                        child: Text(level),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedLevel = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'المستوى',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.school),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // handle shit here
                        print('تم تسجيل النموذج بنجاح');
                        print('الاسم الأول: ${firstNameController.text}');
                        print('الاسم الأخير: ${lastNameController.text}');
                        print('العمر: $selectedAge');
                        print('البلد: $selectedCountry');
                        print('رقم الهاتف: ${phoneController.text}');
                        print('المستوى: $selectedLevel');
                        print('الجنس: $selectedGender');

                        handleStudentEdit();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('تسجيل',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
