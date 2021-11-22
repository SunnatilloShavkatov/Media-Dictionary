import 'package:flutter/material.dart';
import 'package:media_dictionary/core/theme/app_colors.dart';
import 'package:media_dictionary/core/theme/app_text_style.dart';

class PaginationWidget extends StatelessWidget {
  final int currentPage;
  final int maxPage;

  final Function(int) onPageChanged;

  const PaginationWidget({
    Key? key,
    required this.onPageChanged,
    required this.currentPage,
    required this.maxPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = false;
    return Row(
      children: [
        InkWell(
          onTap: () {
            if (currentPage > 1) onPageChanged(currentPage - 1);
          },
          customBorder: const CircleBorder(),
          child: Ink(
            height: 40,
            width: 40,
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.grey,
              size: 16,
            ),
          ),
        ),
        ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            if (maxPage <= 5) {
              if ((index + 1) == currentPage) {
                return SelectedWidget(
                  select: (index + 1).toString(),
                );
              } else {
                return SelectButtonWidget(
                  onPageChanged: onPageChanged,
                  select: (index + 1).toString(),
                );
              }
            } else {
              if (index == 0 && currentPage == 1) {
                isSelected = true;
                return SelectedWidget(
                  select: getCurrentPage(index),
                );
              } else if (index == 1 && currentPage == 2) {
                isSelected = true;
                return SelectedWidget(
                  select: getCurrentPage(index),
                );
              } else if (index == 3 && currentPage == (maxPage - 1)) {
                isSelected = true;
                return SelectedWidget(
                  select: getCurrentPage(index),
                );
              } else if (index == 4 && currentPage == maxPage) {
                isSelected = true;
                return SelectedWidget(
                  select: getCurrentPage(index),
                );
              } else if (index == 2 &&
                  !(currentPage == maxPage) &&
                  !isSelected &&
                  !(currentPage == (maxPage - 1))) {
                return SelectedWidget(
                  select: getCurrentPage(index),
                );
              } else {
                return SelectButtonWidget(
                  onPageChanged: onPageChanged,
                  select: getCurrentPage(index),
                );
              }
            }
          },
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemCount: maxPage < 5 ? maxPage : 5,
        ),
        InkWell(
          onTap: () {
            if (currentPage < maxPage) onPageChanged(currentPage + 1);
          },
          customBorder: const CircleBorder(),
          child: Ink(
            height: 40,
            width: 40,
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.grey,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }

  String getCurrentPage(
    int index,
  ) {
    if (currentPage < 4) {
      switch (index) {
        case 0:
          return '1';
        case 1:
          return '2';
        case 2:
          return '3';
        case 3:
          return '4';
        case 4:
          return '...$maxPage';
        default:
          return '0';
      }
    } else if ((maxPage - 2) <= currentPage) {
      switch (index) {
        case 0:
          return '1';
        case 1:
          return '...${maxPage - 3}';
        case 2:
          return '${maxPage - 2}';
        case 3:
          return '${maxPage - 1}';
        case 4:
          return '$maxPage';

        default:
          return '0';
      }
    } else {
      switch (index) {
        case 0:
          return '1';
        case 1:
          return '...${currentPage - 1}';
        case 2:
          return '$currentPage';
        case 3:
          return '...${currentPage + 1}';
        case 4:
          return '$maxPage';
        default:
          return '0';
      }
    }
  }
}

class SelectedWidget extends StatelessWidget {
  final String select;

  const SelectedWidget({
    Key? key,
    required this.select,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1, color: AppColors.grey),
      ),
      child: Center(
        child: Text(
          select,
          style: AppTextStyles.paginationItem,
        ),
      ),
    );
  }
}

class SelectButtonWidget extends StatelessWidget {
  final String select;
  final Function(int index) onPageChanged;

  const SelectButtonWidget({
    Key? key,
    required this.select,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          onPageChanged(
            int.parse(
              select.replaceAll('...', ''),
            ),
          );
        },
        customBorder: const CircleBorder(),
        child: Ink(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Center(
            child: Text(
              select,
              style: AppTextStyles.paginationItem,
            ),
          ),
        ),
      ),
    );
  }
}
