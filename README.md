# product_listing

This is a simple Flutter application that allows users to browse a list of products, view product details, and mark products as favorites. The app fetches product data from a mock API and includes basic state management using Provider.

## Features
- Product List Screen:
  - Fetch products from a mock API.
  - Display products with image, name, and price.
  - Infinite scrolling to load more products.
  - Search bar to filter products by name.
  
- Product Details Screen:
  - View detailed information about a product (image, name, price, description,rating,stock,category,color and size).
  - Mark/unmark a product as a favorite.
  
- Favorites are persisted using `get_storage`.

## State Management
This project uses **Flutter bloc** for state management, making it easy to manage the product list, search functionality, and favorites.

## Architecture
The app follows a clean architecture with separation of concerns:
- `core` : Contains constants, utils
- `data`: contains models(e.g., `Product`) and data source(e.g., `http`)
- `domain/repositories`: Contains the API service responsible for fetching products.
- `presentation/bloc`: Includes logic for fetching and managing product state.
- `presentation/pages`: Contains the UI for the app (Product List, Product Details, wishlist).

## Setup Instructions

### Prerequisites
- Install Flutter: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)
- Set up an Android/iOS emulator or a physical device for testing.

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/hitanshu1/product_listing.git
   cd product_listing

