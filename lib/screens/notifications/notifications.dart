import 'package:flutter/material.dart';
import '../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../screens/reponsive/responsive_scaffold.dart';
import '../../utils/constants/sizes.dart';
import '../reponsive/responsive_appbar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      mobileBody: Text('mobile'),
      tabletBody: Text('tablet'),
      desktopBody: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomHeader(),
        
            Padding(
                padding: const EdgeInsets.all(Sizes.spaceBtwSections),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Text('Create Notification',
                      style: Theme.of(context).textTheme.bodySmall),
                    
                      const SizedBox(height: Sizes.spaceBtwItems,),
                      SizedBox(
                        width: 400,
                        child: TextField(
                          decoration: InputDecoration(
                            label: Text('Title'),
                            labelStyle: Theme.of(context).textTheme.labelSmall,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    
                      const SizedBox(height: Sizes.spaceBtwItems,),
                      SizedBox(
                        width: 400,
                        child: TextField(
                          maxLines: 3,
                          maxLength: 200,
                          decoration: InputDecoration(
                            label: Text('Message',),
                            labelStyle: Theme.of(context).textTheme.labelSmall,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      )
                      ],
                    ),
                    

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RoundedContainer(
                          width: 200,
                          height: 400,
                          backgroundColor: Colors.grey,
                          child: Text('container 1'),
                        ),
        
                        const SizedBox(height: Sizes.sm,),
                        RoundedContainer(
                          width: 200,
                          height: 600,
                          backgroundColor: Colors.grey,
                          child: Text('container 2'),
                        ),
                      ],
                    )
                  ],
                ),)
            ]
        ),
      ),
    );
  }
}