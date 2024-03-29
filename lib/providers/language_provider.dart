import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {

  // default language is english
  bool isEng = true;

  Map<String, dynamic> txtEng = {
    'drawer-title': 'Cooking up',
    'switch-english': 'English',
    'switch-arabic': 'Arabic',
    'drawer-d1': 'Meals',
    'drawer-d2': 'Filters',
    'drawer-d3': 'Themes',
// Page Filters Screen

    'filters-title': 'Filters',
    'filters-txtBody': 'Adjust your meals selections',
    'filters-title1': 'Gluten-Free',
    'filters-title2': 'Lactose-Free',
    'filters-title3': 'Vegetarian',
    'filters-title4': 'Vegan',
    'filters-sub1': 'Only include gluten free meals',
    'filters-sub2': 'Only include lactose free meals',
    'filters-sub3': 'Only include vegetarian meals',
    'filters-sub4': 'Only include vegan meals',
    // Page Themes Screen
    'themes-title': 'Themes',
    'themes-txtBody1': 'Adjust your theme selection.',
    'themes-txtBody2': 'Choose your Theme Mode.',
    'themes-system': 'System Default',
    'themes-light': 'Light Mode',
    'themes-dark': 'Dark Mode',
    'themes-primary': 'Choose your Primary Color',
    'themes-accent': 'Choose your Accent Color',
    'favorite_empty': 'The List your Favorite\n is empty.',
// Page Tab Screen
    'categories-title': 'Categories',
    'favorite-title': 'Favorite',
// Page Categories Screen

    'cat-c1': 'Italian',
    'cat-c2': 'Quick & Easy',
    'cat-c3': 'Hamburgers',
    'cat-c4': 'German',
    'cat-c5': 'Light & Lovely',
    'cat-c6': 'Exotic',
    'cat-c7': 'Breakfast',
    'cat-c8': 'Asian',
    'cat-c9': 'French',
    'cat-c10': 'Summer',
// Page Categories

    'meal-m1': 'Spaghetti with Tomato Sauce',
    'meal-m2': 'Toast Hawaii',
    'meal-m3': 'Classic Hamburger',
    'meal-m4': 'Wiener Schnitzel',
    'meal-m5': 'Salad with Smoked Salmon',
    'meal-m6': 'Delicious Orange Mousse',
    'meal-m7': 'Pancakes',
    'meal-m8': 'Creamy Indian Chicken Curry',
    'meal-m9': 'Chocolate Souffle',
    'meal-m10': 'Asparagus Salad with Cherry Tomatoes',
    'ingredients': 'Ingredients',
    'steps': 'Steps',

    'ingredients-m1': [
      '4 Tomatoes',
      '1 Tablespoon of Olive Oil',
      '1 Onion',
      '250g Spaghetti',
      'Spices',
      'Cheese (optional)',
    ],
    'steps-m1': [
      'Cut the tomatoes and the onion into small pieces.',
      'Boil some water - add salt to it once it boils.',
      'Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes.',
      'In the meantime, heathen up some olive oil and add the cut onion.',
      'After 2 minutes, add the tomato pieces, salt, pepper and your other spices.',
      'The sauce will be done once the spaghetti are.',
      'Feel free to add some cheese on top of the finished dish.'
    ],
    'ingredients-m2': [
      '1 Slice White Bread',
      '1 Slice Ham',
      '1 Slice Pineapple',
      '1-2 Slices of Cheese',
      'Butter',
    ],
    'steps-m2': [
      'Butter one side of the white bread',
      'Layer ham, the pineapple and cheese on the white bread',
      'Bake the toast for round about 10 minutes in the oven at 200°C'
    ],

    'ingredients-m3': [
      '300g Cattle Hack',
      '1 Tomato',
      '1 Cucumber',
      '1 Onion',
      'Ketchup',
      '2 Burger Buns',
    ],
    'steps-m3': [
      'Form 2 patties',
      'Fry the patties for c. 4 minutes on each side',
      'Quickly fry the buns for c. 1 minute on each side',
      'Bruch buns with ketchup',
      'Serve burger with tomato, cucumber and onion',
    ],
    'ingredients-m4': [
      '8 Veal Cutlets',
      '4 Eggs',
      '200g Bread Crumbs',
      '100g Flour',
      '300ml Butter',
      '100g Vegetable Oil',
      'Salt',
      'Lemon Slices',
    ],
    'steps-m4': [
      'Tenderize the veal to about 2–4mm, and salt on both sides.',
      'On a flat plate, stir the eggs briefly with a fork.',
      'Lightly coat the cutlets in flour then dip into the egg, and finally, coat in breadcrumbs.',
      'Heat the butter and oil in a large pan (allow the fat to get very hot) and fry the schnitzels until golden brown on both sides.',
      'Make sure to toss the pan regularly so that the schnitzels are surrounded by oil and the crumbing becomes ‘fluffy’.',
      'Remove, and drain on kitchen paper. Fry the parsley in the remaining oil and drain.',
      'Place the schnitzels on awarmed plate and serve garnishedwith parsley and slices of lemon.',
    ],
    'ingredients-m5': [
      'Arugula',
      'Lamb\'s Lettuce',
      'Parsley',
      'Fennel',
      '200g Smoked Salmon',
      'Mustard',
      'Balsamic Vinegar',
      'Olive Oil',
      'Salt and Pepper',
    ],
    'steps-m5': [
      'Wash and cut salad and herbs',
      'Dice the salmon',
      'Process mustard, vinegar and olive oil into a dessing',
      'Prepare the salad',
      'Add salmon cubes and dressing',
    ],
    'ingredients-m6': [
      '4 Sheets of Gelatin',
      '150ml Orange Juice',
      '80g Sugar',
      '300g Yoghurt',
      '200g Cream',
      'Orange Peel',
    ],
    'steps-m6': [
      'Dissolve gelatin in pot',
      'Add orange juice and sugar',
      'Take pot off the stove',
      'Add 2 tablespoons of yoghurt',
      'Stir gelatin under remaining yoghurt',
      'Cool everything down in the refrigerator',
      'Whip the cream and lift it under die orange mass',
      'Cool down again for at least 4 hours',
      'Serve with orange peel',
    ],
    'ingredients-m7': [
      '1 1/2 Cups all-purpose Flour',
      '3 1/2 Teaspoons Baking Powder',
      '1 Teaspoon Salt',
      '1 Tablespoon White Sugar',
      '1 1/4 cups Milk',
      '1 Egg',
      '3 Tablespoons Butter, melted',
    ],
    'steps-m7': [
      'In a large bowl, sift together the flour, baking powder, salt and sugar.',
      'Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.',
      'Heat a lightly oiled griddle or frying pan over medium high heat.',
      'Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.'
    ],
    'ingredients-m8': [
      '4 Chicken Breasts',
      '1 Onion',
      '2 Cloves of Garlic',
      '1 Piece of Ginger',
      '4 Tablespoons Almonds',
      '1 Teaspoon Cayenne Pepper',
      '500ml Coconut Milk',
    ],
    'steps-m8': [
      'Slice and fry the chicken breast',
      'Process onion, garlic and ginger into paste and sauté everything',
      'Add spices and stir fry',
      'Add chicken breast + 250ml of water and cook everything for 10 minutes',
      'Add coconut milk',
      'Serve with rice',
    ],
    'ingredients-m9': [
      '1 Teaspoon melted Butter',
      '2 Tablespoons white Sugar',
      '2 Ounces 70% dark Chocolate, broken into pieces',
      '1 Tablespoon Butter',
      '1 Tablespoon all-purpose Flour',
      '4 1/3 tablespoons cold Milk',
      '1 Pinch Salt',
      '1 Pinch Cayenne Pepper',
      '1 Large Egg Yolk',
      '2 Large Egg Whites',
      '1 Pinch Cream of Tartar',
      '1 Tablespoon white Sugar',
    ],
    'steps-m9': [
      'Preheat oven to 190°C. Line a rimmed baking sheet with parchment paper.',
      'Brush bottom and sides of 2 ramekins lightly with 1 teaspoon melted butter; cover bottom and sides right up to the rim.',
      'Add 1 tablespoon white sugar to ramekins. Rotate ramekins until sugar coats all surfaces.',
      'Place chocolate pieces in a metal mixing bowl.',
      'Place bowl over a pan of about 3 cups hot water over low heat.',
      'Melt 1 tablespoon butter in a skillet over medium heat. Sprinkle in flour. Whisk until flour is incorporated into butter and mixture thickens.',
      'Whisk in cold milk until mixture becomes smooth and thickens. Transfer mixture to bowl with melted chocolate.',
      'Add salt and cayenne pepper. Mix together thoroughly. Add egg yolk and mix to combine.',
      'Leave bowl above the hot (not simmering) water to keep chocolate warm while you whip the egg whites.',
      'Place 2 egg whites in a mixing bowl; add cream of tartar. Whisk until mixture begins to thicken and a drizzle from the whisk stays on the surface about 1 second before disappearing into the mix.',
      'Add 1/3 of sugar and whisk in. Whisk in a bit more sugar about 15 seconds.',
      'whisk in the rest of the sugar. Continue whisking until mixture is about as thick as shaving cream and holds soft peaks, 3 to 5 minutes.',
      'Transfer a little less than half of egg whites to chocolate.',
      'Mix until egg whites are thoroughly incorporated into the chocolate.',
      'Add the rest of the egg whites; gently fold into the chocolate with a spatula, lifting from the bottom and folding over.',
      'Stop mixing after the egg white disappears. Divide mixture between 2 prepared ramekins. Place ramekins on prepared baking sheet.',
      'Bake in preheated oven until scuffles are puffed and have risen above the top of the rims, 12 to 15 minutes.',
    ],
    'ingredients-m10': [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil',
    ],
    'steps-m10': [
      'Wash, peel and cut the asparagus',
      'Cook in salted water',
      'Salt and pepper the asparagus',
      'Roast the pine nuts',
      'Halve the tomatoes',
      'Mix with asparagus, salad and dressing',
      'Serve with Baguette',
    ],

    'Complexity.Simple': 'Simple',
    'Complexity.Challenging': 'Challenging',
    'Complexity.Hard': 'Hard',
    'Affordability.Affordable': 'Affordable',
    'Affordability.Luxurious': 'Luxurious',
    'Affordability.Pricey': 'Pricey',
    'min1': ' min',
    'min2': ' mins',
    // Page On Boadring Screen

    'start': 'Get Start',
    'choose-lan': 'Choose your Language',
  };

  Map<String, dynamic> txtAra = {
    'drawer-title': 'عالم الطبخ',
    'switch-english': 'الانجليزية',
    'switch-arabic': 'العربية',
    'drawer-d1': 'الوجبـات',
    'drawer-d2': 'تصفية الوجبـات',
    'drawer-d3': 'الثيمــات',

//Page Filters
    'filters-title': 'التصفيـات',
    'filters-txtBody': 'اضبط اختيـارات وجباتـك',
    'filters-title1': 'خالي من الغلوتين',
    'filters-title2': 'خالي من اللاكتوز',
    'filters-title3': 'نبـاتي',
    'filters-title4': 'نبـاتي',
    'filters-sub1': 'يتضمـن فقط الاطعمة الخالية من الغلوتين',
    'filters-sub2': 'يتضمـن فقط الاطعمة الخالية من اللاكتوز',
    'filters-sub3': 'يتضمـن فقط الاطعمة الخالية من المنتجات الحيوانية',
    'filters-sub4':
        'يتضمـن فقط الاطعمة الخالية من المنتجات الحيوانيةومشتقاتهـا',
    //Page Themes

    'themes-title': 'السيمات',
    'themes-txtBody1': 'ضبط اختيار السيمات الخاص بك.',
    'themes-txtBody2': 'اختر وضع السمة الخاص بك.',
    'themes-system': 'النظام الافتراضي',
    'themes-light': 'وضع الضوء',
    'themes-dark': 'الوضع المظلم',
    'themes-primary': 'اختر لونك الأساسي',
    'themes-accent': 'اختر لون التمييز الخاص بك',
    'favorite_empty': 'قائمة المفضلة لديك فارغة.',
    // Page Tab Screen
    'categories-title': 'التصنيفـات',
    'favorite-title': 'المفضلة',
// Page Categories

    'cat-c1': 'إيطالي',
    'cat-c2': 'سريعة وسهلة',
    'cat-c3': 'هامبرغر',
    'cat-c4': 'ألماني',
    'cat-c5': 'خفيف وجميل',
    'cat-c6': 'غَرِيب',
    'cat-c7': 'إفطار',
    'cat-c8': 'اسيوي',
    'cat-c9': 'فرنسي',
    'cat-c10': 'الصيف',

// Page Meals
    'meal-m1': 'معكرونة مع صلصة الطماطم',
    'meal-m2': 'توست هاواي',
    'meal-m3': 'كلاسيك هامبرغر',
    'meal-m4': 'وينر شنيتزل',
    'meal-m5': 'سلطة مع سلمون مدخن',
    'meal-m6': 'موس البرتقال اللذيذ',
    'meal-m7': 'الفطائر',
    'meal-m8': 'دجاج بالكاري الهندي بالكريمة',
    'meal-m9': 'سوفلي الشوكولاته',
    'meal-m10': 'سلطة الهليون مع الطماطم الكرزية',
    'ingredients': 'المكونات',
    'steps': 'الخطوات',
    'ingredients-m1': [
      '4 طماطم',
      ' 1 ملعقة طعام زيت زيتون'
          ' 1 بصلة',
      ' 250 جرام من السباغيتي',
      ' بهارات',
      '  جبن (اختياري) '
    ],
    'steps-m1': [
      'نقطع الطماطم والبصل إلى قطع صغيرة.',
      'اغلي بعض الماء - أضيفي الملح إليه بمجرد أن يغلي.',
      'ضع السباغيتي في الماء المغلي - يجب أن تنضج في غضون 10 إلى 12 دقيقة تقريبًا.',
      'في غضون ذلك ، سخني بعض زيت الزيتون وأضيفي البصل المقطع.',
      'بعد دقيقتين ، أضيفي قطع الطماطم والملح والفلفل والبهارات الأخرى.',
      'ستنضج الصلصة بمجرد نضج الإسباجيتي.',
      'لا تتردد في إضافة بعض الجبن فوق الطبق النهائي.',
    ],
    'ingredients-m2': [
      'شريحة واحدة من الخبز الأبيض ',
      'شريحة واحدة من لحم الخنزير ',
      ' 1 شريحة أناناس',
      ' 1-2 شريحتان من الجبن ',
      'سمنة',
    ],
    'steps-m2': [
      "زبدة جانب واحد من الخبز الأبيض",
      "طبقة لحم الخنزير والأناناس والجبن على الخبز الأبيض",
      "اخبزي التوست لمدة 10 دقائق تقريبًا في الفرن على حرارة 200 درجة مئوية",
    ],
    'ingredients-m3': [
      "300 جرام ماشية هاك",
      ' 1 طماطم',
      ' 1 خيار',
      ' 1 بصلة',
      'كاتشب',
      '2 خبز برجر',
    ],
    'steps-m3': [
      "فطائر شكل 2",
      'تقلى الفطائر من أجل c. 4 دقائق على كل جانب ',
      ' اقلي الكعك بسرعة من أجل ج. دقيقة واحدة على كل جانب  ',
      "الكعك الصغير مع الكاتشب",
      'قدمي البرجر مع الطماطم والخيار والبصل',
    ],
    'ingredients-m4': [
      ' 8 شرحات لحم بتلو،',
      '4 بيضات',
      ' 200 جرام فتات الخبز ',
      '  100 جرام طحين',
      '300 مل زبدة',
      ' 100 جرام زيت نباتي ',
      'ملح',
      'شرائح ليمون',
    ],
    'steps-m4': [
      "طرية لحم العجل إلى حوالي 2-4 مم ، والملح على كلا الجانبين.",
      "على طبق مسطح ، حرك البيض لفترة وجيزة بالشوكة.",
      "غلفي شرائح اللحم بقليل من الدقيق ثم اغمسيها في البيضة ، وأخيراً ضعيها في فتات الخبز",
      ' سخني الزبدة والزيت في مقلاة كبيرة (اتركي الدهن يسخن بشدة) واقلي شرائح اللحم حتى يصبح لونها بنياً ذهبياً من كلا الجانبين.',
      '"تأكد من قلب المقلاة بانتظام حتى تكون شرائح اللحم محاطًا بالزيت ويصبح الفتات" رقيقًا',
      ' قم بإزالة ، وصفي على ورق المطبخ. يقلى البقدونس في الزيت المتبقي ويصفى.',
      "ضع شنيتزل على طبق ساخن وقدم مزينًا بالبقدونس وشرائح الليمون",
    ],
    'ingredients-m5': [
      ' جرجير ',
      'خس الخروف ',
      'بَقدونس ',
      'الشمرة',
      '200 جرام سلمون مدخن',
      'خردل',
      'الخل البلسمي',
      'زيت الزيتون',
      'ملح وفلفل',
    ],
    'steps-m5': [
      'اغسل وقطع السلطة والأعشاب  ',
      ' قطع السلمون إلى مكعبات ',
      "قم بتحويل الخردل والخل وزيت الزيتون إلى صلصة",
      ' تحضير السلطة',
      'أضف مكعبات السلمون والصلصة',
    ],
    'ingredients-m6': [
      ' 4 صفائح من الجيلاتين',
      ' 150 مل عصير برتقال',
      ' 80 جرام سكر',
      '300 جرام زبادي ',
      ' 200 جرام كريم',
      'قشر البرتقال',
    ],
    'steps-m6': [
      "تذوب الجيلاتين في وعاء",
      'أضف عصير البرتقال والسكر ',
      "انزع القدر من على الموقد",
      'أضف ملعقتين كبيرتين من الزبادي.',
      'قلّب الجيلاتين تحت الزبادي المتبقي ',
      "تبريد كل شيء في الثلاجة",
      "اخفقي الكريمة وارفعيها تحت كتلة برتقالية اللون",
      "تبرد مرة أخرى لمدة 4 ساعات على الأقل",
      'تقدم مع قشر البرتقال ',
    ],
    'ingredients-m7': [
      "1 1/2 كوب طحين لجميع الأغراض",
      ' 3 1/2 ملاعق صغيرة من مسحوق الخبز  ',
      '1 ملعقة صغيرة ملح',
      '1 ملعقة كبيرة سكر أبيض ',
      ' 1 1/4 كوب حليب ',
      '1 بيضة',
      ' 3 ملاعق كبيرة زبدة مذابة',
    ],
    'steps-m7': [
      ' في وعاء كبير ، نخلط الطحين والبيكنج بودر والملح والسكر.',
      'اصنع حفرة في الوسط واسكب الحليب والبيض والزبدة المذابة ؛ امزج حتى تصبح ناعمة.',
      'قم بتسخين مقلاة أو مقلاة مدهونة قليلاً بالزيت على نار متوسطة عالية.',
      ' صب الخليط أو اغرفه على صينية الخبز ، باستخدام ربع كوب تقريبًا لكل فطيرة. غواياكيل، الاكوادور.',
    ],
    'ingredients-m8': [
      ' 4 صدور دجاج',
      ' 1 بصلة',
      ' 2 فص ثوم ',
      '  قطعة واحدة من الزنجبيل',
      ' 4 ملاعق كبيرة لوز ',
      '  1 ملعقة صغيرة فلفل كايين ',
      '   500 مل من حليب جوز الهند'
    ],
    'steps-m8': [
      "قطع صدر الدجاج إلى شرائح وقليها",
      "يُطحن البصل والثوم والزنجبيل في عجينة ويقلى كل شيء",
      "أضف التوابل وتقلي في القلي",
      "يضاف صدر الدجاج + 250 مل من الماء ويطهى كل شيء لمدة 10 دقائق",
      ' أضف حليب جوز الهند ',
      ' يقدم مع الأرز',
    ],
    'ingredients-m9': [
      '1 ملعقة صغيرة زبدة مذابة ',
      '2 ملاعق كبيرة سكر أبيض ',
      ' 2 أونصة شوكولاتة داكنة 70٪ ، مقطعة إلى قطع ',
      '1 ملعقة كبيرة زبدة ',
      '1 ملعقة كبيرة طحين لجميع الأغراض ',
      "4 1/3 ملاعق كبيرة من الحليب البارد",
      '1 رشة ملح',
      'رشة فلفل كايين ',
      '1 صفار بيض كبير ',
      '2 بياض بيض كبير ',
      'رشة من كريمة التارتار ',
      '1 ملعقة كبيرة سكر أبيض ',
    ],
    'steps-m9': [
      'سخني الفرن إلى 190 درجة مئوية. قم بتبطين ورقة خبز مطوية بورق زبدة. ',
      'ادهنوا قاع وجوانب 2 رامكين برفق بملعقة صغيرة من الزبدة المذابة ؛ تغطية القاع والجوانب حتى الحافة.',
      'أضيفي ملعقة كبيرة من السكر الأبيض إلى رامكينز. قم بتدوير القوالب حتى يغطي السكر جميع الأسطح. ',
      "ضع قطع الشوكولاتة في وعاء خلط معدني.",
      "ضع وعاءً فوق قدر به حوالي 3 أكواب من الماء الساخن على نار خفيفة.",
      'تذوب 1 ملعقة كبيرة زبدة في مقلاة على نار متوسطة. يرش الدقيق. اخفقي حتى يندمج الدقيق مع الزبدة ويثخن الخليط.',
      'اخفقي في الحليب البارد حتى يصبح المزيج ناعما و يثخن. نقل الخليط إلى وعاء مع الشوكولاتة المذابة.',
      'أضف الملح والفلفل الحار. تخلط جيدا. أضف صفار البيض واخلطهم حتى يمتزجوا.',
      "اترك الوعاء فوق الماء الساخن (وليس على نار هادئة) للحفاظ على الشوكولاتة دافئة أثناء خفق بياض البيض.",
      'ضعي بياض بيضتين في وعاء الخلط. أضف كريم التارتار. خفقت حتى يبدأ الخليط في التكاثف ويبقى رذاذ من الخفق على السطح لمدة ثانية واحدة قبل أن يختفي في المزيج.',
      "أضف ثلث السكر واخفقه. اخفق في القليل من السكر لمدة 15 ثانية.",
      'اخفقي باقي السكر. استمر في الخفق حتى يصبح المزيج كثيفًا مثل كريم الحلاقة ويحمل قممًا ناعمة ، من 3 إلى 5 دقائق.',
      "انقل أقل من نصف بياض البيض إلى الشوكولاتة",
      "امزج حتى يندمج بياض البيض جيدًا في الشوكولاتة.",
      'أضف باقي بياض البيض. قم بطي الشوكولاتة برفق باستخدام ملعقة ، ثم ارفعها من الأسفل وقم بطيها. ',
      'توقف عن الخلط بعد أن يختفي بياض البيض. يقسم الخليط بين 2 رامكين محضرة. ضع القوالب على صينية خبز مُجهزة. ',
      "اخبزي في فرن مسخن مسبقًا حتى تنفخ المشاجرات ويرتفع فوق قمة الحافات ، من 12 إلى 15 دقيقة.",
    ],
    'ingredients-m10': [
      "الهليون الأبيض والأخضر",
      '30 جرام صنوبر ،',
      '300 جرام طماطم كرزية ،',
      'سلطة',
      'ملح وفلفل وزيت زيتون',
    ],
    'steps-m10': [
      'اغسل وقشر واقطع الهليون ',
      "طبخ في ماء مملح",
      "ملح وفلفل الهليون",
      'تحميص الصنوبر ',
      ' قطع الطماطم إلى نصفين',
      "تخلط مع الهليون والسلطة والتتبيلة",
      "تقدم مع الرغيف الفرنسي",
    ],

    'Complexity.Simple': 'سهلة',
    'Complexity.Challenging': 'معقدة',
    'Complexity.Hard': 'صعبة',
    'Affordability.Affordable': 'معقولة التكاليف',
    'Affordability.Luxurious': 'فاخرة',
    'Affordability.Pricey': 'غالية التكاليف',

    'min1': 'دقائق',
    'min2': 'دقيقة',
    // Page On Boadring Screen

    'start': 'ابدأ الان',
    'choose-lan': 'اختر لغتك',
  };

  onChangeLanguage(bool newLan) async {
    isEng = newLan;
    notifyListeners();
    var pref = await SharedPreferences.getInstance();

    pref.setBool('isEng', isEng);
  }

  dynamic getText(String txt) {
    if (isEng) {
      return txtEng[txt];
    } else {
      return txtAra[txt];
    }
  }

  getLanguagePref() async {
    var pref = await SharedPreferences.getInstance();

    isEng = pref.getBool('isEng') ?? true;
    notifyListeners();
  }
}
