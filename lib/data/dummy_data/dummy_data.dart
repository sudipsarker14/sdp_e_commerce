import 'package:flutter_e_commerce/features/shop/models/banner_model.dart';
import 'package:flutter_e_commerce/features/shop/models/brand_model.dart';
import 'package:flutter_e_commerce/features/shop/models/category_model.dart';
import 'package:flutter_e_commerce/features/shop/models/product_attribute_model.dart';
import 'package:flutter_e_commerce/features/shop/models/product_model.dart';
import 'package:flutter_e_commerce/features/shop/models/product_variation_model.dart';
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

  // List of all Products
  static final List<SdpProductModel> products = [
    SdpProductModel(
        id: '001',
        title: 'Green Nike sports shoe',
        stock: 15,
        price: 135,
        isFeatured: true,
        thumbnail: SdpImages.productImage1,
        description: 'Green Nike sports shoe',
        brand: SdpBrandModel(id: '1', image: SdpImages.nikeLogo, name: 'Nike', productCount: 265, isFeatured: true),
        images: [SdpImages.productImage23, SdpImages.productImage21, SdpImages.productImage9],
        sku: 'ABR4568',
        categoryId: '1',
        productAttributes: [
          SdpProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
          SdpProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU34'])
        ],
        productVariations: [
          SdpProductVariationModel(
            id: '1', 
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: SdpImages.productImage1,
            description: 'This is a Product description for Green Nike Sports Shoews',
            attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
            SdpProductVariationModel(
            id: '2', 
            stock: 15,
            price: 132,
            image: SdpImages.productImage23,
            attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
            SdpProductVariationModel(
            id: '3', 
            stock: 15,
            price: 132,
            image: SdpImages.productImage23,
            attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
            SdpProductVariationModel(
            id: '3', 
            stock: 15,
            price: 132,
            image: SdpImages.productImage23,
            attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
            SdpProductVariationModel(
            id: '4', 
            stock: 222,
            price: 232,
            image: SdpImages.productImage1,
            attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
            SdpProductVariationModel(
            id: '5', 
            stock: 0,
            price: 532,
            image: SdpImages.productImage21,
            attributeValues: {'Color': 'Yelloo', 'Size': 'EU 32'}),
            SdpProductVariationModel(
            id: '6', 
            stock: 11,
            price: 345,
            image: SdpImages.productImage24,
            attributeValues: {'Color': 'Blue', 'Size': 'EU 32'}),
        ],
    productType: 'ProductType.variable'         
  ),
   SdpProductModel(
        id: '002',
        title: 'Blue T-shirt for all ages',
        stock: 15,
        price: 35,
        isFeatured: true,
        thumbnail: SdpImages.productImage69,
        description: 'This is a product description for Blue T-shirt for all ages',
        brand: SdpBrandModel(id: '6', image: SdpImages.zaraLogo, name: 'Zara'),
        images: [SdpImages.productImage68, SdpImages.productImage69, SdpImages.productImage5],
        salePrice: 30,
        sku: 'ABR4578',
        categoryId: '16',
        productAttributes: [
          SdpProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
          SdpProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue'])
        ],
        productType: 'ProductType.single',
   ),
  ];
  
}
