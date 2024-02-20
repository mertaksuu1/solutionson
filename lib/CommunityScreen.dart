import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  // Örnek yorum verileri
  final List<Map<String, dynamic>> donationComments = [
    {
      'donationTitle': 'Donation 1',
      'comment': 'Harika bir bağış!',
      'likes': 10,
      'dislikes': 3,
    },
    {
      'donationTitle': 'Donation 2',
      'comment': 'Bu projeye katkı sağlamaktan gurur duyuyorum.',
      'likes': 15,
      'dislikes': 2,
    },
    {
      'donationTitle': 'Donation 3',
      'comment': 'Bağışın ne zaman tamamlanacak?',
      'likes': 5,
      'dislikes': 1,
    },
  ];

  TextEditingController commentController = TextEditingController();
  String selectedDonation = 'Donation 1'; // Varsayılan olarak seçili bağış

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedDonation,
              onChanged: (String? newValue) {
                setState(() {
                  selectedDonation = newValue!;
                });
              },
              items: donationComments
                  .map<DropdownMenuItem<String>>((Map<String, dynamic> donation) {
                return DropdownMenuItem<String>(
                  value: donation['donationTitle'],
                  child: Text(donation['donationTitle']),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: donationComments.length,
              itemBuilder: (context, index) {
                if (donationComments[index]['donationTitle'] == selectedDonation) {
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bağış: ${donationComments[index]['donationTitle']}'),
                          SizedBox(height: 8),
                          Text(donationComments[index]['comment']),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.thumb_up),
                                    onPressed: () {
                                      // Like butonuna tıklama işlemleri burada yapılacak
                                      setState(() {
                                        donationComments[index]['likes'] += 1;
                                      });
                                    },
                                  ),
                                  Text('${donationComments[index]['likes']}'),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.thumb_down),
                                    onPressed: () {
                                      // Dislike butonuna tıklama işlemleri burada yapılacak
                                      setState(() {
                                        donationComments[index]['dislikes'] += 1;
                                      });
                                    },
                                  ),
                                  Text('${donationComments[index]['dislikes']}'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return SizedBox.shrink(); // Seçili bağışa ait olmayan yorumları gösterme
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: commentController,
              decoration: InputDecoration(
                hintText: 'Add your comment here ...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Yorumu ekleme işlemleri burada yapılacak
              setState(() {
                donationComments.add({
                  'donationTitle': selectedDonation,
                  'comment': commentController.text,
                  'likes': 0,
                  'dislikes': 0,
                });
                commentController.clear();
              });
            },
            child: Text('Comment'),
          ),
        ],
      ),
    );
  }
}
