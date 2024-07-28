# OLX App

OLX is a mobile application developed using Dart and Flutter, leveraging Bloc state management and Clean Architecture. This app provides a seamless user experience for browsing, buying, and selling products.
*Video Placeholder:*

#### Video

[![Watch the video](https://img.youtube.com/vi/zPhuAL88d_M/0.jpg)](https://www.youtube.com/watch?v=zPhuAL88d_M)

## Download the APK

[![Download APK](https://img.icons8.com/color/48/000000/download-2.png)](https://github.com/ashrf100/olx_bloc/blob/main/apk/app-release.apk)

## Table of Contents

1. [Onboarding and Authentication](#onboarding-and-authentication)
2. [Home, Products, and Cart](#home-products-and-cart)
3. [Google Maps](#google-maps)

## Onboarding and Authentication

### Onboarding


- Language selection (Arabic and English)
- Two themes for different languages

### Authentication


- **APIs**: [dummyjson.com](https://dummyjson.com/)
- **Login**: API supported using POST method
- **Signup**: UI only
- **Reset Password**: UI only
- **Test Users**: Available via "?" icon or [dummyjson.com/users](https://dummyjson.com/users)
- **Data Handling**: Loading states, internet connectivity, server error handling, and wrong credentials



## Home, Products, and Cart

### Home


- **GET method**: Fetch product listings from [dummyjson.com](https://dummyjson.com/)
  **Pagination**: Supported in list and grid views
- **Random Images**: Used for categories due to lack of images
- **Data Handling**: Loading states, internet connectivity, and server error handling
  **Slivers**: Smooth scrolling implementation

### Cart


- **POST method**: Simulate add to cart; returns new cart ID
- **State Management**: Updates cart item count in bottom navigation bar
- **User Feedback**: Vibration and bottom sheet notification on successful add



## Google Maps


- **App Bar with Title**: Displays selected location, similar to Amazon's location selection
- **Two Screens**:
  - **Map Selection Screen**: User selects a location using Google Maps with a validator to ensure a location is chosen
  - **Location Details Screen**: User enters additional details and confirms the location
- **Technologies Used**: `google_maps_flutter`, `geolocator`, `geocoding`
- Note: Google Maps token key is not uploaded. You need to add your own token key in the project.

- 



---


