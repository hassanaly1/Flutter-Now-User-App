// import 'package:flutter/material.dart';
// import 'package:user_app/utils/app_sizes.dart';
// import 'package:user_app/utils/custom_text.dart';
//
// class FontsScreen extends StatelessWidget {
//   const FontsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Font Size Comparison')),
//       body: ListView(
//         children: [
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 4',
//               fontSize: AppSizes.fontSize4(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 4',
//               fontSize: 4.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 5',
//               fontSize: AppSizes.fontSize5(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 5',
//               fontSize: 5.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 6',
//               fontSize: AppSizes.fontSize6(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 6',
//               fontSize: 6.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 7',
//               fontSize: AppSizes.fontSize7(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 7',
//               fontSize: 7.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 8',
//               fontSize: AppSizes.fontSize8(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 8',
//               fontSize: 8.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 9',
//               fontSize: AppSizes.fontSize9(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 9',
//               fontSize: 9.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 10',
//               fontSize: AppSizes.fontSize10(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 10',
//               fontSize: 10.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 11',
//               fontSize: AppSizes.fontSize11(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 11',
//               fontSize: 11.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 12',
//               fontSize: AppSizes.fontSize12(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 12',
//               fontSize: 12.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 13',
//               fontSize: AppSizes.fontSize13(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 13',
//               fontSize: 13.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 14',
//               fontSize: AppSizes.fontSize14(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 14',
//               fontSize: 14.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 15',
//               fontSize: AppSizes.fontSize15(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 15',
//               fontSize: 15.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 16',
//               fontSize: AppSizes.fontSize16(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 16',
//               fontSize: 16.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 17',
//               fontSize: AppSizes.fontSize17(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 17',
//               fontSize: 17.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 18',
//               fontSize: AppSizes.fontSize18(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 18',
//               fontSize: 18.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 19',
//               fontSize: AppSizes.fontSize19(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 19',
//               fontSize: 19.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 20',
//               fontSize: AppSizes.fontSize20(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 20',
//               fontSize: 20.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 21',
//               fontSize: AppSizes.fontSize21(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 21',
//               fontSize: 21.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 22',
//               fontSize: AppSizes.fontSize22(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 22',
//               fontSize: 22.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 23',
//               fontSize: AppSizes.fontSize23(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 23',
//               fontSize: 23.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 24',
//               fontSize: AppSizes.fontSize24(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 24',
//               fontSize: 24.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 25',
//               fontSize: AppSizes.fontSize25(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 25',
//               fontSize: 25.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 26',
//               fontSize: AppSizes.fontSize26(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 26',
//               fontSize: 26.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 27',
//               fontSize: AppSizes.fontSize27(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 27',
//               fontSize: 27.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 28',
//               fontSize: AppSizes.fontSize28(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 28',
//               fontSize: 28.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 29',
//               fontSize: AppSizes.fontSize29(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 29',
//               fontSize: 29.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 30',
//               fontSize: AppSizes.fontSize30(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 30',
//               fontSize: 30.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 31',
//               fontSize: AppSizes.fontSize31(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 31',
//               fontSize: 31.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 32',
//               fontSize: AppSizes.fontSize32(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 32',
//               fontSize: 32.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 33',
//               fontSize: AppSizes.fontSize33(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 33',
//               fontSize: 33.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 34',
//               fontSize: AppSizes.fontSize34(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 34',
//               fontSize: 34.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 35',
//               fontSize: AppSizes.fontSize35(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 35',
//               fontSize: 35.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 36',
//               fontSize: AppSizes.fontSize36(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 36',
//               fontSize: 36.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 37',
//               fontSize: AppSizes.fontSize37(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 37',
//               fontSize: 37.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 38',
//               fontSize: AppSizes.fontSize38(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 38',
//               fontSize: 38.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 39',
//               fontSize: AppSizes.fontSize39(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 39',
//               fontSize: 39.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 40',
//               fontSize: AppSizes.fontSize40(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 40',
//               fontSize: 40.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 41',
//               fontSize: AppSizes.fontSize41(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 41',
//               fontSize: 41.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 42',
//               fontSize: AppSizes.fontSize42(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 42',
//               fontSize: 42.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 43',
//               fontSize: AppSizes.fontSize43(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 43',
//               fontSize: 43.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 44',
//               fontSize: AppSizes.fontSize44(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 44',
//               fontSize: 44.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 45',
//               fontSize: AppSizes.fontSize45(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 45',
//               fontSize: 45.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 46',
//               fontSize: AppSizes.fontSize46(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 46',
//               fontSize: 46.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 47',
//               fontSize: AppSizes.fontSize47(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 47',
//               fontSize: 47.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 48',
//               fontSize: AppSizes.fontSize48(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 48',
//               fontSize: 48.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 49',
//               fontSize: AppSizes.fontSize49(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 49',
//               fontSize: 49.0,
//             ),
//           ),
//           ListTile(
//             visualDensity: VisualDensity.compact,
//             dense: true,
//             title: CustomTextWidget(
//               text: 'Font 50',
//               fontSize: AppSizes.fontSize50(context),
//             ),
//             subtitle: const CustomTextWidget(
//               text: 'Font 50',
//               fontSize: 50.0,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
