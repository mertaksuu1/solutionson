import 'package:flutter/material.dart';

class CreateCampaignScreen extends StatefulWidget {
  @override
  _CreateCampaignScreenState createState() => _CreateCampaignScreenState();
}

class _CreateCampaignScreenState extends State<CreateCampaignScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _targetAmountController = TextEditingController();
  TextEditingController _campaignDurationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Campaign'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Campaign Title'),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Enter a title',
              ),
            ),
            SizedBox(height: 16),
            Text('Campaign Description'),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                hintText: 'Enter Description',
              ),
            ),
            SizedBox(height: 16),
            Text('Target Quantity (₺)'),
            TextField(
              controller: _targetAmountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter Target Quantity',
              ),
            ),
            SizedBox(height: 16),
            Text('Campaign Duration (Days)'),
            TextField(
              controller: _campaignDurationController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter Campaign Duration',
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Kampanya oluşturma işlemleri burada yapılır.
                String title = _titleController.text;
                String description = _descriptionController.text;
                double? targetAmount;
                int? campaignDuration;

                // Hedef miktar ve kampanya süresi boş değilse parse et.
                if (_targetAmountController.text.isNotEmpty) {
                  targetAmount = double.parse(_targetAmountController.text);
                }

                if (_campaignDurationController.text.isNotEmpty) {
                  campaignDuration =
                      int.parse(_campaignDurationController.text);
                }

                // Oluşturulan verileri kullanarak kampanya oluşturma fonksiyonu eklenir.

                // Örnek: createCampaign(title, description, targetAmount, campaignDuration);

                // Kampanya oluşturulduktan sonra sayfadan çıkılır.
                Navigator.pop(context);
              },
              child: Text('Create Campaign'),
            ),
          ],
        ),
      ),
    );
  }
}
