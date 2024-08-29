import 'package:flutter_e_commerce/features/shop/models/banner_model.dart';
import 'package:flutter_e_commerce/features/shop/models/category_model.dart';
import 'package:flutter_e_commerce/routes/routes.dart';
import 'package:flutter_e_commerce/utils/constants/image_strings.dart';

class SdpDummyData {
  // Banners
  static final List<SdpBannerModel> banners = [
    SdpBannerModel(
        imageUrl: SdpImages.banner1,
        targetScreen: SdpRoutes.order,
        active: false),
    SdpBannerModel(
        imageUrl: SdpImages.banner2,
        targetScreen: SdpRoutes.cart,
        active: true),
    SdpBannerModel(
        imageUrl: SdpImages.banner3,
        targetScreen: SdpRoutes.favourites,
        active: true),
    SdpBannerModel(
        imageUrl: SdpImages.banner4,
        targetScreen: SdpRoutes.search,
        active: true),
    SdpBannerModel(
        imageUrl: SdpImages.banner5,
        targetScreen: SdpRoutes.settings,
        active: true),
    SdpBannerModel(
        imageUrl: SdpImages.banner6,
        targetScreen: SdpRoutes.userAddress,
        active: true),
    SdpBannerModel(
        imageUrl: SdpImages.banner8,
        targetScreen: SdpRoutes.checkout,
        active: true),
  ];

  // List of all Categories
  static final List<SdpCategoryModel> categories = [
    SdpCategoryModel(
        id: '1', name: 'Sports', image: SdpImages.sportIcon, isFeatured: true),
    SdpCategoryModel(
        id: '5',
        name: 'Furniture',
        image: SdpImages.furnitureIcon,
        isFeatured: true),
    SdpCategoryModel(
        id: '2',
        name: 'Electronics',
        image: SdpImages.electronicsIcon,
        isFeatured: true),
    SdpCategoryModel(
        id: '3', name: 'Clothes', image: SdpImages.clothIcon, isFeatured: true),
    SdpCategoryModel(
        id: '4',
        name: 'Animals',
        image: SdpImages.animalIcon,
        isFeatured: true),
    SdpCategoryModel(
        id: '6', name: 'Shoes', image: SdpImages.shoeIcon, isFeatured: true),
    SdpCategoryModel(
        id: '14',
        name: 'Jewelery',
        image: SdpImages.jeweleryIcon,
        isFeatured: true),
    SdpCategoryModel(
        id: '7',
        name: 'Cosmetics',
        image: SdpImages.cosmeticsIcon,
        isFeatured: true),

    // subcategories
    SdpCategoryModel(
        id: '8',
        name: 'Sports Shoes',
        image: SdpImages.sportIcon,
        parentId: '1',
        isFeatured: false),
    SdpCategoryModel(
        id: '9',
        name: 'Track suits',
        image: SdpImages.sportIcon,
        parentId: '1',
        isFeatured: false),
    SdpCategoryModel(
        id: '10',
        name: 'Sports Equipmets',
        image: SdpImages.sportIcon,
        parentId: '1',
        isFeatured: false),
    //furniture
    SdpCategoryModel(
        id: '11',
        name: 'Bedroom furniture',
        image: SdpImages.furnitureIcon,
        parentId: '5',
        isFeatured: false),
    SdpCategoryModel(
        id: '12',
        name: 'Kitchen furniture',
        image: SdpImages.furnitureIcon,
        parentId: '5',
        isFeatured: false),
    SdpCategoryModel(
        id: '13',
        name: 'Office furniture',
        image: SdpImages.furnitureIcon,
        parentId: '5',
        isFeatured: false),

    SdpCategoryModel(
        id: '15',
        name: 'Laptop',
        image: SdpImages.electronicsIcon,
        parentId: '2',
        isFeatured: false),
    SdpCategoryModel(
        id: '16',
        name: 'Mobile',
        image: SdpImages.electronicsIcon,
        parentId: '2',
        isFeatured: false),
    //Cloth
    SdpCategoryModel(
        id: '17',
        name: 'Shirts',
        image: SdpImages.clothIcon,
        parentId: '3',
        isFeatured: false),
  ];
}
