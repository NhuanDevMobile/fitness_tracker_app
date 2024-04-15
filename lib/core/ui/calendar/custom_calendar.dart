import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/button/button_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  CustomCalendar(
      {super.key,
      this.focusedDay,
      this.selectedDay,
      this.startRange,
      this.endRange});
  DateTime? focusedDay;
  DateTime? selectedDay;
  DateTime? startRange;
  DateTime? endRange;
  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _startRange;
  DateTime? _endRange;
  @override
  void initState() {
    setState(() {
      _selectedDay = widget.selectedDay ?? DateTime.now();
      _startRange = widget.startRange;
      _endRange = widget.endRange;
      _focusedDay = widget.focusedDay ?? DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.0,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: content(),
    );
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, day)) {
      setState(() {
        _selectedDay = day;
        _focusedDay = focusedDay;
      });
    }
  }

  void _onRangeDaySelected(
      DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      // _selectedDay = null;
      // _focusedDay = focusedDay;

      _startRange = start;
      _endRange = end;
    });
  }

  Widget customAppBar() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset("assets/icons/ic_close_fill.svg"),
          ),
          const Expanded(
            child: Center(
              child: TextWidget(
                text: "select_dates",
                size: AppDimens.textSize17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget content() {
    return Column(
      children: [
        // customAppBar(),
        TableCalendar(
          daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: AppDimens.textSize18,
              ),
              weekendStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: AppDimens.textSize18,
              )),
          rowHeight: 54.0,
          headerStyle: HeaderStyle(
            leftChevronIcon: Container(
              height: 30.0,
              width: 30.0,
              decoration: BoxDecoration(
                  color: AppColors.colorPink.withOpacity(0.5),
                  shape: BoxShape.circle),
              child: Icon(
                Icons.chevron_left,
                size: 20.0,
                color: Colors.indigoAccent,
              ),
            ),
            rightChevronIcon: Container(
              height: 30.0,
              width: 30.0,
              decoration: BoxDecoration(
                  color: AppColors.colorPink.withOpacity(0.5),
                  shape: BoxShape.circle),
              child: const Icon(
                Icons.chevron_right,
                size: 20.0,
                color: Colors.indigoAccent,
              ),
            ),
            formatButtonVisible: false,
            titleCentered: true,
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: AppDimens.textSize20,
                color: AppColors.colorPink),
          ),
          availableGestures: AvailableGestures.all,
          focusedDay: _selectedDay!,
          firstDay: DateTime(1900),
          lastDay: DateTime(2100),
          calendarFormat: CalendarFormat.month,
          startingDayOfWeek: StartingDayOfWeek.monday,
          onDaySelected: _onDaySelected,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          daysOfWeekHeight: 54.0,
          calendarStyle: CalendarStyle(
            markerDecoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            holidayDecoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            weekendDecoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            todayDecoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            todayTextStyle: const TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w500,
              fontSize: AppDimens.textSize16,
            ),
            selectedTextStyle: const TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
              fontSize: AppDimens.textSize18,
            ),
            outsideDaysVisible: true,
            defaultTextStyle: TextStyle(
              color: AppColors.black4,
              fontWeight: FontWeight.w500,
              fontSize: AppDimens.textSize18,
            ),
            weekendTextStyle: TextStyle(
              color: AppColors.black4,
              fontWeight: FontWeight.w500,
              fontSize: AppDimens.textSize18,
            ),
            outsideTextStyle: const TextStyle(
              color: AppColors.gray,
              fontWeight: FontWeight.w500,
              fontSize: AppDimens.textSize18,
            ),
            defaultDecoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            withinRangeDecoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            selectedDecoration: const BoxDecoration(
              color: AppColors.colorPink,
              shape: BoxShape.circle,
            ),
            disabledDecoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            outsideDecoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
        ),
        const Divider(height: 1, thickness: 1),
        ButtonWidget(
          ontap: () {
            Get.back(
              result: _selectedDay,
            );
          },
          text: "Done",
          height: 52.0,
          width: 300.0,
          backgroundColor: AppColors.white,
          textColor: AppColors.colorPink,
        )
      ],
    );
  }
}
