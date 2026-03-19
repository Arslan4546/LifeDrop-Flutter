import 'package:flutter/material.dart';
import 'package:life_drop/core/constants/app_colors.dart';
import 'package:life_drop/core/constants/app_fonts.dart';
import 'package:life_drop/views/recipient_view/recipient_bottom_nav_view/recipient_create_request_view/recipient_create_request_view_widgets.dart';

class RecipientCreateRequestView extends StatefulWidget {
  const RecipientCreateRequestView({super.key});

  @override
  State<RecipientCreateRequestView> createState() =>
      _RecipientCreateRequestViewState();
}

class _RecipientCreateRequestViewState
    extends State<RecipientCreateRequestView> {
  String selectedBloodGroup = "A+";
  int unitsNeeded = 1;
  String selectedUrgency = "Critical";

  final List<String> bloodGroups = [
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-",
  ];
  final List<String> urgencyLevels = ["Low", "Medium", "Critical"];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double hPadding = size.width * 0.05;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Request Blood",
          style: AppFonts.headingSmall(color: AppColors.textPrimaryColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: hPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress Bar Section
                  const SizedBox(height: 10),
                  ProgressHeader(
                    progress: 0.5,
                    stepText: "Step 1 of 2: Details",
                    percentText: "50%",
                  ),
                  const SizedBox(height: 30),

                  // Header Text
                  Text(
                    "Create Request",
                    style: AppFonts.headingLarge(
                      color: AppColors.textPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Please provide the details for the blood requirement.",
                    style: AppFonts.bodyMedium(
                      color: AppColors.textSecondaryColor,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Blood Group Grid
                  Text(
                    "Blood Group Needed",
                    style: AppFonts.bodyMedium(weight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.5,
                        ),
                    itemCount: bloodGroups.length,
                    itemBuilder: (context, index) {
                      return BloodGroupChip(
                        label: bloodGroups[index],
                        isSelected: selectedBloodGroup == bloodGroups[index],
                        onTap: () => setState(
                          () => selectedBloodGroup = bloodGroups[index],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),

                  // Hospital Name Input
                  const FormLabel(label: "Hospital Name"),
                  const FormInputField(
                    hintText: "Enter hospital name",
                    icon: Icons.local_hospital,
                  ),
                  const SizedBox(height: 24),

                  // Units and Urgency Row
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const FormLabel(label: "Units Needed"),
                            UnitCounter(
                              value: unitsNeeded,
                              onIncrement: () => setState(() => unitsNeeded++),
                              onDecrement: () => setState(
                                () => unitsNeeded > 1 ? unitsNeeded-- : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const FormLabel(label: "Urgency"),
                            UrgencyDropdown(
                              value: selectedUrgency,
                              items: urgencyLevels,
                              onChanged: (val) =>
                                  setState(() => selectedUrgency = val!),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Location Picker Mockup
                  const FormLabel(label: "Location"),
                  const LocationPickerMock(
                    address: "Central Park West, Manhattan, NY",
                  ),
                  const SizedBox(height: 24),

                  // Contact Number
                  const FormLabel(label: "Contact Number"),
                  const FormInputField(
                    hintText: "+1 (555) 000-0000",
                    icon: Icons.call,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // Footer Action Button
          Container(
            padding: EdgeInsets.fromLTRB(hPadding, 16, hPadding, 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: AppColors.borderColor, width: 0.5),
              ),
            ),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Text("Post Request"),
              label: const Icon(Icons.send, size: 18),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                textStyle: AppFonts.bodyLarge(weight: FontWeight.bold),
                elevation: 4,
                shadowColor: AppColors.primaryColor.withOpacity(0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
