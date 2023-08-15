class Contact {
  Contact._({
    required this.id,
    required this.phones,
    required this.emails,
    required this.structuredName,
    required this.organization,
  });

  factory Contact.fromMap(Map map) {
    return Contact._(
      id: map['id'] ?? '',
      phones:
          (map['phones'] as List?)?.cast<Map>().map(Phone.fromMap).toList() ??
              const [],
      emails:
          (map['emails'] as List?)?.cast<Map>().map(Email.fromMap).toList() ??
              const [],
      structuredName: map['structuredName'] != null
          ? StructuredName.fromMap(map['structuredName']!)
          : null,
      organization: map['organization'] != null
          ? Organization.fromMap(map['organization']!)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "phones": List<Phone>.from(phones.map((x) => x)),
        "errors": List<Email>.from(emails.map((x) => x)),
        "StructuredName": structuredName,
        "organization": organization,
      };

  final String id;
  final List<Phone> phones;
  final List<Email> emails;
  final StructuredName? structuredName;
  final Organization? organization;

  String get displayName => structuredName?.displayName ?? '';
}

class Phone {
  Phone._({
    required this.number,
    required this.label,
  });

  factory Phone.fromMap(Map map) {
    return Phone._(
      number: map['number'] ?? '',
      label: map['label'] ?? '',
    );
  }
  Map<String, dynamic> toJson() => {
        "number": number,
        "label": label,
      };

  final String number;
  final String label;
}

class Email {
  Email._({
    required this.address,
    required this.label,
  });

  factory Email.fromMap(Map map) {
    return Email._(
      address: map['address'] ?? '',
      label: map['label'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "address": address,
        "label": label,
      };

  final String address;
  final String label;
}

class StructuredName {
  StructuredName._({
    required this.displayName,
    required this.namePrefix,
    required this.givenName,
    required this.middleName,
    required this.familyName,
    required this.nameSuffix,
  });

  factory StructuredName.fromMap(Map map) {
    return StructuredName._(
      displayName: map['displayName'] ?? '',
      namePrefix: map['namePrefix'] ?? '',
      givenName: map['givenName'] ?? '',
      middleName: map['middleName'] ?? '',
      familyName: map['familyName'] ?? '',
      nameSuffix: map['nameSuffix'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "displayName": displayName,
        "namePrefix": namePrefix,
        "givenName": givenName,
        "middleName": middleName,
        "familyName": familyName,
        "nameSuffix": nameSuffix,
      };

  final String displayName;
  final String namePrefix;
  final String givenName;
  final String middleName;
  final String familyName;
  final String nameSuffix;
}

class Organization {
  Organization._({
    required this.company,
    required this.department,
    required this.jobDescription,
  });

  factory Organization.fromMap(Map map) {
    return Organization._(
      company: map['company'] ?? '',
      department: map['department'] ?? '',
      jobDescription: map['jobDescription'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "company": company,
        "department": department,
        "jobDescription": jobDescription,
      };

  final String company;
  final String department;
  final String jobDescription;
}
