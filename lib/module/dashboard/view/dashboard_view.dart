import 'dart:math';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:hyper_ui/shared/widget/form/category_picker/category_picker_no_title.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:hyper_ui/module/dashboard/widget/dashboard_banner.dart';
import 'package:hyper_ui/shared/widget/form/searchfield/searchfield.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyper_ui/core.dart';
import '../controller/dashboard_controller.dart';
import '../state/dashboard_state.dart';
import 'package:get_it/get_it.dart';

class DashboardView extends StatefulWidget {
  DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardController controller = GetIt.I<DashboardController>();

  @override
  void initState() {
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.ready(),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => controller,
      child: BlocListener<DashboardController, DashboardState>(
        listener: (context, state) {},
        child: BlocBuilder<DashboardController, DashboardState>(
          builder: (context, state) {
            final bloc = context.read<DashboardController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    DashboardController controller,
    DashboardState state,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        key: Key(Random().nextInt(1000).toString()),
        controller: ScrollController(),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 350,
              child: Stack(
                children: [
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xff141414),
                          Color(0xff303030),
                        ],
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Location",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Bogor, Indonesia",
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Icon(
                                            MdiIcons.chevronDown,
                                            size: 18.0,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 48.0,
                                  width: 48.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://i.ibb.co/PGv8ZzG/me.jpg",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        8.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                                .animate()
                                .moveY(
                                  duration: 800.ms,
                                )
                                .fadeIn(
                                  duration: 800.ms,
                                ),
                            SizedBox(
                              height: 12.0,
                            ),
                            SearchField(
                              hintText: "Search",
                              onChanged: (value) {},
                            )
                                .animate()
                                .scale(
                                  duration: 800.ms,
                                )
                                .fadeIn(
                                  duration: 800.ms,
                                ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    right: 24,
                    top: 185,
                    child: DashboardBanner()
                        .animate()
                        .shake(
                          duration: 800.ms,
                        )
                        .fadeIn(
                          duration: 800.ms,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  QCategoryPicker(
                    key: Key(Random().nextInt(1000).toString()),
                    items: [
                      {
                        "label": "Capuccino",
                        "value": "Capuccino",
                      },
                      {
                        "label": "Machiatto",
                        "value": "Machiatto",
                      },
                      {
                        "label": "Latte",
                        "value": "Latte",
                      },
                      {
                        "label": "Milk",
                        "value": "Milk",
                      },
                      {
                        "label": "Tea",
                        "value": "Tea",
                      },
                      {
                        "label": "Snack",
                        "value": "Snack",
                      },
                    ],
                    validator: Validator.required,
                    onChanged: (index, label, value, item) {},
                  ),
                  // SizedBox(
                  //   height: 20.0,
                  // ),
                  // ListView axis Horizontal
                  // SingleChldScrollView axis Horizontal
                  LayoutBuilder(builder: (context, constraint) {
                    /* OPSI I
                    bool isTablet = MediaQuery.of(context).size.width < 1100 &&
                        MediaQuery.of(context).size.width >= 850;
                    bool isDesktop = MediaQuery.of(context).size.width >= 1100;
                    bool isMobile = MediaQuery.of(context).size.width < 850;

                    int crossAxisCount = 2;

                    if (isTablet) {
                      crossAxisCount = 4;
                    } else if (isDesktop) {
                      crossAxisCount = 6;
                    }
                    */

                    /* OPSI 2 */
                    int crossAxisCount =
                        (MediaQuery.of(context).size.width / 160).floor();

                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.0 / 1.6,
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: state.products.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var item = state.products[index];
                        return Container(
                          // color: Colors.purple,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        item["photo"] ??
                                            "https://i.ibb.co/S32HNjD/no-image.jpg",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        8.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 6.0,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item["product_name"],
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Text(
                                      item["category"],
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color(0xff9a9a9a),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "\$${item["price"]}",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 32,
                                          width: 32,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.all(0.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                            .animate()
                            .moveX(
                              begin: index % 2 == 0 ? -100 : 100,
                              duration: ((index * 300) + 800).ms,
                            )
                            .fadeIn(
                              duration: ((index * 300) + 800).ms,
                            );
                      },
                    );
                  }),
                  // GridView.builder(
                  //   padding: EdgeInsets.zero,
                  //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //     childAspectRatio: 1.0 / 1.4,
                  //     crossAxisCount: 2,
                  //     mainAxisSpacing: 8,
                  //     crossAxisSpacing: 8,
                  //   ),
                  //   itemCount: controller.state.products.length,
                  //   shrinkWrap: true,
                  //   physics: ScrollPhysics(),
                  //   itemBuilder: (BuildContext context, int index) {
                  //     var item = controller.state.products[index];
                  //     return Container(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Expanded(
                  //             child: Container(
                  //               width: MediaQuery.of(context).size.width,
                  //               clipBehavior: Clip.antiAlias,
                  //               decoration: BoxDecoration(
                  //                 image: DecorationImage(
                  //                   image: NetworkImage(
                  //                     item["photo"],
                  //                   ),
                  //                   fit: BoxFit.cover,
                  //                 ),
                  //                 borderRadius: BorderRadius.all(
                  //                   Radius.circular(
                  //                     6.0,
                  //                   ),
                  //                 ),
                  //               ),
                  //               child: Stack(
                  //                 children: [
                  //                   Positioned(
                  //                     right: 6.0,
                  //                     top: 8.0,
                  //                     child: CircleAvatar(
                  //                       radius: 14.0,
                  //                       backgroundColor: Colors.white,
                  //                       child: Icon(
                  //                         Icons.favorite,
                  //                         color: Colors.red,
                  //                         size: 14.0,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: 8.0,
                  //           ),
                  //           Text(
                  //             item["product_name"],
                  //             style: TextStyle(
                  //               fontSize: 16.0,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: 4.0,
                  //           ),
                  //           Text(
                  //             item["category"],
                  //             style: TextStyle(
                  //               fontSize: 12.0,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: 4.0,
                  //           ),
                  //           Text(
                  //             "${item["price"]}",
                  //             style: TextStyle(
                  //               fontSize: 16.0,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
