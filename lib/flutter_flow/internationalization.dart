import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    'q2a1rv7z': {
      'en': 'gym racks',
      'ar': 'رفوف الصالة الرياضية',
    },
    'c71z0t0b': {
      'en': 'Welcome Back',
      'ar': 'مرحبًا بعودتك',
    },
    '7bi4q2h7': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'urg9df5a': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    '0897hwlm': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
    },
    'tbm7liex': {
      'en': 'forget password? ',
      'ar': 'نسيت كلمة المرور؟',
    },
    'gl9d4czg': {
      'en': 'click here',
      'ar': 'انقر هنا',
    },
    'biqq9jl4': {
      'en': 'change language/تغيير اللغة\n',
      'ar': 'تغيير اللغة/تغيير اللغة',
    },
    'j7e4p0xx': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // forget
  {
    'n684erlu': {
      'en': 'Back',
      'ar': 'خلف',
    },
    'qf86wpwn': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
    },
    '1wdck0hn': {
      'en':
          'We will send you an email with a link to reset your password, please enter the ID associated with your account below.',
      'ar':
          'سنرسل إليك بريدًا إلكترونيًا يحتوي على رابط لإعادة تعيين كلمة المرور الخاصة بك، يرجى إدخال المعرف المرتبط بحسابك أدناه.',
    },
    'wpilo1wk': {
      'en': 'Your ID....',
      'ar': 'هويتك....',
    },
    '4dum3rcq': {
      'en': 'Enter your ID...',
      'ar': 'أدخل المعرف...',
    },
    '9wcd9jc1': {
      'en': 'Send Link',
      'ar': 'أرسل الرابط',
    },
    'h3x2zw4b': {
      'en': 'Back',
      'ar': 'خلف',
    },
    'fic9ut71': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Profilepage
  {
    '587vla5b': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
    },
    'ehlqoqku': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
    },
    'gqgtuzbw': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
    },
    '9lfvsz3o': {
      'en': 'Log Out',
      'ar': 'تسجيل خروج',
    },
    '0hv4zuk5': {
      'en': '__',
      'ar': '__',
    },
  },
  // searchprofiles
  {
    'aplt8cj0': {
      'en': 'Search members...',
      'ar': 'البحث عن الأعضاء...',
    },
    'j8xg868t': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'sw1zji5a': {
      'en': 'Members in Project',
      'ar': 'الأعضاء في المشروع',
    },
    '37izcyo7': {
      'en': 'Randie Mcmullens',
      'ar': '',
    },
    '1f1dntfi': {
      'en': '(123) 456-7890',
      'ar': '',
    },
    'yeyeli7s': {
      'en': 'name@domain.com',
      'ar': '',
    },
    'd3vo1gki': {
      'en': 'Raney Bold',
      'ar': '',
    },
    'k73vxd86': {
      'en': '(123) 456-7890',
      'ar': '',
    },
    'jof2bcqo': {
      'en': 'name@domain.com',
      'ar': '',
    },
    'vjwlx1s2': {
      'en': 'Ragina Smith',
      'ar': '',
    },
    'fnd25z6g': {
      'en': '(123) 456-7890',
      'ar': '',
    },
    'kw5apafb': {
      'en': 'name@domain.com',
      'ar': '',
    },
    'f94v6i1j': {
      'en': 'Ra Kuo',
      'ar': '',
    },
    'eg8er7ck': {
      'en': '(123) 456-7890',
      'ar': '',
    },
    '6rp3g7jc': {
      'en': 'name@domain.com',
      'ar': '',
    },
    'mg3y60ql': {
      'en': 'Raku Davis',
      'ar': '',
    },
    'q957yf7k': {
      'en': '(123) 456-7890',
      'ar': '',
    },
    'f1e1lej2': {
      'en': 'name@domain.com',
      'ar': '',
    },
    '2vswhp4u': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // editprofile
  {
    '615nmzz9': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
    },
    '33cey4yk': {
      'en': 'edit profile',
      'ar': 'تعديل الملف الشخصي',
    },
  },
  // userview
  {
    'k3zwzf28': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
    },
    '7wbp6l2o': {
      'en': ' Information',
      'ar': 'معلومة',
    },
    'b86awwvf': {
      'en': 'height',
      'ar': 'ارتفاع',
    },
    'aah0b5kn': {
      'en': 'weight',
      'ar': 'وزن',
    },
    '3mfi433v': {
      'en': 'Label here...',
      'ar': '',
    },
    't6jv0kqh': {
      'en': 'fatPercentage',
      'ar': 'وزن',
    },
    'eq6f2esr': {
      'en': 'Label here...',
      'ar': '',
    },
    'l59rj83x': {
      'en': 'confirm',
      'ar': '',
    },
    'yuskpx6h': {
      'en': 'meal plan',
      'ar': 'خطة الوجبة',
    },
    's5hwg69l': {
      'en': 'add points',
      'ar': 'خطة الوجبة',
    },
    'hq0bm6ij': {
      'en': 'uplode pdf',
      'ar': '',
    },
  },
  // homepage
  {
    'vt6fpb1m': {
      'en': 'Expert in diet planning',
      'ar': 'خبير في تخطيط النظام الغذائي',
    },
    'l1n1zabh': {
      'en': 'Welcome to your nutritionist dashboard',
      'ar': 'مرحبًا بك في لوحة التحكم الخاصة بأخصائي التغذية',
    },
    '5ez74ur6': {
      'en': 'Meal Plans',
      'ar': 'خطط الوجبات',
    },
    'vkpi1bri': {
      'en': 'create Appointments',
      'ar': 'تعيينات',
    },
    'o6ydr123': {
      'en': 'show Appointments',
      'ar': 'تعيينات',
    },
    'g6n18iqg': {
      'en': 'Notifications',
      'ar': '',
    },
    'tdu7rfym': {
      'en': 'New',
      'ar': '',
    },
    '3cej5g3p': {
      'en': 'new event is coming',
      'ar': '',
    },
    'ycsx21wb': {
      'en': '3m ago',
      'ar': '',
    },
    '6d6mk53v': {
      'en': 'meeting at 9',
      'ar': '',
    },
    'qyd1fj1w': {
      'en': '3m ago',
      'ar': '',
    },
    'iytz5kyc': {
      'en': 'new traniee has been added',
      'ar': '',
    },
    'okd0ypdd': {
      'en': '3m ago',
      'ar': '',
    },
    'mirqvtxh': {
      'en': 'All',
      'ar': '',
    },
    '195z38fg': {
      'en': 'New Product View',
      'ar': '',
    },
    '8tt2rnpi': {
      'en': 'Sally Mandrus, viewed your product',
      'ar': '',
    },
    'bia347zs': {
      'en': '3m ago',
      'ar': '',
    },
    '8fz11kcs': {
      'en': 'New Product View',
      'ar': '',
    },
    'gu94ovc6': {
      'en': 'Sally Mandrus, viewed your product',
      'ar': '',
    },
    'ju7kmubs': {
      'en': '3m ago',
      'ar': '',
    },
    'ug7dpjxx': {
      'en': 'New Product View',
      'ar': '',
    },
    'ax69xg87': {
      'en': 'Sally Mandrus, viewed your product',
      'ar': '',
    },
    'da9rdnop': {
      'en': '3m ago',
      'ar': '',
    },
    '0u7o4izp': {
      'en': 'New Product View',
      'ar': '',
    },
    'a0oovws8': {
      'en': 'Sally Mandrus, viewed your product',
      'ar': '',
    },
    'pai6d87k': {
      'en': '3m ago',
      'ar': '',
    },
    'zz78o505': {
      'en': 'New Product View',
      'ar': '',
    },
    '18te5dwy': {
      'en': 'Sally Mandrus, viewed your product',
      'ar': '',
    },
    'dh1o5oxe': {
      'en': '3m ago',
      'ar': '',
    },
    'jouqj4pc': {
      'en': 'Nutritionist Dashboard',
      'ar': 'لوحة معلومات التغذية',
    },
    'sqhi3422': {
      'en': 'home page',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // appointment
  {
    'xycsvef2': {
      'en': 'Make an Appointment',
      'ar': '',
    },
    'ovzabro2': {
      'en': 'Full Name',
      'ar': '',
    },
    '3iry0kdx': {
      'en': 'Enter your full name',
      'ar': '',
    },
    'odzgzhxb': {
      'en': 'Email Address',
      'ar': '',
    },
    'tbppzdkh': {
      'en': 'Enter your email address',
      'ar': '',
    },
    'nn2kziyk': {
      'en': 'Time',
      'ar': '',
    },
    '2061y7n1': {
      'en': 'Enter time',
      'ar': '',
    },
    'nlno5thk': {
      'en': 'day',
      'ar': '',
    },
    'svrbpdy1': {
      'en': 'Enter day',
      'ar': '',
    },
    'awk1wtdw': {
      'en': 'Confirm Appointment',
      'ar': '',
    },
    'gmarekbv': {
      'en': 'Appointment',
      'ar': '',
    },
  },
  // seeappo
  {
    'tby6z64b': {
      'en': 'upcoming appointments',
      'ar': '',
    },
  },
  // seeplans
  {
    'z8x53djm': {
      'en': 'Meal Plans',
      'ar': '',
    },
    '92d01hn6': {
      'en': 'add plan',
      'ar': '',
    },
  },
  // editmeals
  {
    'k780ybtl': {
      'en': 'Your Plan',
      'ar': '',
    },
    '3vfzohp4': {
      'en': 'Recent Meals',
      'ar': '',
    },
    'nuf0p9jr': {
      'en': 'Snack',
      'ar': '',
    },
    'j9nm3xzp': {
      'en': 'food',
      'ar': '',
    },
    't0x89144': {
      'en': 'calories ',
      'ar': '',
    },
    's0ji6kw0': {
      'en': 'amount',
      'ar': '',
    },
    'cwthg6pr': {
      'en': ' Meal Plan',
      'ar': 'خطة الوجبة الخاصة بك',
    },
    '3ca8xn2n': {
      'en': 'this month',
      'ar': 'الاثنين',
    },
    'c2bx7tf9': {
      'en': 'breakfast',
      'ar': '',
    },
    'nc867h4r': {
      'en': 'food',
      'ar': '',
    },
    'x4z46w01': {
      'en': 'calories',
      'ar': '',
    },
    'gy2jc5lg': {
      'en': 'amount',
      'ar': '',
    },
    '3bd0s9wt': {
      'en': 'lunch',
      'ar': '',
    },
    'mcsy06mc': {
      'en': 'food',
      'ar': '',
    },
    'vzasvqv6': {
      'en': 'calories',
      'ar': '',
    },
    'krmkxgnv': {
      'en': 'amount',
      'ar': '',
    },
    'z6irzmv0': {
      'en': 'dinner',
      'ar': '',
    },
    '4q1h0ocw': {
      'en': 'food',
      'ar': '',
    },
    'xrrwcvfj': {
      'en': 'calories',
      'ar': '',
    },
    'dxi73vpi': {
      'en': 'amount',
      'ar': '',
    },
    '6hznn416': {
      'en': 'modify plan\n',
      'ar': 'تعديل الخطة',
    },
    'nsb9dvxw': {
      'en': 'food plan',
      'ar': '',
    },
  },
  // points
  {
    'p233e9r2': {
      'en': 'Points Overview',
      'ar': '',
    },
    'a8wfddhz': {
      'en': 'Add Points',
      'ar': '',
    },
    'uyt0mbgf': {
      'en': 'User Points',
      'ar': '',
    },
    '592kpl4r': {
      'en': 'Current Points',
      'ar': '',
    },
    '7x8tnxpf': {
      'en': '0',
      'ar': '',
    },
    '6jdf3wjv': {
      'en': 'Add Points',
      'ar': '',
    },
    'go48p7z9': {
      'en': 'Enter points...',
      'ar': '',
    },
    'qd09lwxz': {
      'en': 'Update Points',
      'ar': '',
    },
    'wy0b94db': {
      'en': 'Milestones',
      'ar': '',
    },
  },
  // addmeal
  {
    '4utaixrr': {
      'en': 'Your Plan',
      'ar': '',
    },
    '9hnq7l95': {
      'en': 'Label here...',
      'ar': '',
    },
    '7ph4p3pw': {
      'en': 'Recent Meals',
      'ar': '',
    },
    'w667jjj2': {
      'en': 'Snack',
      'ar': '',
    },
    'xurn17me': {
      'en': 'Label here...',
      'ar': '',
    },
    '31agoym8': {
      'en': 'Label here...',
      'ar': '',
    },
    'fy372w0e': {
      'en': 'Label here...',
      'ar': '',
    },
    '17b2f93u': {
      'en': ' Meal Plan',
      'ar': 'خطة الوجبة الخاصة بك',
    },
    'pcnqfbny': {
      'en': 'this month',
      'ar': 'الاثنين',
    },
    'th6f5w8f': {
      'en': 'breakfast',
      'ar': '',
    },
    'f39divzv': {
      'en': 'Label here...',
      'ar': '',
    },
    '81qaukbk': {
      'en': 'Label here...',
      'ar': '',
    },
    'nupj549b': {
      'en': 'Label here...',
      'ar': '',
    },
    '1ylsolra': {
      'en': 'lunch',
      'ar': '',
    },
    '4y7hkatf': {
      'en': 'Label here...',
      'ar': '',
    },
    '1q9q27yw': {
      'en': 'Label here...',
      'ar': '',
    },
    '6ozjb81b': {
      'en': 'Label here...',
      'ar': '',
    },
    '3ucxqo1p': {
      'en': 'dinner',
      'ar': '',
    },
    'do2n60ge': {
      'en': 'Label here...',
      'ar': '',
    },
    'pznz3fy2': {
      'en': 'Label here...',
      'ar': '',
    },
    'emuivx5o': {
      'en': 'Label here...',
      'ar': '',
    },
    'z30nvgwi': {
      'en': 'add plan\n',
      'ar': 'تعديل الخطة',
    },
    '1rwxzu3c': {
      'en': 'food plan',
      'ar': '',
    },
  },
  // modul
  {
    'qnh70k16': {
      'en': 'milestone',
      'ar': '',
    },
    '31zf4pcx': {
      'en': 'New milestone',
      'ar': '',
    },
    '9tgr22h7': {
      'en': 'Change milestone',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    '1zhchouu': {
      'en': '',
      'ar': '',
    },
    'huke9ewu': {
      'en': '',
      'ar': '',
    },
    'my8asv09': {
      'en': '',
      'ar': '',
    },
    '9b9dq136': {
      'en': '',
      'ar': '',
    },
    'dvjw9fc7': {
      'en': '',
      'ar': '',
    },
    'miaczedh': {
      'en': '',
      'ar': '',
    },
    '5r3s727p': {
      'en': '',
      'ar': '',
    },
    'bfeu8e0m': {
      'en': '',
      'ar': '',
    },
    '2o98ayqb': {
      'en': '',
      'ar': '',
    },
    'qfmru4ri': {
      'en': '',
      'ar': '',
    },
    '2fg4uqgz': {
      'en': '',
      'ar': '',
    },
    '406sht3y': {
      'en': '',
      'ar': '',
    },
    'k0rjpsn1': {
      'en': '',
      'ar': '',
    },
    'c2mxpdmu': {
      'en': '',
      'ar': '',
    },
    '27ytbtvt': {
      'en': '',
      'ar': '',
    },
    'e6w9f86l': {
      'en': '',
      'ar': '',
    },
    'e386g2ws': {
      'en': '',
      'ar': '',
    },
    'sp160z5e': {
      'en': '',
      'ar': '',
    },
    'hvwrgato': {
      'en': '',
      'ar': '',
    },
    '99x40hzb': {
      'en': '',
      'ar': '',
    },
    'kdkfpv9q': {
      'en': '',
      'ar': '',
    },
    '5xriyejx': {
      'en': '',
      'ar': '',
    },
    'aklf1v1b': {
      'en': '',
      'ar': '',
    },
    'rp4g4dwm': {
      'en': '',
      'ar': '',
    },
    'q36njdqp': {
      'en': '',
      'ar': '',
    },
    '7pnhx2vd': {
      'en': '',
      'ar': '',
    },
    '4yrmk042': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
