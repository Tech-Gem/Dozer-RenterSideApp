


import 'package:Dozer/core/widgets/announcement_card.dart';
import 'package:Dozer/core/widgets/list_card_arrow_right.dart';
import 'package:Dozer/presentation/announcement_screen/models/announcement_model.dart';
import 'package:flutter/cupertino.dart';

class DummyData {
  static List<Widget> generateTaskCardList() {
    final tasks = <Map<String, String>>[
      {
        'title': 'Dehli',
        'status': 'Completed',
        'data': 'Due date: 1/6/2024',
        'completion': 'Assessments : 3/8',
      },
      {
        'title': 'Pune',
        'status': 'Pending',
        'data': 'Due date: 1/6/2024',
        'completion': 'Assessments : 1/7',
      },
      // Add more tasks as needed
    ];

    return tasks.map((task) {
      return ListCardArrowRight(
        title: task['title']!,
        status: task['status']!,
        data: task['data']!,
        completion: task['completion']!,
      );
    }).toList();
  }

  

  static List<AnnouncementModel> getAnnouncementData() {
    return [
      AnnouncementModel(
        imageUrl:
            'https://f3h3w7a5.rocketcdn.me/wp-content/uploads/2020/03/Important-Announcement.png-2-1024x663-1.png.webp',
        title: 'Announcement 1',
        description:
            'Description for Announcement 1 : Hello, this is an announcement from the general manager of the company.',
        date: DateTime(2024, 1, 10),
      ),
      AnnouncementModel(
        title: 'Announcement 2',
        description: 'Description for Announcement 2',
        date: DateTime(2024, 1, 11),
        time: '7:09 PM',
      ),
      // Add more dummy data as needed
      AnnouncementModel(
        title: 'Announcement 3',
        description: 'Description for Announcement 3',
        date: DateTime.now(),
        time: '11:59 AM',
      ),
      // Add more dummy data as needed
    ];
  }

 
  static List<Widget> generateAnnouncementCardList() {
    final announcements = <Map<String, dynamic>>[
      {
        'title': 'Important Announcement 1',
        'description':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        'imageUrl': null, // Set imageUrl to null when there is no image
      },
      {
        'title': 'Important Announcement 2',
        'description':
            'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
        'imageUrl':
            'https://f3h3w7a5.rocketcdn.me/wp-content/uploads/2020/03/Important-Announcement.png-2-1024x663-1.png.webp',
        // Set imageUrl to null when there is no image
      },
      // Add more announcements as needed
    ];

    return announcements.map((announcement) {
      return AnnouncementCard(
        title: announcement['title'].toString(),
        description: announcement['description'].toString(),
        imageUrl: announcement['imageUrl'] as String?,
        // time: announcement['time']
        //     as String?, // Ensure imageUrl is a String or null
      );
    }).toList();
  }
}
