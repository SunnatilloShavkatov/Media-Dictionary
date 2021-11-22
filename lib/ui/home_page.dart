import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:media_dictionary/base/extensions.dart';
import 'package:media_dictionary/controller/main_controller.dart';
import 'package:media_dictionary/core/custom_widgets/flappy_searchbar/flappy_search_bar.dart';
import 'package:media_dictionary/core/custom_widgets/pagination/pagination_widget.dart';
import 'package:media_dictionary/core/theme/app_colors.dart';
import 'package:media_dictionary/data/data_model.dart';

import 'widgets/home_item.dart';

class HomePage extends GetView<MainController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        int count =
            (controller.list.length - (controller.currentPage - 1) * 10);
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          child: Scaffold(
            backgroundColor: AppColors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 8),
                child: SearchBar<DataModel>(
                  hintText: 'Izlash',
                  onSearch: (v) {
                    return controller.search(v ?? '');
                  },
                  listPadding: const EdgeInsets.symmetric(vertical: 24),
                  onItemFound: (item, i) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: HomeItem(
                        model: item,
                      ),
                    );
                  },
                  title: 'Media lug‘at',
                  titleStyle: const TextStyle(
                    color: Color(0xff020D19),
                    fontSize: 42,
                    fontWeight: FontWeight.w600,
                  ),
                  placeHolder: ListView(
                    controller: controller.scrollController,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(24),
                    children: [
                      TabBar(
                        labelColor: const Color(0xff0D66C1),
                        unselectedLabelColor: const Color(0xff434B57),
                        indicatorColor: const Color(0xff0D66C1),
                        controller: controller.tabController,
                        onTap: controller.setTab,
                        tabs: List.generate(
                          controller.alphabet.length,
                          (index) => Tab(
                            text: controller.alphabet[index],
                          ),
                        ),
                        isScrollable: true,
                      ),
                      const SizedBox(height: 24),
                      ListView.separated(
                        controller: controller.scrollController,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          int t = (controller.currentPage - 1) * 10 + index;
                          return HomeItem(
                            model: controller.list[t],
                          );
                        },
                        separatorBuilder: (_, __) => const SizedBox(
                          height: 16,
                        ),
                        itemCount: count < 0
                            ? 0
                            : count > 10
                                ? 10
                                : count,
                      ),
                      const SizedBox(height: 24),
                      Visibility(
                        visible: count > 0,
                        child: SizedBox(
                          height: 40,
                          child: PaginationWidget(
                            maxPage: controller.list.length.toRound(10),
                            currentPage: controller.currentPage,
                            onPageChanged: controller.setCurrentPage,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
