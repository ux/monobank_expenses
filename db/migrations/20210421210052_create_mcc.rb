Hanami::Model.migration do
  MCC_LABELS = {"Ветеринары"=>[742], "Сельскохозяйственные кооперативы"=>[763], "Садоводство. Ландшафтный дизайн"=>[780], "Строительство. Подрядчики"=>[1520], "Кондиционеры. Установка"=>[1711], "Электрики"=>[1731], "Строители. Облицовка"=>[1740], "Столяры"=>[1750], "Кровельщики"=>[1761], "Строительство. Бетон"=>[1771], "Контракторы"=>[1799], "Печатное дело"=>[2741], "Наборщики"=>[2791], "Чистка"=>[2842, 7217], "Авиалинии"=>[3000, 3001, 3002, 3003, 3004, 3005, 3006, 3007, 3008, 3009, 3010, 3011, 3012, 3013, 3014, 3015, 3016, 3017, 3018, 3019, 3020, 3021, 3022, 3023, 3024, 3025, 3026, 3027, 3028, 3029, 3030, 3031, 3032, 3033, 3034, 3035, 3036, 3037, 3038, 3039, 3040, 3041, 3042, 3043, 3044, 3045, 3046, 3047, 3048, 3049, 3050, 3051, 3052, 3053, 3054, 3055, 3056, 3057, 3058, 3059, 3060, 3061, 3062, 3063, 3064, 3065, 3066, 3067, 3068, 3069, 3070, 3071, 3072, 3073, 3074, 3075, 3076, 3077, 3078, 3079, 3080, 3081, 3082, 3083, 3084, 3085, 3086, 3087, 3088, 3089, 3090, 3091, 3092, 3093, 3094, 3095, 3096, 3097, 3098, 3099, 3100, 3101, 3102, 3103, 3104, 3105, 3106, 3107, 3108, 3109, 3110, 3111, 3112, 3113, 3114, 3115, 3116, 3117, 3118, 3119, 3120, 3121, 3122, 3123, 3124, 3125, 3126, 3127, 3128, 3129, 3130, 3131, 3132, 3133, 3134, 3135, 3136, 3137, 3138, 3139, 3140, 3141, 3142, 3143, 3144, 3145, 3146, 3147, 3148, 3149, 3150, 3151, 3152, 3153, 3154, 3155, 3156, 3157, 3158, 3159, 3160, 3161, 3162, 3163, 3164, 3165, 3166, 3167, 3168, 3169, 3170, 3171, 3172, 3173, 3174, 3175, 3176, 3177, 3178, 3179, 3180, 3181, 3182, 3183, 3184, 3185, 3186, 3187, 3188, 3189, 3190, 3191, 3192, 3193, 3194, 3195, 3196, 3197, 3198, 3199, 3200, 3201, 3202, 3203, 3204, 3205, 3206, 3207, 3208, 3209, 3210, 3211, 3212, 3213, 3214, 3215, 3216, 3217, 3218, 3219, 3220, 3221, 3222, 3223, 3224, 3225, 3226, 3227, 3228, 3229, 3230, 3231, 3232, 3233, 3234, 3235, 3236, 3237, 3238, 3239, 3240, 3241, 3242, 3243, 3244, 3245, 3246, 3247, 3248, 3249, 3250, 3251, 3252, 3253, 3254, 3255, 3256, 3257, 3258, 3259, 3260, 3261, 3262, 3263, 3264, 3265, 3266, 3267, 3268, 3269, 3270, 3271, 3272, 3273, 3274, 3275, 3276, 3277, 3278, 3279, 3280, 3281, 3282, 3283, 3284, 3285, 3286, 3287, 3288, 3289, 3290, 3291, 3292, 3293, 3294, 3295, 3296, 3297, 3298, 3299], "Аренда авто"=>[3351, 3352, 3353, 3354, 3355, 3356, 3357, 3358, 3359, 3360, 3361, 3362, 3363, 3364, 3365, 3366, 3367, 3368, 3369, 3370, 3371, 3372, 3373, 3374, 3375, 3376, 3377, 3378, 3379, 3380, 3381, 3382, 3383, 3384, 3385, 3386, 3387, 3388, 3389, 3390, 3391, 3392, 3393, 3394, 3395, 3396, 3397, 3398, 3399, 3400, 3401, 3402, 3403, 3404, 3405, 3406, 3407, 3408, 3409, 3410, 3411, 3412, 3413, 3414, 3415, 3416, 3417, 3418, 3419, 3420, 3421, 3422, 3423, 3424, 3425, 3426, 3427, 3428, 3429, 3430, 3431, 3432, 3433, 3434, 3435, 3436, 3437, 3438, 3439, 3440, 3441, 7512], "Отели. Курорты"=>[3501, 3502, 3503, 3504, 3505, 3506, 3507, 3508, 3509, 3510, 3511, 3512, 3513, 3514, 3515, 3516, 3517, 3518, 3519, 3520, 3521, 3522, 3523, 3524, 3525, 3526, 3527, 3528, 3529, 3530, 3531, 3532, 3533, 3534, 3535, 3536, 3537, 3538, 3539, 3540, 3541, 3542, 3543, 3544, 3545, 3546, 3547, 3548, 3549, 3550, 3551, 3552, 3553, 3554, 3555, 3556, 3557, 3558, 3559, 3560, 3561, 3562, 3563, 3564, 3565, 3566, 3567, 3568, 3569, 3570, 3571, 3572, 3573, 3574, 3575, 3576, 3577, 3578, 3579, 3580, 3581, 3582, 3583, 3584, 3585, 3586, 3587, 3588, 3589, 3590, 3591, 3592, 3593, 3594, 3595, 3596, 3597, 3598, 3599, 3600, 3601, 3602, 3603, 3604, 3605, 3606, 3607, 3608, 3609, 3610, 3611, 3612, 3613, 3614, 3615, 3616, 3617, 3618, 3619, 3620, 3621, 3622, 3623, 3624, 3625, 3626, 3627, 3628, 3629, 3630, 3631, 3632, 3633, 3634, 3635, 3636, 3637, 3638, 3639, 3640, 3641, 3642, 3643, 3644, 3645, 3646, 3647, 3648, 3649, 3650, 3651, 3652, 3653, 3654, 3655, 3656, 3657, 3658, 3659, 3660, 3661, 3662, 3663, 3664, 3665, 3666, 3667, 3668, 3669, 3670, 3671, 3672, 3673, 3674, 3675, 3676, 3677, 3678, 3679, 3680, 3681, 3682, 3683, 3684, 3685, 3686, 3687, 3688, 3689, 3690, 3691, 3692, 3693, 3694, 3695, 3696, 3697, 3698, 3699, 3700, 3701, 3702, 3703, 3704, 3705, 3706, 3707, 3708, 3709, 3710, 3711, 3712, 3713, 3714, 3715, 3716, 3717, 3718, 3719, 3720, 3721, 3722, 3723, 3724, 3725, 3726, 3727, 3728, 3729, 3730, 3731, 3732, 3733, 3734, 3735, 3736, 3737, 3738, 3739, 3740, 3741, 3742, 3743, 3744, 3745, 3746, 3747, 3748, 3749, 3750, 3751, 3752, 3753, 3754, 3755, 3756, 3757, 3758, 3759, 3760, 3761, 3762, 3763, 3764, 3765, 3766, 3767, 3768, 3769, 3770, 3771, 3772, 3773, 3774, 3775, 3776, 3777, 3778, 3779, 3780, 3781, 3782, 3783, 3784, 3785, 3786, 3787, 3788, 3789, 3790], "Отели"=>[3816, 3835, 7011], "Железные дороги"=>[4011, 4112], "Перевозки"=>[4111], "Скорая помощь"=>[4119], "Такси"=>[4121], "Перевозки. Автобус"=>[4131], "Транспортировка. Доставка"=>[4214], "Курьеры"=>[4215], "Хранилище"=>[4225], "Круизные линии"=>[4411], "Аренда суден"=>[4457], "Яхтинговый сервис"=>[4468], "Авалинии"=>[4511], "Аэропорты"=>[4582], "Туристические агентства"=>[4722], "Туроператор"=>[4723], "Платные дороги"=>[4784], "Транспортные услуги"=>[4789], "Телекоммуникационное оборудование"=>[4812], "Мобильная связь"=>[4814], "Телефонные услуги"=>[4815], "Информационные услуги"=>[4816, 5967, 7375], "Телеграф"=>[4821], "Перевод"=>[4829,6535,6536,6537,6538,6539,6540], "Телевидение"=>[4899], "Коммунальные услуги"=>[4900], "Автозапчасти"=>[5013, 5531], "Мебель"=>[5021], "Стройматериалы"=>[5039, 5211], "Офисное оборудование"=>[5044], "Компьютеры. Программное обеспечение"=>[5045], "Оборудование"=>[5046], "Медицинское оборудование"=>[5047], "Обработка металла"=>[5051], "Электроника"=>[5065], "Аппаратура"=>[5072], "Сантехника"=>[5074], "Промышленность"=>[5085], "Драгоценности"=>[5094], "Товары"=>[5099, 5199], "Канцелярия"=>[5111], "Лекарства"=>[5122], "Текстиль"=>[5131], "Одежда"=>[5137, 5651, 5691], "Обувь"=>[5139, 5661], "Химия"=>[5169], "Бензин"=>[5172], "Книги. Пресса"=>[5192], "Цветы"=>[5193], "Краски"=>[5198], "Товары для дома"=>[5200], "Ремонт"=>[5231, 7699], "Скобяные товары"=>[5251], "Садовые принадлежности"=>[5261], "Дома на колёсах"=>[5271], "Оптовики"=>[5300], "Duty Free"=>[5309], "Дискаунтеры"=>[5310], "Универмаги"=>[5311, 5331, 5399], "Продукты"=>[5411, 5499], "Мясо"=>[5422], "Сладости"=>[5441], "Фермерские товары"=>[5451], "Пекарни"=>[5462], "Автосалоны"=>[5511, 5521, 5561, 5571, 5592, 5598, 5599], "Шины"=>[5532], "Автомагазины"=>[5533], "СТО"=>[5541, 7538], "АЗС"=>[5542], "Лодки"=>[5551], "Мужская одежда"=>[5611], "Женская одежда"=>[5621, 5631], "Детская одежда"=>[5641], "Спортивная одежда"=>[5655], "Мех"=>[5681], "Ателье"=>[5697], "Парики"=>[5698], "Аксессуары"=>[5699], "Фурнитура"=>[5712], "Покрытия для пола"=>[5713], "Шторы. Занавески"=>[5714], "Камины"=>[5718], "Фурнитруа"=>[5719], "Бытовая техника"=>[5722, 5732], "Музыкальные инструменты"=>[5733], "Компьютерное ПО"=>[5734], "Магазины звукозаписи"=>[5735], "Доставка еды"=>[5811], "Кафе. Рестораны"=>[5812], "Бары"=>[5813], "Фастфуд"=>[5814], "Цифровые товары"=>[5815, 5818], "Игры"=>[5816], "Программное обеспечение"=>[5817], "Антиквариат"=>[5832, 5932], "Аптеки"=>[5912], "Спиртные напитки"=>[5921], "Секонд-хенд"=>[5931], "Ломбарды"=>[5933], "Автосвалка"=>[5935], "Магазины репродукций"=>[5937], "Велосипеды"=>[5940], "Товары для спорта"=>[5941], "Книжные магазины"=>[5942], "Канцтовары"=>[5943], "Часы и ювелирные изделия"=>[5944], "Игрушки"=>[5945], "Фототовары"=>[5946], "Сувениры"=>[5947], "Кожаные изделия"=>[5948], "Товары для шитья"=>[5949], "Хрусталь"=>[5950], "Стахование"=>[5960], "Товары почтой"=>[5961, 5964, 5965, 5966, 5969], "Путешествия"=>[5962], "Коммивояжеры"=>[5963], "Подписки"=>[5968], "Художественные товары"=>[5970], "Галереи"=>[5971], "Филателизм"=>[5972], "Церковные лавки"=>[5973], "Слуховые аппараты"=>[5975], "Протезы"=>[5976], "Косметика"=>[5977], "Печатные машины"=>[5978], "Топливо"=>[5983], "Флористика"=>[5992], "Табачные изделия"=>[5993], "Газеты. Журналы"=>[5994], "Зоотовары"=>[5995], "Бассейны"=>[5996], "Бритвы"=>[5997], "Тенты"=>[5998], "Разное"=>[5999, 7299], "Кассы"=>[6010, 6011], "Финансовые услуги"=>[6012], "Квази-кэш"=>[6051], "Ценные бумаги"=>[6211], "Страхование"=>[6300, 6381, 6399], "Аренда недвижимости"=>[6513], "Тайм-шер недвижимости"=>[7012], "Рекреация"=>[7032], "Кемпинг"=>[7033], "Стирка и уборка"=>[7210], "Стирка"=>[7211], "Химчистка"=>[7216], "Фотостудия"=>[7221], "Красота"=>[7230], "Ремонт одежды"=>[7251], "Ритуальные услуги"=>[7261], "Знакомства. Эскорт"=>[7273], "Налоги"=>[7276, 9311], "Констультация"=>[7277], "Клубы"=>[7278], "Прокат одежды"=>[7296], "Массаж"=>[7297], "Здоровье и красота"=>[7298], "Реклама"=>[7311], "БКИ"=>[7321], "Копи-центры"=>[7332, 7338], "Фотография и искусство"=>[7333], "Стенография"=>[7339], "Дезинфекция"=>[7342], "Чистка и обслуживание"=>[7349], "Трудоустройство"=>[7361], "Программирование"=>[7372], "Ремонт компьютеров"=>[7379], "Консультации, PR"=>[7392], "Детективные агентства"=>[7393], "Аренда снаряжения"=>[7394], "Фотопечать"=>[7395], "Бизнес-услуги"=>[7399], "Стоянки"=>[7511], "Аренда грузовиков"=>[7513], "Аренда автомобилей"=>[7519], "Парковка"=>[7523], "Ремонт авто"=>[7531], "Шиномонтаж"=>[7534], "Автомобильные краски"=>[7535], "Автомойка"=>[7542], "Эвакуатор"=>[7549], "Ремонт техники"=>[7622, 7629], "Ремонт климатической техники"=>[7623], "Ремонт часов и ювелирных изделий"=>[7631], "Ремонт мебели"=>[7641], "Сварочные работы"=>[7692], "Государственная лотерея"=>[7800], "Онлайн-казино"=>[7801], "Скачки"=>[7802], "Производство видео"=>[7829], "Кинотеатры"=>[7832], "Прокат видео"=>[7841], "Танцевальные студии. Школы танцев"=>[7911], "Билеты"=>[7922], "Музыкальные группы. Оркестры"=>[7929], "Бильярд"=>[7932], "Боулинг-клубы"=>[7933], "Спортклубы"=>[7941], "Туризм"=>[7991], "Гольф"=>[7992], "Видеоигры"=>[7993, 7994], "Азартные игры"=>[7995], "Развлечения"=>[7996], "Развлечения и спорт"=>[7997, 7999], "Аквариумы. Дельфинарии"=>[7998], "Медицина"=>[8011, 8031], "Стоматология"=>[8021], "Хиропрактики"=>[8041], "Оптика"=>[8042, 8043], "Оптика. Очки"=>[8044], "Ортопеды"=>[8049], "Сиделки"=>[8050], "Больницы"=>[8062], "Медицина. Стоматология"=>[8071], "Медицинские услуги"=>[8099], "Юристы. Адвокаты"=>[8111], "Школа"=>[8211], "Образование. Университет"=>[8220], "Дистанционное образование"=>[8241], "Образование. Бизнес"=>[8244], "Образование"=>[8249, 8299], "Детский сад"=>[8351], "Благотворительность"=>[8398], "Общественные организации"=>[8641], "Политические организации"=>[8651], "Религиозные организации"=>[8661], "Автоклуб"=>[8675], "Клуб"=>[8699], "Испытательные лаборатории"=>[8734], "Архитекторы"=>[8911], "Бухгалтерия. Аудит"=>[8931], "Профессиональные услуги"=>[8999], "Суд"=>[9211], "Штрафы"=>[9222], "Выплаты. Облигации"=>[9223], "Государственные услуги"=>[9399], "Почта"=>[9402], "Правительственные закупки"=>[9405], "Кэшбек"=>[9700, 9701], "Аварийные службы"=>[9702], "Покупки внутри компании"=>[9950]}.freeze

  CATEGORIES = {
    "Путешествия" => [3001,3002,3003,3004,3005,3006,3007,3008,3009,3010,3011,3012,3013,3014,3015,3016,3017,3018,3019,3020,3021,3022,3023,3024,3025,3026,3027,3028,3029,3030,3031,3032,3033,3034,3035,3036,3037,3038,3039,3040,3041,3042,3043,3044,3045,3046,3047,3048,3049,3050,3051,3052,3053,3054,3055,3056,3057,3058,3059,3060,3061,3062,3063,3064,3065,3066,3067,3068,3069,3070,3071,3072,3073,3074,3075,3076,3077,3078,3079,3080,3081,3082,3083,3084,3085,3086,3087,3088,3089,3090,3091,3092,3093,3094,3095,3096,3097,3098,3099,3100,3101,3102,3103,3104,3105,3106,3107,3108,3109,3110,3111,3112,3113,3114,3115,3116,3117,3118,3119,3120,3121,3122,3123,3124,3125,3126,3127,3128,3129,3130,3131,3132,3133,3134,3135,3136,3137,3138,3139,3140,3141,3142,3143,3144,3145,3146,3147,3148,3149,3150,3151,3152,3153,3154,3155,3156,3157,3158,3159,3160,3161,3162,3163,3164,3165,3166,3167,3168,3169,3170,3171,3172,3173,3174,3175,3176,3177,3178,3179,3180,3181,3182,3183,3184,3185,3186,3187,3188,3189,3190,3191,3192,3193,3194,3195,3196,3197,3198,3199,3200,3201,3202,3203,3204,3205,3206,3207,3208,3209,3210,3211,3212,3213,3214,3215,3216,3217,3218,3219,3220,3221,3222,3223,3224,3225,3226,3227,3228,3229,3230,3231,3232,3233,3234,3235,3236,3237,3238,3239,3240,3241,3242,3243,3244,3245,3246,3247,3248,3249,3250,3251,3252,3253,3254,3255,3256,3257,3258,3259,3260,3261,3262,3263,3264,3265,3266,3267,3268,3269,3270,3271,3272,3273,3274,3275,3276,3277,3278,3279,3280,3281,3282,3283,3284,3285,3286,3287,3288,3289,3290,3291,3292,3293,3294,3295,3296,3297,3298,3299,3300,3301,3302,3303,3304,3305,3306,3307,3308,3309,3310,3311,3312,3313,3314,3315,3316,3317,3318,3319,3320,3321,3322,3323,3324,3325,3326,3327,3328,3329,3330,3331,3332,3333,3334,3335,3336,3337,3338,3339,3340,3341,3342,3343,3344,3345,3346,3347,3348,3349,3350,3351,3352,3353,3354,3355,3356,3357,3358,3359,3360,3361,3362,3363,3364,3365,3366,3367,3368,3369,3370,3371,3372,3373,3374,3375,3376,3377,3378,3379,3380,3381,3382,3383,3384,3385,3386,3387,3388,3389,3390,3391,3392,3393,3394,3395,3396,3397,3398,3399,3400,3401,3402,3403,3404,3405,3406,3407,3408,3409,3410,3411,3412,3413,3414,3415,3416,3417,3418,3419,3420,3421,3422,3423,3424,3425,3426,3427,3428,3429,3430,3431,3432,3433,3434,3435,3436,3437,3438,3439,3440,3441,3442,3443,3444,3445,3446,3447,3448,3449,3450,3451,3452,3453,3454,3455,3456,3457,3458,3459,3460,3461,3462,3463,3464,3465,3466,3467,3468,3469,3470,3471,3472,3473,3474,3475,3476,3477,3478,3479,3480,3481,3482,3483,3484,3485,3486,3487,3488,3489,3490,3491,3492,3493,3494,3495,3496,3497,3498,3499,3500,3501,3502,3503,3504,3505,3506,3507,3508,3509,3510,3511,3512,3513,3514,3515,3516,3517,3518,3519,3520,3521,3522,3523,3524,3525,3526,3527,3528,3529,3530,3531,3532,3533,3534,3535,3536,3537,3538,3539,3540,3541,3542,3543,3544,3545,3546,3547,3548,3549,3550,3551,3552,3553,3554,3555,3556,3557,3558,3559,3560,3561,3562,3563,3564,3565,3566,3567,3568,3569,3570,3571,3572,3573,3574,3575,3576,3577,3578,3579,3580,3581,3582,3583,3584,3585,3586,3587,3588,3589,3590,3591,3592,3593,3594,3595,3596,3597,3598,3599,3600,3601,3602,3603,3604,3605,3606,3607,3608,3609,3610,3611,3612,3613,3614,3615,3616,3617,3618,3619,3620,3621,3622,3623,3624,3625,3626,3627,3628,3629,3630,3631,3632,3633,3634,3635,3636,3637,3638,3639,3640,3641,3642,3643,3644,3645,3646,3647,3648,3649,3650,3651,3652,3653,3654,3655,3656,3657,3658,3659,3660,3661,3662,3663,3664,3665,3666,3667,3668,3669,3670,3671,3672,3673,3674,3675,3676,3677,3678,3679,3680,3681,3682,3683,3684,3685,3686,3687,3688,3689,3690,3691,3692,3693,3694,3695,3696,3697,3698,3699,3700,3701,3702,3703,3704,3705,3706,3707,3708,3709,3710,3711,3712,3713,3714,3715,3716,3717,3718,3719,3720,3721,3722,3723,3724,3725,3726,3727,3728,3729,3730,3731,3732,3733,3734,3735,3736,3737,3738,3739,3740,3741,3742,3743,3744,3745,3746,3747,3748,3749,3750,3751,3752,3753,3754,3755,3756,3757,3758,3759,3760,3761,3762,3763,3764,3765,3766,3767,3768,3769,3770,3771,3772,3773,3774,3775,3776,3777,3778,3779,3780,3781,3782,3783,3784,3785,3786,3787,3788,3789,3790,3791,3792,3793,3794,3795,3796,3797,3798,3799,3800,3801,3802,3803,3804,3805,3806,3807,3808,3809,3810,3811,3812,3813,3814,3815,3816,3817,3818,3819,3820,3821,3822,3823,3824,3825,3826,3827,3828,3829,3830,3831,3832,3833,3834,3835,3836,3837,3838,3839,3840,3841,3842,3843,3844,3845,3846,3847,3848,3849,3850,3851,3852,3853,3854,3855,3856,3857,3858,3859,3860,3861,3862,3863,3864,3865,3866,3867,3868,3869,3870,3871,3872,3873,3874,3875,3876,3877,3878,3879,3880,3881,3882,3883,3884,3885,3886,3887,3888,3889,3890,3891,3892,3893,3894,3895,3896,3897,3898,3899,3900,3901,3902,3903,3904,3905,3906,3907,3908,3909,3910,3911,3912,3913,3914,3915,3916,3917,3918,3919,3920,3921,3922,3923,3924,3925,3926,3927,3928,3929,3930,3931,3932,3933,3934,3935,3936,3937,3938,3939,3940,3941,3942,3943,3944,3945,3946,3947,3948,3949,3950,3951,3952,3953,3954,3955,3956,3957,3958,3959,3960,3961,3962,3963,3964,3965,3966,3967,3968,3969,3970,3971,3972,3973,3974,3975,3976,3977,3978,3979,3980,3981,3982,3983,3984,3985,3986,3987,3988,3989,3990,3991,3992,3993,3994,3995,3996,3997,3998,3999,4011,4111,4112,4131,4304,4411,4415,4418,4457,4468,4511,4582,4722,4784,4789,5962,6513,7011,7032,7033,7512,7513,7519],
    "Красота и медицина" => [4119,5047,5122,5292,5295,5912,5975,5976,5977,7230,7297,7298,8011,8021,8031,8041,8042,8043,8049,8050,8062,8071,8099],
    "Развлечения и спорт" => [5733,5735,5815,5816,5817,5818,5941,5945,5946,5947,5970,5971,5972,5973,7221,7333,7395,7929,7932,7933,7941,7991,7992,7993,7994,7996,7997,7998,7999,8664,7912,7913,7914,7915,7916,7917,7918,7919,7920,7921,7922],
    "Кафе и рестораны" => [5811,5812,5813,5814],
    "Продукты и супермаркеты" => [5297,5298,5300,5311,5331,5399,5411,5412,5422,5441,5451,5462,5499,5715,5921],
    "Кино" => [7829,7832,7841],
    "Авто и АЗС" => [5172,5511,5531,5532,5533,5541,5542,5983,7511,7523,7531,7534,7535,7538,7542,7549],
    "Одежда и обувь" => [5131,5137,5139,5611,5621,5631,5641,5651,5655,5661,5681,5691,5697,5698,5699,5931,5948,5949,7251,7296],
    "Такси" => [4121],
    "Животные" => [742,5995],
    "Книги" => [2741,5111,5192,5942,5994],
    "Цветы" => [5992,5193]
  }.freeze

  change do
    create_table :categories do
      primary_key :id

      column :name, String, null: false
    end

    create_table :mcc_labels do
      primary_key :id

      column :name, String, null: false
    end

    create_table :mcc_codes do
      primary_key :mcc, Integer, null: false

      foreign_key :mcc_label_id, :mcc_labels, null: true, on_delete: :set_null
      foreign_key :category_id, :categories, null: true, on_delete: :set_null
    end

    categories = self[:categories]
    mcc_labels = self[:mcc_labels]
    mcc_codes  = self[:mcc_codes]

    MCC_LABELS.each do |label, mccs|
      mcc_label_id = mcc_labels.insert(name: label)

      mccs.each { |mcc| mcc_codes.insert(mcc: mcc, mcc_label_id: mcc_label_id) }
    end

    CATEGORIES.each do |category, mccs|
      category_id = categories.insert(name: category)

      mcc_codes.where(mcc: mccs).update(category_id: category_id)

      new_mccs = mccs - mcc_codes.where(mcc: mccs).select_map(:mcc)

      new_mccs.each { |mcc| mcc_codes.insert(mcc: mcc, category_id: category_id) }
    end
  end
end
