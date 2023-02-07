// ignore_for_file: file_names

const attendLog = [
  {
    'state': '0',
    'date': {
      'day': '1',
      'dayName': 'السبت',
      'Month': 'يوليو',
    }
  },
  {
    'state': '2',
    'date': {
      'day': '2',
      'dayName': 'الأحد',
      'Month': 'يوليو',
    }
  },
  {
    'state': '1',
    'date': {
      'day': '3',
      'dayName': 'الاثنين',
      'Month': 'يوليو',
    }
  },
  {
    'state': '2',
    'date': {
      'day': '4',
      'dayName': 'الثلاثاء',
      'Month': 'يوليو',
    }
  },
  {
    'state': '0',
    'date': {
      'day': '5',
      'dayName': 'الخميس',
      'Month': 'يوليو',
    }
  },
  {
    'state': '1',
    'date': {
      'day': '6',
      'dayName': 'الجمعة',
      'Month': 'يوليو',
    }
  },
  {
    'state': '1',
    'date': {
      'day': '7',
      'dayName': 'السبت',
      'Month': 'يوليو',
    }
  },
  {
    'state': '2',
    'date': {
      'day': '8',
      'dayName': 'الأحد',
      'Month': 'يوليو',
    }
  },
];

const readingLog = [
  [
    {
      "id": 1,
      "title": "سرد ومراجعة الجزء ال7",
      "notes": "لا يوجد ملاحظات",
      "date": {
        "day": "03",
        "month": "10",
        "year": "2022",
      },
      "points": -5,
      "isRead": false,
      "readingType": 0,
      "pages": {
        "from": 20,
        "to": 40,
      },
      "errorsNum": 2,
    },
  ],
  [
    {
      "id": 2,
      "title": "سرد الجزء ال1",
      "notes": "لا يوجد ملاحظات",
      "date": {
        "day": "13",
        "month": "12",
        "year": "2022",
      },
      "points": 3,
      "isRead": true,
      "readingType": 2,
      "pages": {
        "from": 25,
        "to": 45,
      },
      "errorsNum": 1,
    },
  ],
  [
    {
      "id": 3,
      "title": "سرد ومراجعة الجزء ال13",
      "notes": "لا يوجد ملاحظات",
      "date": {
        "day": "23",
        "month": "02",
        "year": "2022",
      },
      "points": 15,
      "isRead": true,
      "readingType": 1,
      "pages": {
        "from": 109,
        "to": 130,
      },
      "errorsNum": 0,
    },
  ],
  [
    {
      "id": 4,
      "title": "سرد ومراجعة الجزء ال30",
      "notes": "لا يوجد ملاحظات",
      "date": {
        "day": "01",
        "month": "02",
        "year": "2022",
      },
      "points": -5,
      "isRead": true,
      "readingType": 1,
      "pages": {
        "from": 20,
        "to": 40,
      },
      "errorsNum": 1,
    },
  ],
  [
    {
      "id": 5,
      "title": "سرد ومراجعة الجزء ال9",
      "notes": "لا يوجد ملاحظات",
      "date": {
        "day": "03",
        "month": "10",
        "year": "2022",
      },
      "points": -9,
      "isRead": true,
      "readingType": 0,
      "pages": {
        "from": 22,
        "to": 60,
      },
      "errorsNum": 0,
    },
  ],
  [
    {
      "id": 6,
      "title": "سرد ومراجعة الجزء ال17",
      "notes": "لا يوجد ملاحظات",
      "date": {
        "day": "23",
        "month": "09",
        "year": "2022",
      },
      "points": 3,
      "isRead": true,
      "readingType": 0,
      "pages": {
        "from": 168,
        "to": 546,
      },
      "errorsNum": 5,
    },
  ],
  [
    {
      "id": 7,
      "title": "سرد ومراجعة الجزء ال25",
      "notes": "لا يوجد ملاحظات",
      "date": {
        "day": "20",
        "month": "10",
        "year": "2022",
      },
      "points": 20,
      "isRead": true,
      "readingType": 0,
      "pages": {
        "from": 133,
        "to": 523,
      },
      "errorsNum": 2,
    },
  ],
  [
    {
      "id": 8,
      "title": "سرد ومراجعة الجزء ال19",
      "notes": "لا يوجد ملاحظات",
      "date": {
        "day": "16",
        "month": "10",
        "year": "2022",
      },
      "points": -15,
      "isRead": false,
      "readingType": 2,
      "pages": {
        "from": 345,
        "to": 604,
      },
      "errorsNum": 2,
    },
  ],
];

// studentsList["001"]["name"]
const Map<String, dynamic> studentsList = {
  "001": {
    "name": "محمد هيكل",
    "className": "حلقة المؤنسات الغاليات",
    "parentPhone": "+962785215558",
    "studentPhone": "+962785691009",
    "joinDate": {
      "year": "2022",
      "month": "01",
      "day": "15",
    },
    "birthDate": {
      "year": "2007",
      "month": "05",
      "day": "15",
    },
    "teacherName": "دعاء كراكر",
    "points": "135",
    "attends": "32",
    "gifts": "53",
  },
  "002": {
    "name": "محمد معاذ",
    "className": "حلقة المؤنسات الغاليات",
    "parentPhone": "+962785215558",
    "studentPhone": "+962785691009",
    "joinDate": {
      "year": "2022",
      "month": "05",
      "day": "15",
    },
    "birthDate": {
      "year": "2006",
      "month": "06",
      "day": "10",
    },
    "teacherName": "دعاء كراكر",
    "points": "135",
    "attends": "32",
    "gifts": "53",
  },
  "003": {
    "name": "نور محمود",
    "className": "حلقة المؤنسات الغاليات",
    "parentPhone": "+962785215558",
    "studentPhone": "+962785691009",
    "joinDate": {
      "year": "2022",
      "month": "05",
      "day": "15",
    },
    "birthDate": {
      "year": "2006",
      "month": "06",
      "day": "10",
    },
    "teacherName": "دعاء كراكر",
    "points": "135",
    "attends": "32",
    "gifts": "53",
  },
  "004": {
    "name": "محمود حمد",
    "className": "حلقة المؤنسات الغاليات",
    "parentPhone": "+962785215558",
    "studentPhone": "+962785691009",
    "joinDate": {
      "year": "2022",
      "month": "05",
      "day": "15",
    },
    "birthDate": {
      "year": "2006",
      "month": "06",
      "day": "10",
    },
    "teacherName": "دعاء كراكر",
    "points": "135",
    "attends": "32",
    "gifts": "53",
  },
  "005": {
    "name": "حمد حامد",
    "className": "حلقة المؤنسات الغاليات",
    "parentPhone": "+962785215558",
    "studentPhone": "+962785691009",
    "joinDate": {
      "year": "2022",
      "month": "05",
      "day": "15",
    },
    "birthDate": {
      "year": "2006",
      "month": "06",
      "day": "10",
    },
    "teacherName": "دعاء كراكر",
    "points": "135",
    "attends": "32",
    "gifts": "53",
  },
  "006": {
    "name": "اسماعيل نور",
    "className": "حلقة المؤنسات الغاليات",
    "parentPhone": "+962785215558",
    "studentPhone": "+962785691009",
    "joinDate": {
      "year": "2022",
      "month": "05",
      "day": "15",
    },
    "birthDate": {
      "year": "2006",
      "month": "06",
      "day": "10",
    },
    "teacherName": "دعاء كراكر",
    "points": "135",
    "attends": "32",
    "gifts": "53",
  },
  "007": {
    "name": "حمد ثابت",
    "className": "حلقة المؤنسات الغاليات",
    "parentPhone": "+962785215558",
    "studentPhone": "+962785691009",
    "joinDate": {
      "year": "2022",
      "month": "05",
      "day": "15",
    },
    "birthDate": {
      "year": "2006",
      "month": "06",
      "day": "10",
    },
    "teacherName": "دعاء كراكر",
    "points": "135",
    "attends": "32",
    "gifts": "53",
  },
  "008": {
    "name": "خالد اسماعيل",
    "className": "حلقة المؤنسات الغاليات",
    "parentPhone": "+962785215558",
    "studentPhone": "+962785691009",
    "joinDate": {
      "year": "2022",
      "month": "05",
      "day": "15",
    },
    "birthDate": {
      "year": "2006",
      "month": "06",
      "day": "10",
    },
    "teacherName": "دعاء كراكر",
    "points": "135",
    "attends": "32",
    "gifts": "53",
  },
  "009": {
    "name": "ثابت خالد",
    "className": "حلقة المؤنسات الغاليات",
    "parentPhone": "+962785215558",
    "studentPhone": "+962785691009",
    "joinDate": {
      "year": "2022",
      "month": "05",
      "day": "15",
    },
    "birthDate": {
      "year": "2006",
      "month": "06",
      "day": "10",
    },
    "teacherName": "دعاء كراكر",
    "points": "135",
    "attends": "32",
    "gifts": "53",
  },
  "010": {
    "name": "علاء الأحمد",
    "className": "حلقة المؤنسات الغاليات",
    "parentPhone": "+962785215558",
    "studentPhone": "+962785691009",
    "joinDate": {
      "year": "2022",
      "month": "05",
      "day": "15",
    },
    "birthDate": {
      "year": "2006",
      "month": "06",
      "day": "10",
    },
    "teacherName": "دعاء كراكر",
    "points": "135",
    "attends": "32",
    "gifts": "53",
  },
};

eventListCTRl({
  required String eventName,
  required String eventDay,
  required String eventMonth,
  required String eventDayName,
  required String eventTime,
  required String eventLocation,
  required String eventImage,
}) {
  eventsList.add({
    'eventName': eventName,
    'eventDay': eventDay,
    'eventMonth': eventMonth,
    'eventDayName': eventDayName,
    'eventTime': eventTime,
    'eventLocation': eventLocation,
    'eventImage': eventImage,
  });
  print({
    'eventName': eventName,
    'eventDay': eventDay,
    'eventMonth': eventMonth,
    'eventDayName': eventDayName,
    'eventTime': eventTime,
    'eventLocation': eventLocation,
    'eventImage': eventImage,
  });
}

final eventsList = [
  {
    'eventName': 'يوم الهمة الثامن',
    'eventDay': '10',
    'eventMonth': 'يوليو',
    'eventDayName': 'الخميس',
    'eventTime': '9:00 AM - 12:00 PM',
    'eventLocation': 'مركز بشائر النور',
    'eventImage': 'assets/images/event-img.jpg',
  },
  {
    'eventName': 'يوم تسميع',
    'eventDay': '13',
    'eventMonth': 'يوليو',
    'eventDayName': 'الأحد',
    'eventTime': '1:00 AM - 2:00 PM',
    'eventLocation': 'مركز بشائر النور',
    'eventImage': 'assets/images/event-img.jpg',
  },
  {
    'eventName': 'درس تجويد اونلاين',
    'eventDay': '15',
    'eventMonth': 'يوليو',
    'eventDayName': 'الثلاثاء',
    'eventTime': '3:00 AM - 5:00 PM',
    'eventLocation': 'تطبيق zoom',
    'eventImage': 'assets/images/event-img.jpg',
  },
  {
    'eventName': 'المسابقة الجمعية السنوية',
    'eventDay': '18',
    'eventMonth': 'يوليو',
    'eventDayName': 'الخميس',
    'eventTime': '9:00 AM - 12:00 PM',
    'eventLocation': 'فرع عمان السادس',
    'eventImage': 'assets/images/event-img.jpg',
  },
];

const readingElements = [
  {
    "id": 1,
    "values": {"isRead": false, "points": 15, "date": "15/5/2022", "description": "سرد ومراجعة الجزء ال15"}
  },
  {
    "id": 2,
    "values": {"isRead": true, "points": -10, "date": "10/8/2022", "description": "سرد ومراجعة الجزء ال12"}
  },
];

const List<Map> attendElements = [
  {
    "id": "0",
    "values": {
      "attendStatue": "0",
      "date": {
        "day": "1",
        "month": "5",
        "year": "2022",
        "dayName": 'احد',
        "monthName": 'يوليو',
      },
    }
  },
  {
    "id": "1",
    "values": {
      "attendStatue": "2",
      "date": {
        "day": "2",
        "month": "5",
        "year": "2022",
        "dayName": "اثنين",
        "monthName": 'يوليو',
      },
    }
  },
  {
    "id": '2',
    "values": {
      "attendStatue": '1',
      "date": {
        "day": '3',
        "month": '5',
        "year": '2022',
        "dayName": "ثلاثاء",
        "monthName": 'يوليو',
      },
    }
  },
  {
    "id": '3',
    "values": {
      "attendStatue": '0',
      "date": {
        "day": '4',
        "month": '5',
        "year": '2022',
        "dayName": "اربعاء",
        "monthName": 'يوليو',
      },
    }
  },
  {
    "id": '4',
    "values": {
      "attendStatue": '2',
      "date": {
        "day": '5',
        "month": '5',
        "year": '2022',
        "dayName": 'خميس',
        "monthName": 'يوليو',
      },
    }
  },
  {
    "id": '5',
    "values": {
      "attendStatue": '1',
      "date": {"day": '6', "month": '5', "year": '2022', "dayName": "جمعة", "monthName": "يوليو"},
    }
  },
];
