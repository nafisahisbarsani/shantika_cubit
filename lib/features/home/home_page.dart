import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iconly/iconly.dart';
import 'package:path/path.dart';
import 'package:shantika_cubit/features/article/artikel_page.dart';
import 'package:shantika_cubit/features/testimoni/testimoni_page.dart';

import '../../model/home_model.dart';
import '../../ui/color.dart';
import '../../ui/dimension.dart';
import '../../ui/shared_widget/CustomCarouselCard.dart';
import '../../ui/shared_widget/custom_button.dart';
import '../../ui/shared_widget/custom_card.dart';
import '../../ui/shared_widget/custom_section_divider.dart';
import '../../ui/typography.dart';
import '../notif/notification_page.dart';
import 'cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..fetchHomeData(),
      child: Scaffold(
        backgroundColor: black00,
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading || state is HomeInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeError) {
              return Center(child: Text(state.message));
            } else if (state is HomeSuccess) {
              final homeData = state.homeData;

              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/bg_home.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Container(height: 800, color: Colors.transparent),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 36),
                        _buildHeaderView(context),
                        _buildSearchTicketBusView(),
                        const SizedBox(height: 20),
                        _buildCarouselView(homeData),
                        const SizedBox(height: 20),
                        _buildMenuView(homeData), // ← Pass homeData!
                        _buildHowYourTrip(),
                        _buildHistoryView(homeData), // ← Pass homeData!
                        _buildPromoView(homeData),
                        _buildArticleView(context, homeData),
                        _buildTestimoniView(context, homeData),
                      ],
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

Widget _buildHeaderView(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: MediaQuery.of(context).size.width * 0.09),
        Image.asset('assets/images/logo_shantika.png'),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationPage()),
            );
          },
          icon: Icon(Icons.notifications, color: black00),
        ),
      ],
    ),
  );
}

Widget _buildSearchTicketBusView() {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        CustomCard(
          color: black00,
          borderRadius: BorderRadius.circular(borderRadius500),
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Center(child: Text("Cari Tiket Bus", style: smSemiBold)),
              SizedBox(height: 28),
              Stack(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Keberangkatan",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text("Pilih Keberangkatan", style: smMedium),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey[300],
                        margin: EdgeInsets.symmetric(
                          vertical: 9.5,
                          horizontal: 40,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tujuan",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text("Pilih Tujuan", style: smMedium),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: Icon(
                        IconlyLight.swap,
                        color: Colors.grey,
                        size: 21,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28),
              CustomButton(
                onPressed: () {},
                child: Text(
                  "Cari Tiket",
                  style: smMedium.copyWith(color: black00),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildCarouselView(HomeModel homeData) {
  final sliders = homeData.slider ?? [];

  if (sliders.isEmpty) {
    return const SizedBox();
  }

  return CarouselSlider(
    options: CarouselOptions(
      autoPlay: true,
      viewportFraction: 0.9,
      aspectRatio: 1.6,
    ),
    items: sliders.map((slider) {
      final imageUrl = slider.image ?? "";
      if (imageUrl.isEmpty) {
        return const SizedBox();
      }

      return Builder(
        builder: (BuildContext context) {
          return CustomCarouselCard(
            imagePath: imageUrl,
            isNetwork: true, // important!
            title: slider.name ?? "",
            subtitle: slider.description ?? "",
          );
        },
      );
    }).toList(),
  );
}

Widget _buildMenuView(HomeModel homeData) {
  final menus = homeData.customerMenu ?? [];

  print('📱 Menu - Total items: ${menus.length}');

  if (menus.isEmpty) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CustomSectionDivider(text: "Menu Favorit"),
          SizedBox(height: 20),
          Text("Loading menu...", style: smRegular),
        ],
      ),
    );
  }

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        CustomSectionDivider(text: "Menu Favorit"),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 21.33,
            childAspectRatio: 0.8,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: menus.length,
          itemBuilder: (context, index) {
            final menu = menus[index];
            print('🔗 Menu item: ${menu.name} - Icon: ${menu.icon}');

            return _buildMenuItem(menu.icon ?? "", menu.name ?? "Menu");
          },
        ),
      ],
    ),
  );
}

Widget _buildMenuItem(String iconUrl, String title) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      ClipOval(
        child: iconUrl.startsWith('http')
            ? Image.network(
                iconUrl,
                fit: BoxFit.cover,
                width: 50,
                height: 50,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey[300],
                    child: Icon(Icons.error),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    width: 50,
                    height: 50,
                    child: Center(child: CircularProgressIndicator()),
                  );
                },
              )
            : Image.asset(iconUrl, fit: BoxFit.cover),
      ),
      SizedBox(height: 4),
      Text(
        title,
        style: xxsRegular,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  );
}

Widget _buildHowYourTrip() {
  return Padding(
    padding: EdgeInsets.all(20),
    child: CustomCard(
      width: 340,
      height: 116,
      borderRadius: BorderRadius.circular(borderRadius300),
      color: jacarta800,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bagaimana perjalananmu?",
                    style: xsSemiBold.copyWith(color: black00),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Berikan review untuk pengalaman perjalananmu bersama New Shantika",
                    style: xxsRegular.copyWith(color: black00),
                  ),
                  SizedBox(height: 12),
                  CustomButton(
                    child: Text(
                      "Beri Review",
                      style: xxsMedium.copyWith(color: black950),
                    ),
                    backgroundColor: Colors.white,
                    height: 28,
                    width: 89,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(width: 27.82),
            Image.asset('assets/images/star.png', height: 50.18, width: 48),
          ],
        ),
      ),
    ),
  );
}

Widget _buildHistoryView(HomeModel homeData) {
  final reviews = homeData.pendingReviews ?? [];

  print('📜 History - Pending reviews: ${reviews.length}');

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        // Section divider always visible
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomSectionDivider(text: "Riwayat"),
            TextButton(
              onPressed: () {
                // Navigate to full history page
              },
              child: Text(
                "Lihat Semua",
                style: smSemiBold.copyWith(color: textPrimary),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        reviews.isEmpty
            ? Text("Tidak ada riwayat saat ini", style: smRegular)
            : SizedBox(
          height: 220, // adjust based on card height
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: reviews.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final review = reviews[index];

              return CustomCard(
                width: 300,
                borderRadius: BorderRadius.circular(borderRadius300),
                color: black00,
                padding: const EdgeInsets.only(
                    top: 16, left: 20, right: 20, bottom: 16),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "${review.nameFleet ?? 'Bus'} • ${review.fleetClass ?? 'Class'}",
                                style: smMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 8),
                            CustomButton(
                              width: 89,
                              height: 22,
                              onPressed: () {
                                // Handle review action
                              },
                              child: Text(
                                "Beri Review",
                                style:
                                xsMedium.copyWith(color: black00),
                              ),
                              backgroundColor: textPrimaryPressed,
                            ),
                          ],
                        ),
                        Text(
                          "${review.createdAt ?? ''} • ${review.departureAt ?? ''}",
                          style: xsRegular.copyWith(
                              color: textDarkTertiary),
                        ),
                        const SizedBox(height: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // START LOCATION
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: iconDarkSecondary,
                                  size: 20,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        review.checkpoints?.start
                                            ?.agencyName ??
                                            "Starting Point",
                                        style: xsMedium,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        review.departureAt ?? "",
                                        style: xxsRegular.copyWith(
                                          color: textDarkTertiary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            // DESTINATION LOCATION
                            Row(
                              children: [
                                Icon(Icons.location_on,
                                    color: iconPrimary, size: 20),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        review.checkpoints?.destination
                                            ?.agencyName ??
                                            "Destination",
                                        style: xsMedium,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        review.checkpoints?.destination
                                            ?.cityName ??
                                            "",
                                        style: xxsRegular.copyWith(
                                          color: textDarkTertiary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Text(
                        "Rp${review.price?.toString() ?? '0'}",
                        style: mdSemiBold.copyWith(color: textPrimary),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget _buildPromoView(HomeModel homeData) {
  final promos = homeData.promo ?? [];

  print('🎁 Promo - Total promos: ${promos.length}');

  return Padding(
    padding: EdgeInsets.all(20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomSectionDivider(text: "Promo"),
            TextButton(
              onPressed: () {},
              child: Text(
                "Lihat Semua",
                style: smSemiBold.copyWith(color: textPrimary),
              ),
            ),          ],
        ),
        SizedBox(height: 20),
        promos.isEmpty
            ? Text("Tidak ada promo saat ini", style: smRegular)
            : SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  itemCount: promos.length,
                  itemBuilder: (context, index) {
                    final promo = promos[index];
                    return CustomCard(
                      color: black00,
                      width: 300,
                      margin: EdgeInsets.only(right: 10),
                      borderSide: BorderSide(
                        width: 1,
                        color: borderNeutralLight,
                      ),
                      padding: EdgeInsets.zero,
                      borderRadius: BorderRadius.circular(borderRadius500),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(borderRadius500),
                            ),
                            child: Image.network(
                              promo['image'] ?? '',
                              height: 116,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 116,
                                  color: Colors.grey[300],
                                  child: Icon(Icons.image),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  promo['title'] ?? "Promo",
                                  style: smMedium,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  promo['subtitle'] ?? "Deskripsi promo",
                                  style: xsRegular.copyWith(color: textPrimary),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
      ],
    ),
  );
}

Widget _buildArticleView(BuildContext context, HomeModel homeData) {
  final articles = homeData.artikel ?? [];

  print('📰 Articles - Total: ${articles.length}');

  if (articles.isEmpty) {
    return const SizedBox();
  }

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomSectionDivider(text: "Artikel"),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ArtikelPage()),
                );
              },
              child: Text(
                "Lihat Semua",
                style: smSemiBold.copyWith(color: textPrimary),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: articles.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final article = articles[index];

              print('📄 Article: ${article.name} - Image: ${article.image}');

              return CustomCard(
                color: black00,
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        article.image ?? "",
                        width: 150,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 150,
                            height: 100,
                            color: Colors.grey[300],
                            child: Icon(Icons.article),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            width: 150,
                            height: 100,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: 150,
                      child: Text(
                        article.name ?? "Artikel",
                        style: xsMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget _buildTestimoniView(BuildContext context, HomeModel homeData) {
  final testimonials = homeData.testimonial ?? [];

  print('💬 Testimonials - Total: ${testimonials.length}');

  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        // Always show the section divider and "Lihat Semua"
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomSectionDivider(text: "Testimoni"),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TestimoniPage(),
                  ),
                );
              },
              child: Text(
                "Lihat Semua",
                style: smSemiBold.copyWith(color: textPrimary),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Show placeholder if no testimonials
        testimonials.isEmpty
            ? Text("Tidak ada testimoni saat ini", style: smRegular)
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: ListView.separated(
                  itemCount: testimonials.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemBuilder: (BuildContext context, int index) {
                    final t = testimonials[index];
                    return CustomCard(
                      width: 320,
                      borderRadius: BorderRadius.circular(borderRadius300),
                      borderSide: BorderSide(
                        color: borderNeutralLight,
                        width: 1,
                      ),
                      color: black00,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(t['name'] ?? "User", style: smMedium),
                                Text(t['date'] ?? "", style: xsRegular),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(t['busClass'] ?? "", style: xsRegular),
                            const SizedBox(height: 8),
                            Row(
                              children: List.generate(
                                t['rating'] ?? 5,
                                (_) => const Icon(
                                  Icons.star,
                                  color: yellow400,
                                  size: 20,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(t['comment'] ?? "", style: smRegular),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
      ],
    ),
  );
}