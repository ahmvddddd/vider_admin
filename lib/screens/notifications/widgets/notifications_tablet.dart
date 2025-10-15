import 'package:flutter/material.dart';
import '../../../utils/helpers/helper_function.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/sizes.dart';

class NotificationsTablet extends StatefulWidget {

  const NotificationsTablet({super.key});

  @override
  State<NotificationsTablet> createState() => _NotificationsTabletState();
}

class _NotificationsTabletState extends State<NotificationsTablet> {
  final TextEditingController _titleController = TextEditingController(
    text: 'Limited Time Offer: [Discount]% Off',
  );
  final TextEditingController _messageController = TextEditingController(
    text:
        'For a Limited Time, Enjoy [Discount]% Off On [Product/Service]. Use Code [CODE] At Checkout. Offer Valid Until [End Date].',
  );
  bool acceleratorUsers = true;
  bool subscribersOnly = false;
  bool allUsers = false;
  bool customSelection = false;
  bool scheduleForLater = true;
  DateTime scheduledDate = DateTime(2026, 4, 17, 12, 0);
    String imageUrl =
      'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?auto=format&fit=crop&w=1200&q=60';
  TimeOfDay scheduledTime = const TimeOfDay(hour: 12, minute: 0);

      void _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: scheduledDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        scheduledDate = DateTime(
          picked.year,
          picked.month,
          picked.day,
          scheduledTime.hour,
          scheduledTime.minute,
        );
      });
    }
  }

  void _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: scheduledTime,
    );
    if (picked != null) {
      setState(() {
        scheduledTime = picked;
        scheduledDate = DateTime(
          scheduledDate.year,
          scheduledDate.month,
          scheduledDate.day,
          picked.hour,
          picked.minute,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.spaceBtwItems),
        child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Main content
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RoundedContainer(
                          radius: 8,
                          backgroundColor: dark
                              ? Colors.white.withValues(alpha: 0.1)
                              : Colors.black.withValues(alpha: 0.1),
                          padding: const EdgeInsets.all(Sizes.spaceBtwItems),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Notification Details',
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall,
                              ),
                              const SizedBox(height: Sizes.spaceBtwItems),
                                    
                              Text(
                                'Notification Title',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 6),
                              TextField(
                                controller: _titleController,
                                maxLength: 60,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                ),
                              ),
                              const SizedBox(height: Sizes.spaceBtwItems),
                                    
                              Text(
                                'Notification Message',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 6),
                              TextField(
                                controller: _messageController,
                                maxLines: 5,
                                maxLength: 500,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                ),
                              ),
                              const SizedBox(height: Sizes.spaceBtwItems),
                                    
                              Text(
                                'Image (Optional)',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: Sizes.sm),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  imageUrl,
                                  height: 140,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: Sizes.sm),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton.icon(
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.all(Sizes.sm),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      imageUrl = '';
                                    });
                                  },
                                  icon: const Icon(Icons.delete),
                                  label: Text(
                                    'Remove',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                                    
                        const SizedBox(height: Sizes.spaceBtwSections),
                                    
                        // Recipients Card
                        RoundedContainer(
                          radius: 8,
                          backgroundColor: dark
                              ? Colors.white.withValues(alpha: 0.1)
                              : Colors.black.withValues(alpha: 0.1),
                          padding: const EdgeInsets.all(Sizes.spaceBtwItems),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Recipients',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: Sizes.spaceBtwItems),
                              CheckboxListTile(
                                title: Text(
                                  'Accelerator Users Only',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                subtitle: Text(
                                  '5,678 users',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                                value: acceleratorUsers,
                                onChanged: (v) {
                                  setState(() {
                                    acceleratorUsers = v ?? false;
                                    if (acceleratorUsers) {
                                      subscribersOnly = false;
                                      allUsers = false;
                                      customSelection = false;
                                    }
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: Text(
                                  'Subscribers Only',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                subtitle: Text(
                                  '8,765 users',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                                value: subscribersOnly,
                                onChanged: (v) {
                                  setState(() {
                                    subscribersOnly = v ?? false;
                                    if (subscribersOnly) {
                                      acceleratorUsers = false;
                                      allUsers = false;
                                      customSelection = false;
                                    }
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: Text(
                                  'All Users Across Platforms',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                subtitle: Text(
                                  '14,532 users',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                                value: allUsers,
                                onChanged: (v) {
                                  setState(() {
                                    allUsers = v ?? false;
                                    if (allUsers) {
                                      acceleratorUsers = false;
                                      subscribersOnly = false;
                                      customSelection = false;
                                    }
                                  });
                                },
                              ),
                              CheckboxListTile(
                                title: Text(
                                  'Custom Selection',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                value: customSelection,
                                onChanged: (v) {
                                  setState(() {
                                    customSelection = v ?? false;
                                    if (customSelection) {
                                      acceleratorUsers = false;
                                      subscribersOnly = false;
                                      allUsers = false;
                                    }
                                  });
                                },
                              ),
                                    
                              const SizedBox(height: Sizes.spaceBtwItems),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Total Recipients: ${acceleratorUsers
                                      ? 5678
                                      : subscribersOnly
                                      ? 8765
                                      : allUsers
                                      ? 14532
                                      : 0} Users',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                                    
                        const SizedBox(height: Sizes.spaceBtwItems),
                                    
                        // Delivery Options
                        RoundedContainer(
                          radius: 8,
                          backgroundColor: dark
                              ? Colors.white.withValues(alpha: 0.1)
                              : Colors.black.withValues(alpha: 0.1),
                          padding: const EdgeInsets.all(Sizes.spaceBtwItems),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Delivery Options',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 12),
                              SwitchListTile(
                                title: Text(
                                  'Schedule For Later',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                value: scheduleForLater,
                                onChanged: (v) {
                                  setState(() {
                                    scheduleForLater = v;
                                  });
                                },
                              ),
                                    
                              if (scheduleForLater) ...[
                                Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: _pickDate,
                                        child: InputDecorator(
                                          decoration: InputDecoration(
                                            labelText: 'Date',
                                            labelStyle: Theme.of(context).textTheme.labelSmall,
                                            border: OutlineInputBorder(),
                                          ),
                                          child: Text(
                                            '${scheduledDate.year}-${scheduledDate.month.toString().padLeft(2, '0')}-${scheduledDate.day.toString().padLeft(2, '0')}',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodySmall,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: InkWell(
                                        onTap: _pickTime,
                                        child: InputDecorator(
                                          decoration: InputDecoration(
                                            labelText: 'Time',
                                            labelStyle: Theme.of(context).textTheme.labelSmall,
                                            border: OutlineInputBorder(),
                                          ),
                                          child: Text(
                                            scheduledTime.format(context),
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),
                        const SizedBox(height: Sizes.spaceBtwSections),
                      ],
                    ),
        
                    // Right Sidebar - Summary & Preview
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        RoundedContainer(
                          radius: 8,
                          backgroundColor: dark
                              ? Colors.white.withValues(alpha: 0.1)
                              : Colors.black.withValues(alpha: 0.1),
                          padding: const EdgeInsets.all(Sizes.spaceBtwItems),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Summary',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: Sizes.sm),
                              Text(
                                'Status',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Ready to Send',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const Divider(),
                              Text(
                                'Audience',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              const SizedBox(height: Sizes.sm),
                              Text(
                                acceleratorUsers
                                    ? 'Accelerator Users Only'
                                    : subscribersOnly
                                    ? 'Subscribers Only'
                                    : allUsers
                                    ? 'All Users Across Platforms'
                                    : customSelection
                                    ? 'Custom Selection'
                                    : 'No Audience Selected',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const Divider(),
                              Text(
                                'Delivery',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              const SizedBox(height: Sizes.sm),
                              Text(
                                scheduleForLater
                                    ? 'Scheduled for ${scheduledDate.year}-${scheduledDate.month.toString().padLeft(2, '0')}-${scheduledDate.day.toString().padLeft(2, '0')} at ${scheduledTime.format(context)}'
                                    : 'Send Now',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: Sizes.spaceBtwSections),
                        
                        RoundedContainer(
                          radius: 8,
                          backgroundColor: dark
                              ? Colors.white.withValues(alpha: 0.1)
                              : Colors.black.withValues(alpha: 0.1),
                          padding: const EdgeInsets.all(Sizes.spaceBtwItems),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Preview',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: Sizes.spaceBtwItems),
                        
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.blue[50],
                                  child: const Icon(
                                    Icons.campaign,
                                    color: Colors.blue,
                                  ),
                                ),
                                title: Text(
                                  'Accelerator Program Launch',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                subtitle: Text(
                                  'Join our exclusive accelerator proram for startups and entrepreneurs.',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                              ),
                        
                              const SizedBox(height: Sizes.sm),
                        
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.grey[50],
                                  child: const Icon(
                                    Icons.security,
                                    color: Colors.black54,
                                  ),
                                ),
                                title: Text(
                                  'Security Update Required',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                subtitle: Text(
                                  'Important security update requires your immediate attention.',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
      ),
    );
  }
}