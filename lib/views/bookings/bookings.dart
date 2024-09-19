import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:user_app/utils/appbar.dart';
import 'package:user_app/utils/appcolors.dart';
import 'package:user_app/utils/custom_text.dart';
import 'package:user_app/utils/reusable_container.dart';
import 'package:user_app/views/home/ride-share/search_share_rides.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar:
              const CustomAppbar(title: 'My Bookings', showBackArrow: false),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.width * 0.05,
                    vertical: context.height * 0.01),
                child: TabBar(
                  isScrollable: true,
                  labelColor: AppColors.primaryColor,
                  unselectedLabelColor: AppColors.lightGreyColor,
                  tabAlignment: TabAlignment.start,
                  tabs: const [
                    Text('Ride'),
                    Text('Ride Share'),
                    Text('Food'),
                    Text('Packages'),
                    Text('Documents'),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    BookingTabContent(),
                    BookingTabContent(isRideShare: true),
                    BookingTabContent(),
                    BookingTabContent(),
                    BookingTabContent(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookingTabContent extends StatelessWidget {
  final bool isRideShare;

  const BookingTabContent({
    super.key,
    this.isRideShare = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.02, vertical: context.height * 0.01),
      child: ListView(
        children: [
          CustomBookingExpansionTile(
            driverName: 'Mr Smith Jane',
            pickupLocation: 'Cape Town Cbd 1, South Africa',
            destination: 'Clinton Street, London',
            date: '12/12/2022',
            time: '10:00 AM',
            distance: '2.5 km',
            payment: 'Cash',
            vehicle: 'Toyota Camry',
            price: 100.0,
            status: 'Pending',
            availableSeats: '3',
            additionalInfo: 'No additional info',
            isRideShareBooking: isRideShare,
          ),
          CustomBookingExpansionTile(
            driverName: 'Mr John Doe',
            pickupLocation: 'Cape Town Cbd 1, South Africa',
            destination: 'Clinton Street, London',
            date: '12/12/2022',
            time: '10:00 AM',
            distance: '2.5 km',
            payment: 'Cash',
            vehicle: 'Toyota Camry',
            price: 75.0,
            status: 'Completed',
            availableSeats: '3',
            additionalInfo: 'N/A',
            isRideShareBooking: isRideShare,
          ),
        ],
      ),
    );
  }
}

class CustomBookingExpansionTile extends StatelessWidget {
  final String driverName;
  final String pickupLocation;
  final String destination;
  final String date;
  final String time;
  final String distance;
  final String payment;
  final String vehicle;
  final double price;
  final String? availableSeats;
  final String? additionalInfo;
  final String status;
  final bool isRideShareBooking;

  const CustomBookingExpansionTile({
    super.key,
    required this.driverName,
    required this.pickupLocation,
    required this.destination,
    required this.date,
    required this.time,
    required this.distance,
    required this.payment,
    required this.vehicle,
    required this.price,
    this.availableSeats,
    this.additionalInfo,
    required this.status,
    this.isRideShareBooking = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: AppColors.lightGreyColor),
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.all(12.0),
          dense: true,
          visualDensity: VisualDensity.compact,
          controlAffinity: ListTileControlAffinity.trailing,
          expandedAlignment: Alignment.topCenter,
          backgroundColor: Colors.grey.shade200,
          collapsedBackgroundColor: Colors.grey.shade100,
          iconColor: AppColors.primaryColor,
          collapsedShape: ShapeBorder.lerp(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            1.0,
          ),
          shape: ShapeBorder.lerp(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            1.0,
          ),
          childrenPadding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          title: ListTile(
            contentPadding: const EdgeInsets.all(0.0),
            dense: true,
            visualDensity: VisualDensity.compact,
            leading: const CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                'https://img.freepik.com/premium-photo/3d-taxi-driver-cartoon-character_876282-8044.jpg',
              ),
            ),
            title: CustomTextWidget(
              text: driverName,
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              textColor: AppColors.primaryColor.withOpacity(0.8),
            ),
            trailing: CustomTextWidget(
              text: '\$$price',
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              textColor: AppColors.buttonColor,
            ),
          ),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              dense: true,
              visualDensity: VisualDensity.compact,
              leading: Image.asset(
                'assets/images/indicator.png',
                color: AppColors.primaryColor,
                width: 20,
              ),
              title: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Pickup Location: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0),
                    ),
                    TextSpan(
                      text: pickupLocation,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12.0),
                    ),
                  ],
                ),
                maxLines: 2,
              ),
              subtitle: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Drop-off Location: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0),
                    ),
                    TextSpan(
                      text: destination,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12.0),
                    ),
                  ],
                ),
                maxLines: 2,
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.social_distance_sharp, size: 16.0),
                      const SizedBox(width: 4.0),
                      Text(
                        distance,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(LucideIcons.timer, size: 16.0),
                      const SizedBox(width: 4.0),
                      Text(
                        time,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomRowWidget(heading: 'Date: ', subHeading: date),
                CustomRowWidget(heading: 'Time: ', subHeading: time),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomRowWidget(heading: 'Payment: ', subHeading: payment),
                CustomRowWidget(heading: 'Vehicle: ', subHeading: vehicle),
              ],
            ),
            Visibility(
              visible: isRideShareBooking,
              child: CustomRowWidget(
                  heading: 'Available Seats: ',
                  subHeading: availableSeats ?? ''),
            ),
            Visibility(
              visible: isRideShareBooking,
              child: CustomRowWidget(
                  heading: 'Any Additional Info: ',
                  subHeading: additionalInfo ?? ''),
            ),
            InkWell(
                splashColor: Colors.transparent,
                overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ReUsableContainer(
                    verticalPadding: context.height * 0.02,
                    height: 50,
                    color: status == 'Pending'
                        ? AppColors.buttonColor
                        : Colors.green,
                    child: Center(
                        child: CustomTextWidget(
                      text: status,
                      fontSize: 16.0,
                      textColor: AppColors.whiteTextColor,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    )),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
